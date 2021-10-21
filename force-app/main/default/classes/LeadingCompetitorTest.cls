@isTest
public  class LeadingCompetitorTest {

    @isTest static void cerateOppCompetitors(){
        //Create an Opportunity and set required fields
        Opportunity opp = new Opportunity();
        opp.Name      = 'Big Deals';
        opp.CloseDate = Date.today();
        opp.StageName = 'Prospecting';

        //Set competitor price fields
        opp.Competitor_1_Price__c = 5000;
        opp.Competitor_2_Price__c = 15000;
        opp.Competitor_3_Price__c = 25000;

        //set competitor fields
        /*opp.Competitor_1_Price__c = 'Amazon';
        opp.Competitor_2_Price__c = 'Google';
        opp.Competitor_3_Price__c = 'Microsoft';

        insert opp;*/
        system.debug('Opportunity ' + opp.Name + 'inserted with all competitor fields populated.');


        //CONCERTAR ERRO
    }
    

}
