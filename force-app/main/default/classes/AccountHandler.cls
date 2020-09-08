public class AccountHandler {
    public static void insertAccount(integer i){

        Integer a=0;
        List<Account> addAccounts = new List<Account>();
            while(a < 3)
            {
                Account b = new Account();
                b.Name = 'Acme Inc ' + a;
                b.AccountNumber = 'A000' + a;
            
                addAccounts.add(b);
                a++;
            }
            
            insert addAccounts;
    }
}