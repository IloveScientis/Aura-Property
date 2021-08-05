public class ContactTriggerHelper {
      
    public static void updateActive(List<Contact> contactList){
        Set<Id> contactIdSet = new Set<Id>();
        for(Contact c:contactList){
            if(c.Active__c==false){
                contactIdSet.add(c.Id);
            }
        }
        List<Contact> contactToUpdate = new List<Contact>();
        List<Contact> contList = [select Id,Name,Active__c from Contact where Id IN: contactIdSet];
        System.debug('UpdateActive-contList '+contList);
        for(Contact c:contList){
            if(c.Id !=null){
                c.Active__c=true;
                contactToUpdate.add(c);
            }
        }
        update contactToUpdate;
    }
    public static void updateCount(List<Contact> contactList ) {
        /*1. Get the Set Id of Account*/
        Set<Id> accountIdsSet = new Set<Id>();
        for ( Contact con : contactList ) {
            if (con.AccountId != null ){
                accountIdsSet.add(con.AccountId);
            }
        }
        /*Get all the account associate with contact*/
        Map<Id, Account> accountMap = new Map<Id, Account>();    
        List<Contact> conList = [Select Id, Name, AccountId,Active__c From Contact Where AccountId IN :accountIdsSet and Active__c= true ];
        System.debug('#### conList - updateCount'+conList);
        /*if the Account has associate with contact , increase the value. Otherwise, add 1*/
        for ( Contact c : conList ) {
            if ( !accountMap.containsKey(c.AccountId) ) {
                accountMap.put(c.AccountId , new Account (Id = c.AccountId, Total_Contacts__c  = 1 ));
              
            } else {
                Account tempAccount = accountMap.get(c.AccountId);
                tempAccount.Total_Contacts__c  += 1;
                accountMap.put(c.AccountId , tempAccount );
            }
        }
            update accountMap.values();    
        	
         
       }
    
}