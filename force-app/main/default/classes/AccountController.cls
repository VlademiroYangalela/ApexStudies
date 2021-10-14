public class AccountController {
    
    //Metódo que vai inserir uma lista de contas
    public static list<Account> insertAccount (list<account> accountToInsert){
        database.insert (accountToInsert);
        return accountToInsert;
        
    }
       //Metódo que vai inserir uma conta
     public static Account insertAccounts (account accountToInsert){
        database.insert (accountToInsert);
        return accountToInsert;
        
    }
       //Metódo que vai pegar todas as contas inseridas
    public static list<Account> getAllAccounts (){
        list<Account> accounts = [SELECT Name, Phone FROM Account];
        return accounts;
    }
    
       //Metódo que vai imprimir todas as contas
    public static void printAllAccounts(){
        list<Account> accounts = getAllAccounts();
        for(Account acc : accounts){
            system.debug('Account Name: '+acc.Name+' Account Phone: '+acc.Phone);
            
        }
    }
       //Metódo que vai pegar o tamanho da lista de conta
    public static Integer getAccountSize(){
        list<Account> accounts = getAllAccounts();
        return Accounts.size();
    }

}