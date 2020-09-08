@isTest
private class TestRestrictContactByName {

    @IsTest static void  metodoTest() 
    {
    
        List<Contact> listContact= new List<Contact>();
        Contact c1 = new Contact(FirstName='Rebbeca', LastName='Goncalves' , email='lachibi@test.com');
        Contact c2 = new Contact(FirstName='Alvaro', LastName = 'INVALIDNAME',email='elchibi@test.com');
        listContact.add(c1);
        listContact.add(c2);
        
        Test.startTest();
            try
            {
                insert listContact;
            }
            catch(Exception ee)
            {
            }
        
        Test.stopTest(); 
        
    }
    
}