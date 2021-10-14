@isTest
public class WarrantySummaryCase {

    @isTest static void CaseTest (){

        Case casos = new case();
        casos.Product_Purchase_Date__c         = Date.today();
        casos.Product_Total_Warranty_Days__c   = 10;
        casos.Product_Has_Extended_Warranty__c = true;
        insert casos;

    }
    
}
