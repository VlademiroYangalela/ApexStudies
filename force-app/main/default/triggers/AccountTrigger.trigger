trigger AccountTrigger on Account (before insert, before update, before delete, after insert, after update, after delete, after undelete) {
        
    // Variavel de contexto IsInsert
    if(Trigger.isBefore){
        if(Trigger.isInsert){
            AccountTriggerHandler.onBeforeInsert();
        }
        if(Trigger.isUpdate){
            AccountTriggerHandler.onBeforeUpdate();
        }
    }
    else if(Trigger.isAfter) {
        if(Trigger.isUpdate) {
            AccountTriggerHandler.onAfterUpdate();
        }
    }
    else if(Trigger.isDelete){
        if(Trigger.isBefore){
            AccountTriggerHandler.onBeforeDelete();
        }
    }
    
    
}

/*
insert
update
delete
undelete
*/

/*
trigger before (before insert, before update, before delete)
trigger after (after insert, after update, after delete, after undelete)
*/

/*
INSERIR CONTA
before trigger >>>>> AÇÃO (insert, update, delete etc) >>>>>> after trigger

criar registros a mais, geralmente é no after
*/