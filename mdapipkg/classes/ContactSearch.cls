public class ContactSearch {
     public static List<Contact> searchForContacts (String Lname, String mpostcode) {
         Contact[]	cntQry= [select Id, Firstname, Lastname  from contact where Lastname=:Lname and MailingPostalCode=:mpostcode];
         
         System.debug(cntQry.size());
		System.debug(cntQry);
        return cntQry;
    }
}