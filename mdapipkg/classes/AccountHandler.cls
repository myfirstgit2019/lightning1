public class AccountHandler {
   public static Account insertNewAccount(String AccntName)	{
        Account		NewAccnt= new Account(Name=AccntName);
        System.debug('NewAccnt');
        try	{
            insert NewAccnt;
            
        }	catch (DmlException e)	{
            	System.debug('DML Error: ' + e.getMessage());
            	return NULL; 
        }
    // insert was succesfull
    	ID accntID = NewAccnt.ID;
        System.debug(accntID);
        return NewAccnt;
    }
}