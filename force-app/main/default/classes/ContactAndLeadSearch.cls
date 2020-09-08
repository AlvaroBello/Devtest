public with sharing class ContactAndLeadSearch {
    public static List<List< SObject>> searchContactsAndLeads( String search_c_l) 
    {
        
        List<List<sObject>> sosllist = [FIND :search_c_l IN ALL FIELDS 
                   RETURNING Contact(FirstName,LastName),Lead(FirstName,LastName)];

        return sosllist;
    }
}