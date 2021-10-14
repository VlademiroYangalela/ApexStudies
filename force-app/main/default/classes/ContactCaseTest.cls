@isTest
public class ContactCaseTest {
    
    @isTest static void ContactCase(){
        Contact cont  = new Contact();
        cont.LastName  = 'Ciro Nogueira';
        cont.email     = 'teste@gmail.com';
        insert cont;
    }

}