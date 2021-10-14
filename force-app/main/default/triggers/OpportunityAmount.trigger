trigger OpportunityAmount on Opportunity (before insert) {
    for(Opportunity opp: Trigger.new){
        if(opp.Amount==null && opp.Probability ==10){
            opp.Amount      = 10000;
            opp.Probability = (20);
            opp.NextStep    = 'YES';
                       
        }
        
    }
    
}