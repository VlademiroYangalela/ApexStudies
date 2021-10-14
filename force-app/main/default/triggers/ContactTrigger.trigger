trigger ContactTrigger on Contact (Before insert, before update) {
    
    if(Trigger.Isbefore){
        if(Trigger.IsInsert){
            ContactTriggerHandler.OnBeforeInsert();
        }
    
    }
if(Trigger.Isbefore){
        if(Trigger.IsUpdate){
            ContactTriggerHandler.OnbeforeUpdate();
        }
    
    }
}