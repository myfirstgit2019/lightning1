trigger OrderEventTrigger on Order_Event__e (after insert) {
	 List<task> tasks = new List<task>();
    
    // Get queue Id for case owner
//    Group queue = [SELECT Id FROM Group WHERE Name='Regional Dispatch' AND Type='Queue'];
       
    // Iterate through each notification.
    for (Order_Event__e event : Trigger.New) {
        system.debug('first loop');
        if (event.Has_Shipped__c == true) {
            system.debug('second loop');
            // Create Case to dispatch new team.
            task tsk = new Task();
            tsk.Priority = 'Medium';
            tsk.Subject =  'Follow up on shipped order ' + event.Order_Number__c;
            tsk.OwnerId = event.CreatedById;
            system.debug(tsk);
            tasks.add(tsk);
        }
   }
    insert tasks;
    
}