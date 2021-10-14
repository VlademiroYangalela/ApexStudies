@isTest
public class OpportunityAmountTest {
    @isTest static void OppAmountTest(){
        Opportunity opps = new Opportunity();
        opps.Name        = 'BlackShoes';
        opps.StageName   = 'Prospecting';
        opps.CloseDate   = Date.today();
        opps.Amount      = 10000;
    }

}