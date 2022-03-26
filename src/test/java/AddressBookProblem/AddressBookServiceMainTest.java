package AddressBookProblem;

import org.junit.jupiter.api.Test;
import org.testng.Assert;

import java.time.LocalDate;
import java.util.List;
import java.util.Map;

import static AddressBookProblem.AddressBookServiceMain.IOService.DB_IO;


public class AddressBookServiceMainTest {
    @Test
    public void givenAddressBookInDB_WhenRetrieved_ShouldMatchThePeopleCount() {
        AddressBookServiceMain addressBookService = new AddressBookServiceMain();
        List<AddressBookData> addressBookDataList = addressBookService.readAddressBookData(DB_IO);
        Assert.assertEquals(5,addressBookDataList.size());
    }

    @Test
    public void givenNewPhoneNumber_ShouldUpdateTheRecorAndSyncWithDataBase() throws AddressBookException {
        AddressBookServiceMain addressBookService = new AddressBookServiceMain();
        addressBookService.readAddressBookData(DB_IO);
        addressBookService.updateRecord("Rehan", "8147340736");
        boolean result = addressBookService.checkRecordSyncWithDB("Rehan");
        Assert.assertTrue(result);
    }

    @Test
    public void givenDate_ShouldRetrieveTheAddressBookRecord_BasedOnTheParticularRange() {
        AddressBookServiceMain addressBookService = new AddressBookServiceMain();
        addressBookService.readAddressBookData(DB_IO);
        LocalDate startDate = LocalDate.of(2018, 01, 01);
        LocalDate endDate = LocalDate.now();
        List< AddressBookData> employeePayrollData=
                addressBookService.readEmployeePayrollForDateRange(DB_IO, startDate, endDate);
        Assert.assertEquals(4,employeePayrollData.size());
    }

    @Test
    public void givenCity_ShouldRetrieveTheNumberOfContacts_BasedOnCity() {
        AddressBookServiceMain addressBookService = new AddressBookServiceMain();
        addressBookService.readAddressBookData(DB_IO);
        Map<String, Double> contactsByCity = addressBookService.contactsByCity(DB_IO);
        System.out.println(contactsByCity.containsKey("Belgaum")+" "+contactsByCity.containsValue(2.0));
        Assert.assertTrue(contactsByCity.containsKey("Belgaum") &&
                contactsByCity.containsValue(2.0));
    }

    @Test
    public void givenCity_ShouldRetrieveTheNumberOfContacts_BasedOnState() {
        AddressBookServiceMain addressBookService = new AddressBookServiceMain();
        addressBookService.readAddressBookData(DB_IO);
        Map<String, Double> contactsByState = addressBookService.contactsByState(DB_IO);
        System.out.println(contactsByState.containsKey("Karnataka")+" "+contactsByState.containsValue(2.0));
        Assert.assertFalse(contactsByState.containsKey("Karnataka") &&
                contactsByState.containsValue(2.0));
    }
}