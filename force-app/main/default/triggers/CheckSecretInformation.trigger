trigger CheckSecretInformation on Case (after insert, before update) {
    string childCaseSubject = 'Warning: Parent case may contain secrect info';
    
    //step 1: Criar uma coleção contendo cada chave secreta
    Set<String> secretKeywords = new Set<String>();
    secretKeywords.add('Credit Card');
    secretKeywords.add('Social Security');
    secretKeywords.add('SSN');
    secretKeywords.add('Passaport');
    secretKeywords.add('Bodyweight');

    
    //step 2: Checar pra ver se os nossos casos contém alguma das nossas chaves secretas
    List<Case> casesWithSecretInfo = new List<Case>();
    for(Case myCase: Trigger.new){
        if(myCase.Subject != childCaseSubject){
        for(String keyword: secretKeywords){
            if(myCase.Description != null && myCase.Description.containsIgnoreCase(keyword)){
                casesWithSecretInfo.add(myCase);
                system.debug('Case ' + myCase.Id + 'include secret keyword ' + keyword);
                break;

               }
             }
          }
        }
    // Se o nosso caso conter uma chave secreta, criar um caso filho
    for(Case caseWithSecretInfo : casesWithSecretInfo){
        Case childCase        = new Case();
        childCase.subject     = childCaseSubject;
        childCase.parentId    = caseWithSecretInfo.Id;
        childCase.IsEscalated = true;
        childCase.Priority    = 'High';
        childCase.Description = 'At least one of the following keywords were found ' + secretKeywords;
        
        insert childCase;

    }
}