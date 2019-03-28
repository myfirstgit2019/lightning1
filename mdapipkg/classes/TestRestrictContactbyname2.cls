@isTest
public class TestRestrictContactbyname2 {

    @isTest	 static  void TestInsert2(){
        contact cnt= new contact(firstname='Jake', lastname='INVALID');
        test.startTest();
        Database.SaveResult rslt = database.insert(cnt, false);
        test.stopTest();
        
         System.assert(!rslt.isSuccess());
        System.assert(rslt.getErrors().size() > 0);
        System.assertEquals('Cannot delete account with related opportunities.',
                             rslt.getErrors()[0].getMessage());

    }
}