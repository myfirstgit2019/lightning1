trigger ClosedOpportunityTrigger2 on Opportunity (before insert, before update) {
	list<opportunity> oplist = new list<opportunity>(
        [select id,name from opportunity where stagename='closed won' and id in:trigger.new]);
    system.debug(oplist);
   list<task> tsk1 = new list<task>();
    for(opportunity o:  [select id,name from opportunity where stagename='closed won' and id in:trigger.new]){
        tsk1.add(new task( subject='Another test follow up', whatid=o.id));
       system.debug(trigger.new);
        system.debug(o.id);
    }
    insert tsk1;
}