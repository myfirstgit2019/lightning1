public class NewCaseListController {
    public list<case> GetNewCases()	{

     list<case> results =[select id, casenumber from case where status='New']   ;
        /*
   list<case> results = database.query('select id, casenumber' +
                                            'from case' +
                                            'where status=New');
*/

System.debug(results);
        return results;	
    }
}