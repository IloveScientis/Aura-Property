@IsTest
public class ContactTriggerUnitTest {
    
    @TestSetup
    public static void setUpdata() {
    
        Account acc = TestUtility.prepareAccount('Account');
        insert acc;
        
        /*Account acc = new Account( Name = 'Account', Description = ' Account With Setup Method ');
        insert acc;*/
        
        Account acc1 = TestUtility.prepareAccount('Account New');
        insert acc1;
        
        List<Contact> conList = TestUtility.prepareContact(acc.Id, 'Thao', 'LASTNAME', 3 );
        
        /*Contact con = new Contact( FirstName = 'Thao', LastName ='Duong', AccountId = acc.Id,
                                   Email = 'abc@gmail.com');
        Contact con1 = new Contact( FirstName = 'Steven', LastName ='Duong', AccountId = acc.Id,
                                   Email = 'abc@outlook.com');*/
                                   
        insert conList;

        
    }
    /*
    public static testMethod void beforeInsert() {
        
    }
    
    public static testMethod void afterInsert() {
        
    }
    */
    public static testMethod void beforeUpdate () {
    
        Account acc = [ Select Id, Name From Account Where Name ='Account New'];
        Contact con = [ Select Id, Name, AccountId From Contact Limit 1 ];
        con.AccountId = acc.Id;
        con.Email = 'updatedEmail@gmail.com';
        Test.startTest();
            update con;
            Account accUpdated = [ Select Id, Name, Total_Contacts__c From Account Where Name ='Account New'];
            System.assertEquals(1, accUpdated.Total_Contacts__c);
        Test.stopTest();
        
    }
    
    public static testMethod void beforeDelete() {
    
            Contact con = [ Select Id, Name, AccountId From Contact Limit 1 ];
            
            Test.StartTest();
                delete con;
                
            Test.stopTest();
            
    }
    public static testMethod void afterUnDelete() {
    
            Contact con = [ Select Id, Name, AccountId From Contact Limit 1 ];
            delete con;
            Test.StartTest();
                try {
                    undelete con;
                } catch( System.Exception ex ) {
                
                }
              
            Test.stopTest();
            
    }
}