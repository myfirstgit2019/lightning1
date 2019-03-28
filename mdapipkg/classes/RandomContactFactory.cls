public class RandomContactFactory {
    public static list<contact> generateRandomContacts(integer nme, String Lastn) { 
    	list<contact> newlst = new list<contact>();
        for(integer i=0; i<= (nme-1); i++)	{
            contact c= new contact(Firstname='TestUsr '+ string.valueOf(i) , LastName='Lastn');
            newlst.add(c );
            System.debug(c);
            System.debug(newlst.get(i));
            
            
        }
        System.debug(newlst);
        return newlst;
    }
}