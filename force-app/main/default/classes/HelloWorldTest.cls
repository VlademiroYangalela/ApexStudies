@isTest
public class HelloWorldTest {
    
    @isTest static void UpdateLead(){
        Lead mylead = new Lead();
        myLead.FirstName = 'Domingos';
        mylead.LastName  = 'Junior';
        mylead.Company   = 'Vix Company';
        mylead.Status    = 'Open - Not Contacted';
        insert mylead;
        
        mylead.Company   = 'pluralsight';
        update mylead;
        
    }

}