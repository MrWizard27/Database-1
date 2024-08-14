import java.sql.*;
import java.util.Scanner;

public class OptimisticConnection {

    private static String user = "mplafcan";
    private static String pass = "";

    public static void signin() {
        Scanner input = new Scanner(System.in);
        System.out.println("Please enter your username: ");
        user = input.nextLine();
        System.out.println("Please enter your password: ");
        pass = input.nextLine();
        
        try {
            createConnection();
            System.out.println("Connection successful!");
        } catch (SQLException throwables) {
            System.err.println("Failed to create connection!");
            System.exit(0);
        }
    }

    static {
        try {
            DriverManager.registerDriver(new oracle.jdbc.driver.OracleDriver());
        } catch (SQLException throwables) {
            throwables.printStackTrace();
            System.err.println("Failed to register oracle driver!");
        }
    }

    private static Connection conn = null;

    private static Owner originalRowImage = null;

    public static Owner getOwner(int OwnerID) {
        Statement stmt = null;
        ResultSet rset = null;
        try {
            // Check whether connection is closed, and, if so, reestablish it.
            if (conn == null || conn.isClosed()) {
                createConnection();
            }
            // Otherwise, the same connection can be reused

            stmt = conn.createStatement();
            conn.setAutoCommit(false); // Important!

            String query = "Select OwnerID, lname, fname, phone, balance "
                    + "from owners "
                    + "where OwnerID = '" + OwnerID + "'" + " for update";
            
            //System.out.println(query);

            rset = stmt.executeQuery(query);

            Owner owner = null;
            while (rset.next()) {
                owner = new Owner(
                        rset.getString("OwnerID"),
                        rset.getString("lname"),
                        rset.getString("fname"),
                        rset.getString("phone"),
                        rset.getInt("balance")
                );
            }

            // Save a copy of the original return value of the most recent SQL, so that we can check it later
            // to see if it has changed
            if (owner != null) {
                originalRowImage = owner.clone();
            }
            else {
                originalRowImage = null;
            }

            return owner; // null if not found.
        }
        catch (SQLException e) {
            e.printStackTrace();
        }
        finally {  // Close the resources that we used for the select query. Leave the connection open though.
            try {
                if (rset != null) rset.close();
                if (stmt != null) stmt.close();
            } catch (SQLException se) {
                se.printStackTrace();
                System.err.println("Failed to close resources");
            }
        }
        return null;
    }

    
    /**
     * Our own Exception, which can be used to represent the situation where a modification occurred.
     * This allows us to inform the user that the data was updated, so they need to start over.
     */
    public static class ModificationDetectedException extends Exception {
        public ModificationDetectedException(String message) {
            super(message);
        }
    }

    public static void updateOwner(Owner e) throws SQLException, ModificationDetectedException {
        if (conn == null || conn.isClosed()) {
            throw new SQLException("Connection is closed, possibly due to a timeout. " +
                    "Please load owner again to establish a new connection!");
        }
        PreparedStatement ps = null;
        try {

            // Check for modification, and lock while doing so
            int ownerID = Integer.parseInt(e.getOwnerID());
            Owner originalOwner = null; // The owner from the original query we made before modifying it.
            if (originalRowImage != null) {
                originalOwner = originalRowImage.clone();
            }
            Owner newOwnerFromDB = getOwner(ownerID);
            if (newOwnerFromDB == null || !newOwnerFromDB.equals(originalOwner)) {
                // The row has changed, been deleted, etc.

                // Will still close the connection, due to the finally block running at the end.
                String oldString = originalOwner == null ? "null" : originalOwner.toString();
                String newString = newOwnerFromDB == null ? "null" : newOwnerFromDB.toString();
                throw new ModificationDetectedException("Originally the data was " + oldString +
                        ", but now it is " + newString + ". Another user has modified this" +
                        " row, and so you will have to start over. Changes rolled back.");
            }
            System.out.println("No changes detected... proceeding with update!");

            String updateDML = " UPDATE Owners " +
                    "SET " +
                    "LName = ?," +
                    "FName = ?," +
                    "Phone = ?," +
                    "Balance = ?" +
                    "WHERE OwnerID = ?";
            ps = conn.prepareStatement(updateDML);

            ps.setString(1, e.getLname());
            ps.setString(2, e.getFname());
            ps.setString(3, e.getPhone());
            ps.setInt(4, e.getBalance());
            ps.setString(5, e.getOwnerID());

            ps.execute();

            conn.commit(); // Release the locks
            System.out.println("Transaction successful");
        }
        finally {
            // Clean up resources. Once current owner is committed, a new connection will be established later
            System.out.println("Closing connection");
            if (ps != null) {
                ps.close();
            }
            if (conn != null) {
                conn.rollback();
                conn.close();
            }

        }
    }

    static void closeConnection() throws SQLException {
        if (conn != null) {
            conn.close();
        }
    }

    private static void createConnection() throws SQLException {
        conn = DriverManager.getConnection("jdbc:oracle:thin:@worf.radford.edu:1521:itec3", user, pass);
        conn.setAutoCommit(false); // Important!
    }
}


