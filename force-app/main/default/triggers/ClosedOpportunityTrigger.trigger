trigger ClosedOpportunityTrigger on Opportunity (After insert, after update) {
	
    List<Task> TaskList = new List<Task>();
    
    	for(Opportunity Opp: Trigger.new){
            if(opp.StageName == 'Closed Won'){
                taskList.add(new task(Subject ='Follow Up Test Task',
                               whatId = Opp.Id));
        }     
    }
    
    if(taskList.size() > 0){
         insert taskList;
    }
}