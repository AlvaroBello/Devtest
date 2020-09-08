public class StringArrayTester {
	public static List<String> generateStringArray(integer i)
    {
        List<String> tester = new List<String>();
        
        for(integer j=0;j<i;j++)
        {
            tester.add('Test '+j);
        }
        return tester;
    }
}