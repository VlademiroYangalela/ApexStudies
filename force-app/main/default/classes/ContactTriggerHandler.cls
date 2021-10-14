public class ContactTriggerHandler {
    
    public static void OnBeforeInsert(){
        MudarIdioma();
        ValidarErroEmail();
        VerificaFonte();
        
    }
    
    
    public static void OnbeforeUpdate(){
        MudarIdioma();
        ValidarErroEmail();
        VerificaFonte();
    }
    
    public static void mudarIdioma(){
        for(Contact con : (list<contact>) trigger.new){
            
            //Usei uma condição para verifcar se o campo languages tá vazio e fazer o preechimento de Português caso seja True(vazio).
            //Busquei o metódo isBlank(Returns true if the specified String is white space, empty (''), or null; otherwise, returns false.)
            
            if(string.isBlank(con.Languages__c)){
                con.languages__c = 'Português';  
            } 
            
            else{
                con.languages__c = 'Francês';
            }      
                        
        }
        
        
    } 
    public static void ValidarErroEmail(){
        //List<contact> converte o sObject em lista de contato.
        for(Contact con : (list<contact>) trigger.new){
            if(string.isBlank(con.Email)){
                
                con.addError('O Campo Email é Obrigatório, populate it');
            }
        }
        
    }
    public static void VerificaFonte(){
        for(contact con: (list<contact>)Trigger.New){
            if(con.LeadSource == null){
                
                con.LeadSource = 'Outros';
            }
        }
    }
}