@isTest
public class LeadProcessorTest {
 @testSetup 
    static void setup() {
        List<lead> leads = new List<lead>();

        // insert 10 accounts
        for (Integer i=0;i<200;i++) {
            leads.add(new lead( lastname =('jakes' +i), company='monfunto',
                leadsource='New York' +i));
        }
        insert leads;
        // find the account just inserted. add contact for each

    }
    static testmethod void test() {        
        Test.startTest();
        leadprocessor uca = new leadprocessor();
        Id batchId = Database.executeBatch(uca);
        Test.stopTest();
        // after the testing stops, assert records were updated properly
        System.assertEquals(200, [select count() from lead where leadsource = 'Dreamforce']);
    }
    
}