public class ContactAndLeadSearch {
    public static List<List<sObject>> searchContactsAndLeads( String QryStr)	{
        List<List<sObject>> searchList = [FIND :QryStr IN NAME FIELDS RETURNING  Contact( FirstName,LastName), Lead(Firstname, Lastname)];
        
        return searchList;
        
    }
}