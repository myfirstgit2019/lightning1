trigger AccountAddressTrigger2 on Account (before insert, before update) {
 
 
	map<id,account> acnt_2update = new map<id,account>
        ([select id,BillingPostalCode,ShippingPostalCode from account where (Match_Billing_Address__c = TRUE and ID in :trigger.new)]);
    system.debug(acnt_2update);
    if (!acnt_2update.isEmpty())	{
    for(account a: trigger.new)	{
        system.debug(a);
        system.debug(acnt_2update.get(a.id).BillingPostalCode);
        if(acnt_2update.get(a.id).BillingPostalCode != null)
//        	acnt_2update.get(a.id).ShippingPostalCode = acnt_2update.get(a.id).BillingPostalCode ;
			a.ShippingPostalCode = acnt_2update.get(a.id).BillingPostalCode ;
        system.debug(acnt_2update.get(a.id).ShippingPostalCode);
    }
    }
}