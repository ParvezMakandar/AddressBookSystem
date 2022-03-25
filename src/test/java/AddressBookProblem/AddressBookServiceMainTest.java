package AddressBookProblem;

import org.junit.jupiter.api.Test;

import java.util.List;

import static AddressBookProblem.AddressBookServiceMain.IOService.DB_IO;
import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertTrue;

public class AddressBookServiceMainTest {
    @Test
    public void givenAddressBookInDB_WhenRetrieved_ShouldMatchThePeopleCount() {
        AddressBookServiceMain addressBookService = new AddressBookServiceMain();
        List<AddressBookData> addressBookDataList = addressBookService.readAddressBookData(DB_IO);
        assertEquals(5,addressBookDataList.size());
    }
    @Test
    public void givenNewPhoneNumber_ShouldUpdateTheRecorAndSyncWithDataBase() throws AddressBookException {
        AddressBookServiceMain addressBookService = new AddressBookServiceMain();
        addressBookService.readAddressBookData(DB_IO);
        addressBookService.updateRecord("Parvez", "8147340744");
        boolean result = addressBookService.checkRecordSyncWithDB("Parvez");
        assertTrue(result);
    }
}