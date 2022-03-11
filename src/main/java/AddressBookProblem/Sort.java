package AddressBookProblem;

import java.util.Comparator;

public class Sort {
    static Comparator<Contacts> compareCity = new Comparator<Contacts>() {
        public int compare(Contacts one, Contacts two) {
            return one.getCity().compareTo(two.getCity());
        }
    };

}