trigger AppleWatch on Opportunity (after insert) {
    for(Opportunity opp: Trigger.new){
        Task t        = new task();
        t.subject     = 'Apple Watch Promo';
        t.Description = 'send them one ASAP';
        t.Priority    = 'High';
        //Qual Id vai ser atualizado ou criado a tarefa? no Caso no Id da Oportunidade.
        t.WhatId      = opp.Id;
        insert t;
                
    }
    
}