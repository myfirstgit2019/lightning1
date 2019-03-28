@isTest
public class TestVerifyDate2 {
    @isTest static void TestWithinDate()	{
        date	rsltDate; 
    	date	close =  date.newinstance(2019,03,03) ;
		date	far =  date.newinstance(2019,03,06) ;

//        
      rsltDate = Verifydate.Checkdates(close,far);
        system.debug(rsltdate);
        system.debug( Date.newInstance(close.year(), close.month(), 31));
            
	system.assertequals(rsltDate,  far);
    }
    
    @isTest static void TestOutsideDate()	{
         date	rsltDate; 
    	date	close =  date.newinstance(2019,03,03) ;
		date	far =  date.newinstance(2019,15,06) ;    
         rsltDate = Verifydate.Checkdates(close,far);
        
         system.debug(rsltdate);
        system.debug( far);
       
       system.assertequals(rsltDate,  Date.newInstance(close.year(), close.month(), 31)); 
    }
       
    
}