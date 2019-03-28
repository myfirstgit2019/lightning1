public class AddPrimaryContact implements queueable {

    private list<account>	accounts = new list<account>();
    private ID	parent;
    private contact	cont1 = new contact();
    private string state ; 
    
    public   AddPrimaryContact(contact cont , string ste)	{
//        accounts = [select id,name,billingstate from account where billingstate= :state limit 200];
         this.cont1 = cont; 
        this.state = ste;  
    }
    
    public void execute(QueueableContext context)	{
        list<account> acntlist = new list<account>([select id,name,billingstate from account where billingstate= :state limit 200]);
     	list<contact> cntlist = new list<contact>();
        
        for (account a:acntlist)	{
            contact ctmp = cont1.clone(false,true,false,true);
            
            ctmp.AccountId = a.id;
            cntlist.add(ctmp);
            
        }
		insert cntlist;        
    }
    
}