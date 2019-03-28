global class Leadprocessor implements 
Database.Batchable<sObject>, Database.Stateful	{
    global Integer recordsProcessed = 0;

    global database.QueryLocator start(Database.BatchableContext bc)	{
        return Database.getQueryLocator('select id, leadsource from lead');
        
    }

    global void execute(Database.BatchableContext bc, List<lead> scope){
    	list<lead>	ld = new list<lead>();
        for(lead l:scope)	{
            l.leadsource = 'Dreamforce';
            ld.add(l);
            recordsprocessed = recordsprocessed + 1 ;
            
        }
        update ld;
}
    
    global void finish(database.BatchableContext bc)	{
        system.debug( recordsprocessed + 'records processed'); 
        
           AsyncApexJob job = [SELECT Id, Status, NumberOfErrors, 
            JobItemsProcessed,
            TotalJobItems, CreatedBy.Email
            FROM AsyncApexJob
            WHERE Id = :bc.getJobId()];
        system.debug( job.JobItemsProcessed);
        system.debug(job.TotalJobItems);
        
        
    }
    
}