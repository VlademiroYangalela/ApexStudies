public class AccountTriggerHandler {
    
    public static void onBeforeInsert(){
        alteraClassificacao();
        validaErro();
    }
    
    public static void onBeforeUpdate(){
        alteraClassificacao();
        validaErro();
    }
    
    public static void onAfterUpdate(){
        alteraTelefoneContatos();
    }
    
    public static void onBeforeDelete(){
        verificaContatosRelacionados();
    }
    
    // a trigger sempre irá lidar com mais de um registro no trigger.new
    public static void alteraClassificacao(){
        
        // trigger.new é uma lista de registros adicionados/atualizados/excluídos recentemente: List<SObject> 
        // conversão de List<SObject> para List<Account>
        
        for(Account acc : (List<Account>) Trigger.new){
            acc.Rating = 'Warm';
            if(acc.Type == NULL){
                acc.Type = 'Prospect';
            }
        }
        
    }
    
    public static void validaErro(){
        
        for(Account acc : (List<Account>) Trigger.new ){
            if(acc.Active__c == 'No'){
                // addError é mais utilizado em execuções BEFORE
                acc.addError('Campo active deve ser diferente de "NO"');
            }
        }
    }
    
    //Um metódo que altera o telefone dos contactos, quando alteramos na conta
    public static void alteraTelefoneContatos(){
        
        //Usamos o set para não repetir os Ids da conta
        Set<Id> setAccountIds = new Set<Id>(); // sempre inicializar variareis do tipo set/list/map
        
        Map<Id, String> mapAccountPhones = new Map<Id, String>();
        for(Account acc : (List<Account>) Trigger.new){
            setAccountIds.add( acc.Id );
            mapAccountPhones.put( acc.Id, acc.Phone );
            
            // List<Contact> lstContact = [SELECT Id, Name, Phone, AccountId FROM Contact WHERE AccountId =: acc.Id]; => query dentro de for extremamente proibido, JAMAIS FAÇA
            // A solução é coletar os dados necessários e realizar a consulta FORA do for
        }
        system.debug('Set Size '+setAccountIds.size());
        //system.debug('List Size '+listAccountId.size());
        List<Contact> lstContact = [SELECT Id, Name, Phone, AccountId FROM Contact WHERE AccountId =: setAccountIds]; 
        List<Contact> lstContactUpdate = new List<Contact>();
        
        for(Contact ctt : lstContact){
            
            ctt.Phone = mapAccountPhones.get( ctt.AccountId );
            lstContactUpdate.add( ctt );
            
            // update ctt; => operação DML dentro de for é extremamente proibido, erro CRASSO
            // solução é agregar os registros em uma list/map e fazer a operação fora do FOR
        }
        
        System.debug(lstContact[0].Phone);
        System.debug(lstContactUpdate[0].Phone);
        
        update lstContactUpdate;
        // Database.update(lstContactUpdate);
        
    }
    
    public static void verificaContatosRelacionados(){
        
        Set<Id> setAccountIds = new Set<Id>();
        Map<Id, Integer> mapQuantidadeContato = new Map<Id, Integer>();
        
        for(Account acc : (List<Account>) Trigger.new){
            setAccountIds.add(acc.Id);
        }
       
        // sub query ou nested query = consulta onde se adquire os dados do objeto principal e do registro relacionado
        List<Account> lstAccount = [SELECT Id, (SELECT Id FROM Contacts) FROM Account WHERE Id =: setAccountIds];
        for(Account acc : lstAccount){
            mapQuantidadeContato.put(acc.Id, acc.Contacts.size());
        }
        
        for(Account acc : (List<Account>) Trigger.new){
            Integer quantidadeContato = mapQuantidadeContato.get(acc.Id);
            
            if(quantidadeContato > 0){
                acc.addError('Não é possível apagar registro onde existem contatos relacionados');
            }
        }
        
    } 
    
}