@isTest
public class TestVerifyDate {
    @isTest public static void TestCheckDates()	{
       Date Dte;
//	  	Date Date1 = date.parse('01/01/2019');
        Date myDate = Date.newInstance(2019, 1, 1);
        Date myDate2 = Date.newInstance(2019, 1, 29);
//		Date Date2  = date.parse('01/29/2019') ;                           
		
        Dte = VerifyDate.Checkdates(mydate, myDate2);
        System.debug('dte');
		System.assertEquals(myDate2, Dte);
    }
//Second condition
    @isTest public static void TestCheckDates2()	{
	    Date Dte;
        Date myDate = Date.newInstance(2019, 1, 1);
        Date myDate2 = Date.newInstance(2019, 2, 15);

        
        Dte = VerifyDate.Checkdates(myDate, myDate2);
        System.debug('dte');
//        VerifyDate.SetEndOfMonthDate(Date1);
		System.assertNotEquals(myDate2, Dte);
    }
/*    
    @isTest	public static void TestCheckWithin30Dates()   {
        Boolean	rslt;
        Date Date1 = date.parse('01/01/2019');
		Date Date2  = date.parse('01/15/2019') ; 
        
        System.assertEquals(True,rslt = Verifydate.DateWithin30Days(Date1, Date2)); 
        
        
    }
*/
}