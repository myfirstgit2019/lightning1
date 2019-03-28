@isTest
public class AddPrimaryContactTest {
@testsetup
    static void setup()	{
        
        list<account>	acnt_ny_ca = new list<account>();

        
        contact	cnt = new contact(firstname='Jake', lastname='Allen');
 		insert cnt;
        for(integer i =0; i<50;i++)	{
            acnt_ny_ca.add(new account( name='Test NY' +i , BillingState='NY'));
        }
         for(integer i =0; i<50;i++)	{
            acnt_ny_ca.add(new account( name='Test CA' +i , BillingState='CA'));
        }
        insert acnt_ny_ca;
    }
    
    static testmethod void testQueueable()	{
        list<account>	Testaccounts= ([select id,name from account where name like 'test%']);
        contact 	cnt =[select firstname,lastname from contact limit 1];
        
        AddPrimaryContact 	AddPrimTest = new AddPrimaryContact(cnt, 'CA');
        Test.startTest();
        System.enqueueJob(AddPrimTest);
        Test.stopTest();
        list<account> assertList = [select name , (select firstname, lastname from contacts where firstname ='jake') from account where billingstate ='CA'];
//        system.assertEquals(50,[select name , (select firstname, lastname from contacts where firstname ='jake') from account where billingstate ='CA']);
 		system.assertEquals(50,assertlist.size());
    }
    
}