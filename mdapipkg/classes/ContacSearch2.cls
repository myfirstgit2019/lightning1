public class ContacSearch2 {
    public static list<contact> searchCont(String name, string zip1)	{
        list<contact>	cntret= new list<contact>();
        
        list<contact> cntorig= 
            [select id, firstname,lastname from contact where lastname=:name and MailingPostalCode=:zip1];
        system.debug(cntorig);
        return cntorig;
    }
}