import java.util.Scanner;
import java.sql.*;

public class Driver {
    public static void main(String[] args) {
        Scanner input = new Scanner(System.in);

        OptimisticConnection.signin();

        System.out.println("Please input an id");
        int id = input.nextInt();
        Owner owner =  OptimisticConnection.getOwner(id);
        System.out.println(owner.toString());
        System.out.println("What is the new balance?");
        int balance = input.nextInt();
        owner.setBalance(balance);
        System.out.println(owner.toString());

        try {
            OptimisticConnection.updateOwner(owner);
        } catch (SQLException e) {
            e.printStackTrace();
        } catch (OptimisticConnection.ModificationDetectedException e) {
            e.printStackTrace();
        }

        finally {
            input.close();
        }

    }

}
