global  class codeclass implements Schedulable {
   global void execute(SchedulableContext ctx)  {
       list<opportunity> oppty = [select name,leadsource from opportunity where leadsource='' limit 200];
    
    list<opportunity> oppupd = new list<opportunity>();

        for(opportunity o:oppty)    {
            o.leadsource ='Dreamforce';
            oppupd.add(o);
        }
    update oppupd;

   }
}