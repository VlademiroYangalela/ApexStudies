trigger WarrantySummary on Case (before insert) {

String endingStatement      = 'Have a nice Day!';

for(Case myCase: Trigger.new){
//setar as variavéis para usar no campo sumarização
String purchaseDate           = myCase.Product_Purchase_Date__c.format();
String createdDate            = Datetime.now().format();
Integer warrantyDays          = myCase.Product_Total_Warranty_Days__c.intValue();
Decimal warrantyPercentage    = (100 * ( myCase.Product_Purchase_Date__c.daysBetween(Date.today()) / 
                                                myCase.Product_Total_Warranty_Days__c)).setScale(2);
Boolean hasExtendedWarranty   = myCase.Product_Has_Extended_Warranty__c;

//Preencher o campo sumário
myCase.Warranty_Summary__c  = 'Product purchased ' + purchaseDate + ' '
                            + 'and case created on ' + createdDate + '.\n'
                            + 'Warranty is for ' + warrantyDays + ' '
                            + 'Days and is ' + warrantyPercentage + ' % through its warranty period.\n'
                            + 'Extended Warranty: ' + hasExtendedWarranty + '\n'
                            + endingStatement;


    }

}