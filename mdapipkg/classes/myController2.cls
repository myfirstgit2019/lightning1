public class myController2 {
    public string myString	{
        get 	{
            if(mystring == null)	{
                mystring ='a';
            }
            return myString;
        } private set;
    }
        public String getMyString()	{
            return 'getMyString';
        }
        public String getStringMethod()	{
            if(myString == null)	{
                myString ='b';
            }
            return myString;
        }
    }