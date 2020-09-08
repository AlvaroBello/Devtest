public with sharing class ContactSearch {
    public static List<Contact> searchForContacts(string last_name, string code)
    {
        List<Contact> test_contact = [SELECT ID,Name FROM Contact WHERE LastName =:last_name AND MailingPostalCode =:code]; 
        // SOQL es: Seleccionar algo de algun objeto donde se buscan parameetros en especifico
        return test_contact;
    }
}