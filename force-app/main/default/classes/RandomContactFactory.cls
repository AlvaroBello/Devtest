public class RandomContactFactory {
    public static List<Contact> generateRandomContacts(Integer count, String last_name) {
        List<Contact> contactList = new List<Contact>();
        
        for(Integer index = 1; index <= count; index++) {
            Contact c = new Contact();
            c.FirstName = 'Test'+index;
            c.LastName = last_name + index;
            contactList.add(c);
        }
        
        return contactList;
    }
}