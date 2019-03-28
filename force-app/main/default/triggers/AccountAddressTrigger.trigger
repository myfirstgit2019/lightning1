trigger AccountAddressTrigger on Account (before insert, before update) {
    for( Account a: Trigger.New)    {
        if (a.Match_Billing_Address__c == TRUE) {
            a.ShippingPostalCode = a.BillingPostalCode;
        }
        else if (a.Match_Billing_Address__c == FALSE) {
            system.debug(a);
            
        }
                
    }
    
}