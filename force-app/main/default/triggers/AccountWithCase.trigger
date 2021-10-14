trigger AccountWithCase on Account (after insert) {
    for(Account accounts: Trigger.New){
        case getCases    = new Case();
        getCases.subject = 'Help this customer with his needs';
        getCases.Description = 'Try to call to this customer';
        getCases.OwnerId     = '0055f000000ztYeAAI';
       	getCases.AccountId   = accounts.id;
        insert getCases;
        
    }

}