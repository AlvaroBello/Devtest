trigger AccountAddressTrigger on Account (before insert, before update) {
    for(Account cuenta : trigger.new){
        if(cuenta.Match_Billing_Address__c == true && cuenta.BillingPostalCode  != NULL)
            cuenta.ShippingPostalCode = cuenta.BillingPostalCode ;
    }
}