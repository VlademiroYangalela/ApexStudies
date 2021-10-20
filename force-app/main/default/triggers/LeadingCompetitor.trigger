//Trigger busca o menor preço das mercas que competem
trigger LeadingCompetitor on Opportunity (before insert, before update) {

for(Opportunity opp : Trigger.new){
        //Adicionar todos preços numa lista na ordem de competidores
    List<Decimal> competitorPrices = new List<Decimal>();
    competitorPrices.add(opp.Competitor_1_Price__c);
    competitorPrices.add(opp.Competitor_2_Price__c);
    competitorPrices.add(opp.Competitor_3_Price__c);

    //Adicionar todos competidores numa lista ordenada
    List<string> competitors = new List<String>();
    competitors.add(opp.Competitor_1__c);
    competitors.add(opp.Competitor_2__c);
    competitors.add(opp.Competitor_3__c);


    //Percorra todos os concorrentes para encontrar a posição de menor preço
    Decimal lowestPrice;
    integer lowestPricePosition;
    for(integer i = 0; i < competitorPrices.size(); i++){
        Decimal currentPrice = competitorPrices.get(i);
             if(lowestPrice == null || currentPrice < lowestPrice){
                lowestPrice = currentPrice;
                lowestPricePosition = i;
             }

        }

        opp.Leading_Competitor__c = competitors.get(lowestPricePosition);
    }
        /*Decimal highestPrice;
        Integer highestPricePosition;
        for(integer i = 0; i > competitorPrices.size(); i++){

            Decimal currentPrice  = competitorPrices.get(i);
            if(highestPricePosition == null || currentPrice > highestPrice){
                highestPrice = currentPrice;
                highestPricePosition = i;

            }
        
        }
                opp.Lead_Highest_Price__c = competitors.get(highestPricePosition);*/

    }

//TAREFA : PREENCHER O PREÇO MAIS ALTO EM OUTRO CAMPO OU SEJA CRIAR OUTRO CAMPO PARA 
//RECEBER O PREÇO MAIS ALTO