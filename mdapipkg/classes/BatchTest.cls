@isTest
public  class BatchTest {
    public static String CRON_EXP = '0 0 0 15 3 ? 2022';
    static testmethod void testScheduledJob() {
          List<Lead> Leadx = new List<Lead>();
          for(integer i=0;i<200;i++)    {
            lead l = new lead( lastname='Franky', Company='TestComp ' + i) ;
            Leadx.add(l);
          }
          insert Leadx;


        Test.startTest();
            String jobID =  System.schedule('ScheduledApexTest', CRON_EXP,new codeclass());
      
        Test.stopTest();

// Validate results
    list<lead> ld_res = [select id, name, leadsource from lead];
    system.assertEquals(200, ld_res.size());        

}

}