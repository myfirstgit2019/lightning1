@isTest
public class AccountProcessorTest {
@isTest
    private static void TestAccountproc()	{
//        list<id>	newlist = new list<id> {'0010O00002Ke53MQAR','0010O00002Ke8swQAB','0010O00002McDcOQAV'};
         account 	tstacnt = new account(name='TestAccnt', Number_of_Contacts__c=0);   
        account 	tstacnt2 = new account(name='TestAccnt2', Number_of_Contacts__c =0);   
        insert(tstacnt);
        insert(tstacnt2);
        list<contact>	TstCnt = new list<contact>();
        
        for(integer x=0; x<5;x++){
            contact	cnt = new contact(firstname='Jimmy '+ (x) , lastname='Hollywood');
            if(x<2)	{
                cnt.AccountId = tstacnt.Id;
            }
            else cnt.AccountId = tstacnt2.Id;
                
            TstCnt.add(cnt);
        }
        insert tstcnt;
        list<id>	newlist = new list<id> {tstacnt.Id,tstacnt2.Id};
// the testing can begin
		Test.startTest(); 
        Accountprocessor.countContacts(newlist);

        Test.stopTest();
        List<account> acc1 = new List<account>([select Number_of_Contacts__c from account where id = :newlist]);
        system.debug(acc1);
        system.assertEquals(2,acc1[0].Number_of_Contacts__c);
        system.assertEquals(3,acc1[1].Number_of_Contacts__c);
/*        
        system.debug(tstacnt);
        system.debug(tstacnt.Number_of_Contacts__c);
        system.debug(tstacnt2.Number_of_Contacts__c);
        System.assertEquals(2,tstacnt.Number_of_Contacts__c );
        System.assertEquals(tstacnt2.Number_of_Contacts__c , 3);
*/
    }
}