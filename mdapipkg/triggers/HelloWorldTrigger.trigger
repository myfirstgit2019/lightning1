trigger HelloWorldTrigger on Account (before insert) {
    System.debug('Hello World!');
    for (account a : Trigger.New)   {
        a.Description = 'New Trigger description';
    
    
    }
}