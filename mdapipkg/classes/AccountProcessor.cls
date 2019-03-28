public class AccountProcessor {
    static integer x=-1;
@future
    public static void countContacts(list<id> acnt_id)	{
        list<id>	newlist = new list<id> {'0010O00002Ke53MQAR','0010O00002Ke8swQAB','0010O00002McDcOQAV'};
        
        list<contact>	cnta = new list<contact>(
        	[select id,accountid, account.id, account.Number_of_Contacts__c, account.name from  contact where account.id in :acnt_id ]);
        list<account> acnt = new list<account> (
        	[select id,name,Number_of_Contacts__c from account where id in :acnt_id]);

        list<account> acnt_upd = new list<account>();
        system.debug(cnta);
        system.debug(acnt);
        
        for(account a :acnt) {
            a.Number_of_Contacts__c = 0;      
             x++;
            for(contact c:cnta)	{
                if(c.accountid == a.id)	{
                    ++a.Number_of_Contacts__c ;
                    
                }
//             system.debug(a.Number_of_Contacts__c);   
            }
            acnt_upd.add(a);
//            acnt[x].Number_of_Contacts__c = a.Number_of_Contacts__c ;   
//           update a;       // wroooongg, dml ever loop iteration. very naughty.
        }
		update acnt_upd; 
        system.debug(acnt_upd);
    }
}