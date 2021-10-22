trigger DedupeLead on Lead (before insert) {
    for(Lead myLead: Trigger.new){
if(myLead.Email != null){
        //Encontrar contactos que fazem Match
        List<Contact> matchingContacts = [SELECT Id,
                                                FirstName,
                                                LastName,
                                                Account.Name
                                            FROM Contact
                                            WHERE Email = :myLead.Email];
        System.debug(matchingContacts.size() + 'contact (s) found.');

        //Se encontrar contactos com 
        if(!matchingContacts.isEmpty()){
            //Atribuir o lead para a fila do dados de qualidade
            if(!dataQualityGroup.isEmpty()){
                myLead.OwnerId = dataQualityGroup.get(0).Id;
            }
            Group dataQualityGroup = [SELECT Id
                                        FROM Group
                                        WHERE DeveloperName = 'Data_Quality'
                                        LIMIT 1];
            MYlEAD.oWNERiD = dataQualityGroup.Id;

            //Adicionar o contato do dedupe
            string dupeContactsMessage = 'Duplicate contacts(s) found:\n';
            for(Contact matchingContact : matchingContacts){
                dupeContactsMessage += matchingContact.FirstName + ''
                                    + matchingContact.LastName + ', '
                                    + matchingContact.Account.Name + ' ('
                                    + matchingContact.Id + ')\n';

            } 
            if(myLead.Descriptiopn != null){
                dupeContactsMessage +='\n' + myLead.Description;

            }
                myLead.Description = dupeContactsMessage + '\n' + myLead.Description;
        }

     }

    }

}