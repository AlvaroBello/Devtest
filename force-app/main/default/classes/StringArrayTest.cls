public class StringArrayTest {
	public static List<String> generateStringArray(integer i)
    {
        List<String> test = new List<String>();
        
        for(integer j=0;j<i;j++)
        {
            test.add('Test '+j);
        }
        return test;
    }
}