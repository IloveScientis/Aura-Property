@isTest
public with sharing class contactManagerTest {
   
    
    public static testMethod void getContactTest(){
        String recordId = createdTestRecord();
        String url = '/services/apexrest/v1/Contact/'+recordId;
        RestRequest request = new RestRequest();
        request.requestURI = url;
        request.httpMethod = 'GET';
        
        RestContext.request =request;
        Test.startTest();
            contactManager.contactWrapper wrapper = contactManager.getContact();
            System.assertNotEquals(null, wrapper);
        Test.stopTest();
    }

    public static testMethod void updateContactTest(){
        String recordId = createdTestRecord();
        String url = '/services/apexrest/v1/Contact/'+recordId;
        RestRequest request = new RestRequest();
        request.requestURI = url;
        request.httpMethod = 'PATCH';
        
        RestContext.request =request;
        Test.startTest();
            contactManager.updateContact('thao', 'firstName', 'email@gmail.com', '11111111111');
            
        Test.stopTest();
    }

    Static Id createdTestRecord(){
        Contact testContact = new Contact(
            Firstname='Test',
            LastName='Duong',
            Email='test@gmail.com',
            Phone ='123233333333'
        );
        insert testContact;
        return testContact.Id;
    }
}