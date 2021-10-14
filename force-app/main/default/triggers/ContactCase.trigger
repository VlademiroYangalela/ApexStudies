trigger ContactCase on Contact (after insert) {
    
    for(Contact con : Trigger.new){
        
        case c      = new case ();
        c.Subject   = 'Ligar para o cliente';
        c.Priority  = 'High';
        c.Status    = 'New';
        c.ContactId = con.Id;
        insert c;
        
    }
    
}