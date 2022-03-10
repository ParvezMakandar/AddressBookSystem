package AddressBookProblem;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Scanner;

public class AddressBook {
    Scanner scan = new Scanner(System.in);
    private final List<Contacts> list = new ArrayList<>();

    public void operation() {
        boolean status = true;
        do {
            System.out.println("Enter the number according to to requirement");
            System.out.println("Enter 1 to Add");
            switch (scan.nextInt()) {
                case 1:
                    add();
                    break;
            }
        } while (status);
    }

    public void add() {
        Contacts contacts = new Contacts();
        System.out.println("Enter the First name:");
        String firstName = scan.next();
        contacts.setFirstName(firstName);

        System.out.println("Enter the Last name:");
        String lastName = scan.next();
        contacts.setFirstName(lastName);

        System.out.println("Enter the address:");
        String address = scan.next();
        contacts.setFirstName(address);

        System.out.println("Enter the City:");
        String city = scan.next();
        contacts.setCity(city);

        System.out.println("Enter the State:");
        String state = scan.next();
        contacts.setAddress(state);

        System.out.println("Enter the Pin Code:");
        String zip = scan.next();
        contacts.setZip(zip);

        System.out.println("Enter the Phone Number:");
        String phoneNumber = scan.next();
        contacts.setPhoneNumber(phoneNumber);

        System.out.println("Enter the Email");
        String email = scan.next();
        contacts.setEmail(email);
        list.add(contacts);
        print();

    }

    public void print() {
        Iterator<Contacts> it = list.iterator();
        while (it.hasNext()) {
            System.out.println(it.next());
        }
    }
}