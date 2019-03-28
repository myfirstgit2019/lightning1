public class StringArrayTest {
    public static List<String> generateStringArray (integer length){
        System.debug(length);
        List<String> genString = new List<String>();
  //      System.debug(genString[0]);
        for(integer i=0;i<length;i++)        {
            System.debug(i.format());
            genString.add('Test ' + i.format());
            System.debug(genString[i]);
        }
        return genString; 
            
    }
}