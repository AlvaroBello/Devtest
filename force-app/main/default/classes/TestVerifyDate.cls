@IsTest
private class TestVerifyDate 
{
    @IsTest static void TestVerifyDate() {
        Date myDate = Date.newInstance(1960, 2, 17);
        Date myDate2 = Date.newInstance(1960, 2, 20);
        Date test = VerifyDate.CheckDates(myDate,myDate2);
        Date myDatex = Date.newInstance(1960, 2, 20);
        Date myDate2x = Date.newInstance(1970, 4, 17);
        Date testx = VerifyDate.CheckDates(myDatex,myDate2x); 
    }
}