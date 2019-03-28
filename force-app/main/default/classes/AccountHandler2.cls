public  class AccountHandler2 {

    public static account insertnewacc(string str1)	{
        account acntres = new account();
        	acntres.name = str1;
        try {
            insert acntres; 
        } catch (DmlException e)	{
            System.debug(e.getMessage());
         
         }
        
        
        return acntres;
    }
    
}