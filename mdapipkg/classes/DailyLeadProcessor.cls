global  class DailyLeadProcessor implements Schedulable {
   global void execute(SchedulableContext ctx)  {
       list<Lead> oppty = [select name,leadsource from Lead where leadsource='' limit 200];
    
    list<Lead> oppupd = new list<Lead>();

        for(Lead o:oppty)    {
            o.leadsource ='Dreamforce';
            oppupd.add(o);
        }
    update oppupd;

   }
}