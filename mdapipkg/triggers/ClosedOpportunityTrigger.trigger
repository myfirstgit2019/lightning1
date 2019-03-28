trigger ClosedOpportunityTrigger on Opportunity (after insert ,before update) {
    list<opportunity> oppty = [select id, name from opportunity where stagename='Closed Won' and id in :Trigger.new]; 
    system.debug('oppty: ' + oppty);
    list<task> tk2 = new list<task>();
    for ( opportunity o : oppty)    {   
        system.debug('from for loop:' + o.id);  
        
         tk2.add( new task (Subject='Follow Up Test Task', whatId = o.Id)) ;
//        tk2.WhatId = o.Id;
        
    }
    insert tk2;
}