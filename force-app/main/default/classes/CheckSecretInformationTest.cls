@isTest
public class CheckSecretInformationTest {
    
    @isTest static void createCaseWithSecretInfo(){
        //Create a case with all required inpouts
        Case myCase        = new Case();
        myCase.Subject     = 'Help';
        myCase.Description = 'My bodyweight is 180 pounds';
        insert myCase;
        system.debug('case' + myCase.Id + 'created with Description ' + myCase.Description);
    }
}
