package AddressBookProblem;

import com.google.gson.Gson;
import com.opencsv.CSVReader;
import com.opencsv.CSVReaderBuilder;
import com.opencsv.bean.StatefulBeanToCsv;
import com.opencsv.bean.StatefulBeanToCsvBuilder;
import com.opencsv.exceptions.CsvDataTypeMismatchException;
import com.opencsv.exceptions.CsvRequiredFieldEmptyException;
import com.opencsv.exceptions.CsvValidationException;
import java.io.*;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.*;

public class AddressBookP
{
    static ArrayList<ContactPersons> persons = new ArrayList<>();
    public static HashMap<String, ArrayList<ContactPersons>> personByState;
    public static HashMap<String, ArrayList<ContactPersons>> personByCity;
    static Scanner scanner = new Scanner(System.in);
    static int counter;
    private static int indexOfPerson;


    public AddressBookP() {
        personByCity = new HashMap<>();
        personByState = new HashMap<>();
    }

    public static void readData() {
        System.out.println("Add person details...");
        ContactPersons person = new ContactPersons(null);
        System.out.println("Enter person first name: ");
        person.setFirstName(scanner.next());
        String result = person.getFirstName();
        boolean flag = checkDuplicate(result);
        if (flag) {
            System.out.println("Person is already exist");
        } else {
            System.out.println("Enter person last name: ");
            person.setLastName(scanner.next());
            System.out.println("Enter mobile number: ");
            person.setPhoneNumber(scanner.next());
            System.out.println("Enter address Details: ");
            System.out.println("Enter address: ");
            person.setAddress(scanner.next());
            System.out.println("Enter city: ");
            person.setCity(scanner.next());
            System.out.println("Enter State name: ");
            person.setState(scanner.next());
            System.out.println("Enter zip: ");
            person.setZipCode(scanner.nextInt());
            persons.add(person);
            System.out.println();
            System.out.println("Person added");
            counter++;

            if (!personByState.containsKey(person.getState())) {
                personByState.put(person.getState(), new ArrayList<>());
            }
            personByState.get(person.getState()).add(person);

            if (!personByCity.containsKey(person.getCity())) {
                personByCity.put(person.getCity(), new ArrayList<>());
            }
            personByCity.get(person.getCity()).add(person);

        }
    }

    public void display() {
        for (ContactPersons person2 : persons)
            System.out.println(person2);
    }


    static void editContactPerson() {
        if (counter > 0) {
            System.out.println("Enter Persons FirstName you want to edit: ");
            String searchName = scanner.next();
            indexOfPerson = 0;
            boolean isFoundPerson = false;

            for (int i = 0; i < persons.size(); i++) {
                if (persons.get(i).getFirstName().equals(searchName)) {
                    isFoundPerson = true;
                    indexOfPerson = i;
                    break;
                }
            }
            if (isFoundPerson) {

                System.out.print("\nEnter new address: ");
                persons.get(indexOfPerson).setAddress(scanner.next());
                System.out.println("Enter new city for searchName: ");
                persons.get(indexOfPerson).setCity(scanner.next());
                System.out.println("Enter new zip: ");
                persons.get(indexOfPerson).setZipCode(scanner.nextInt());
                System.out.println("Enter mobile number: ");
                persons.get(indexOfPerson).setPhoneNumber(scanner.next());
                persons.get(indexOfPerson).setFirstName(searchName);
                System.out.println("Enter Last Name: ");
                persons.get(indexOfPerson).setLastName(scanner.next());
                System.out.println();
                System.out.println("Edit completed");

            } else
                System.out.println("No person found with this searchName");
        } else
            System.out.println("There is no record to edit");

    }

    public static void deletePerson() {
        if (counter > 0) {
            System.out.println("Enter Persons FirstName you want to delete: ");
            String searchName = scanner.next();
            indexOfPerson = 0;
            boolean isFoundPerson = false;

            for (int i = 0; i < persons.size(); i++) {
                if (persons.get(i).getFirstName().equals(searchName)) {
                    isFoundPerson = true;
                    indexOfPerson = i;
                    break;
                }
            }
            if (isFoundPerson) {
                persons.remove(indexOfPerson);
                counter--;
                System.out.println();
                System.out.println("Delete completed");
            } else
                System.out.println("No person found with this name");
        } else
            System.out.println("No records to delete");
    }


    private static boolean checkDuplicate(String fname) {
        int flag = 0;
        for (ContactPersons person1 : persons) {
            if (person1.getFirstName().equals(fname)) {
                flag = 1;
                break;
            }
        }
        return flag == 1;
    }

    public void getPersonNameByState(String State) {
        List<ContactPersons> list = persons.stream().filter(contactName -> contactName.getState().equals(State)).toList();
        for (ContactPersons contact : list) {
            System.out.println("First Name: " + contact.getFirstName());
            System.out.println("Last Name: " + contact.getLastName());
        }

    }

    public void getPersonNameByCity(String cityName) {
        List<ContactPersons> list = persons.stream().filter(contactName -> contactName.getCity().equals(cityName)).toList();
        for (ContactPersons contact : list) {
            System.out.println("First Name: " + contact.getFirstName());
            System.out.println("Last Name: " + contact.getLastName());
        }
    }

    public static void writeData() {
        StringBuffer personBuffer = new StringBuffer();
        persons.forEach(person -> {
            String personDataString = person.toString().concat("\n");
            personBuffer.append(personDataString);
        });
        try {
            Files.write(Paths.get("Output.txt"), personBuffer.toString().getBytes());

        } catch (IOException e) {
            e.printStackTrace();

        }
    }

    public static void readFileData() {
        try {
            Files.lines(new File("Output.txt").toPath()).map(String::trim).forEach(System.out::println);

        } catch (IOException e) {
            e.printStackTrace();

        }
    }

    public static void writeDataToCSV() throws IOException, CsvDataTypeMismatchException, CsvRequiredFieldEmptyException {
        try (Writer writer = Files.newBufferedWriter(Paths.get("Output.csv"))) {
            StatefulBeanToCsvBuilder<ContactPersons> builder = new StatefulBeanToCsvBuilder<>(writer);
            StatefulBeanToCsv<ContactPersons> beanWriter = builder.build();
            beanWriter.write(persons);
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    public static void readDataUsingCSV() throws IOException, CsvValidationException {
        try (Reader reader = Files.newBufferedReader(Paths.get("Output.csv"));
             CSVReader csvReader = new CSVReaderBuilder(reader).withSkipLines(1).build()) {
            String[] nextRecord;
            while ((nextRecord = csvReader.readNext()) != null) {
                System.out.println("First Name - " + nextRecord[3]);
                System.out.println("Last Name - " + nextRecord[4]);
                System.out.println("Address - " + nextRecord[0]);
                System.out.println("City - " + nextRecord[2]);
                System.out.println("State - " + nextRecord[6]);
                System.out.println("Phone - " + nextRecord[5]);
                System.out.println("Zip - " + nextRecord[7]);
            }
        }
    }

    public static void writeDataInJSon() throws IOException {
        {
            Path filePath = Paths.get("Output.json");
            Gson gson = new Gson();
            String json = gson.toJson(persons);
            FileWriter writer = new FileWriter(String.valueOf(filePath));
            writer.write(json);
            writer.close();
        }
    }

    public static void readDataFromJson() throws IOException {
        ArrayList<ContactPersons> contactList;
        Path filePath = Paths.get("Output.json");
        try (Reader reader = Files.newBufferedReader(filePath)) {
            Gson gson = new Gson();
            contactList = new ArrayList<>(Arrays.asList(gson.fromJson(reader, ContactPersons[].class)));
            for (ContactPersons contact : contactList) {
                System.out.println("Firstname : " + contact.getFirstName());
                System.out.println("Lastname : " + contact.getLastName());
                System.out.println("Address : " + contact.getAddress());
                System.out.println("City : " + contact.getCity());
                System.out.println("State : " + contact.getState());
                System.out.println("Zip : " + contact.getZipCode());
                System.out.println("Phone number : " + contact.getPhoneNumber());
            }

        }
    }
}