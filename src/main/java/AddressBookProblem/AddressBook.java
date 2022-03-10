package AddressBookProblem;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Scanner;
public class AddressBook {
    Scanner scan = new Scanner(System.in);
    public List<Contacts> list = new ArrayList<>();
    public void operation() {
        System.out.println("Enter the number according to to requirment");
        System.out.println("Enter 1 to Add");
        System.out.println("Enter 2 to Edit");
        System.out.println("Enter 3 to Delete");
        int count = scan.nextInt();
        AddressBook addressBook = new AddressBook();
        int contactCount=1;
        while(contactCount<=count) {

            addressBook.add();
            contactCount++;
        }
        boolean status = true;
        do {
            switch (scan.nextInt()) {
                case 1:
                    add();
                    break;
                case 2:
                    edit();
                    break;
                case 3:
                    delete();
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

    public void edit() {
        System.out.println("Enter your First name:");
        String firstName = scan.next();

        Iterator<Contacts> iterator = list.listIterator();

        while (iterator.hasNext()) {
            Contacts contacts = iterator.next();

            if (firstName.equals(contacts.getFirstName())) {
                System.out.println("Choose field you want to add:");
                System.out.println("1.Last Name\t2.Address\t3.City\t4.State\t5. Zip\t6.Phone Number\t7.Email");
                switch (scan.nextInt()) {
                    case 1:
                        System.out.println("Re-Correct your Last Name");
                        contacts.setLastName(scan.next());
                        break;
                    case 2:
                        System.out.println("Re-Correct your Address");
                        contacts.setAddress(scan.next());
                        break;
                    case 3:
                        System.out.println("Re-Correct your City");
                        contacts.setCity(scan.next());
                        break;
                    case 4:
                        System.out.println("Re-Correct your State");
                        contacts.setState(scan.next());
                        break;
                    case 5:
                        System.out.println("Re-Correct your Zip");
                        contacts.setZip(scan.next());
                        break;
                    case 6:
                        System.out.println("Re-Correct your Phone Number");
                        contacts.setPhoneNumber(scan.next());
                    case 7:
                        System.out.println("Re-Correct your Email");
                        contacts.setEmail(scan.next());
                }

            }
        }
    }

    public void delete() {
        System.out.println("Enter your First name:");
        String firstName = scan.next();

        Iterator<Contacts> iterator = list.listIterator();
        while (iterator.hasNext()) {
            Contacts contacts = iterator.next();

            if (firstName.equals(contacts.getFirstName())) {
                list.remove(contacts);
            }
        }
    }

    public void print() {
        Iterator<Contacts> it = list.iterator();
        while (it.hasNext()) {
            System.out.println(it.next());
        }
    }
}