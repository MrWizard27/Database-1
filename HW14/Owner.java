import java.util.Objects;
public class Owner {

    private String OwnerID, Lname, Fname, Phone;
    private int Balance;



    public String getOwnerID() {
        return OwnerID;
    }




    public Owner(String OwnerID, String lname, String fname, String phone, int balance) {
        this.OwnerID = OwnerID;
        this.Lname = lname;
        this.Fname = fname;
        this.Phone = phone;
        this.Balance = balance;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        Owner owner = (Owner) o;
        return Balance == owner.Balance && Objects.equals(OwnerID, owner.OwnerID)
                && Objects.equals(Lname, owner.Lname)
                && Objects.equals(Fname, owner.Fname)
                && Objects.equals(Phone, owner.Phone);
    }

    @Override
    public String toString() {
        return "Owner{" +
                "OwnerID='" + OwnerID + '\'' +
                ", Lname='" + Lname + '\'' +
                ", Fname='" + Fname + '\'' +
                ", Phone='" + Phone + '\'' +
                ", Balance=" + Balance +'\'' +
                '}';
    }

    @Override
    public Owner clone() {
        return new Owner(OwnerID, Lname, Fname, Phone, Balance);
    }


    /*
    Getters and setters
     */

    public String getLname() {
        return Lname;
    }

    public String getFname() {
        return Fname;
    }

    public String getPhone() {
        return Phone;
    }

    public int getBalance() {
        return Balance;
    }

    public void setBalance(int balance) {
        Balance = balance;
    }
}

