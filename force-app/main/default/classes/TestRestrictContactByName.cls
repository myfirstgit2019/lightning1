@isTest
public class TestRestrictContactByName {
    @isTest static void TestAddingContactwithInvalidName()	{
        contact cnt = new Contact(FirstName='TriggerTest' , LastName='INVALIDNAME');
       
        Test.startTest();
        Database.saveResult rslt = Database.insert(cnt, True);
        Test.stopTest();
        
        system.debug(cnt);
        system.debug(rslt);
        
        system.debug(rslt.getErrors()[0].getMessage());
        
          System.assert(!rslt.isSuccess());
          System.assert(rslt.getErrors().size() > 0);
         System.assertEquals('The Last Name "'+cnt.LastName+'" is not allowed for DML',
                             rslt.getErrors()[0].getMessage());
        
    }
}