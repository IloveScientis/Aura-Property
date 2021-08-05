public class ContactRelatedListController {     

    public List<contact> contacts{get;set;} 
    public String searchValue{get;set;}
    public Account accounts {get;set;} 

    public Account acc {get;set;} 

     

    //Constructor 

    public ContactRelatedListController(ApexPages.StandardController controller) { 

        acc = (account)controller.getRecord();      

       if(searchValue.length()>=2){
        accounts = [SELECT id FROM account where Name =: searchValue.toLowerCase()]; 

        contacts = [SELECT id,Name, mobilephone, email FROM contact where Name =: searchValue.toLowerCase()];  
       }   

} 

    //This method is to create a new contact while clicking on the Add contact button 

    public pageReference newContact(){  

        pageReference pageRef = new pageReference(URL.getSalesforceBaseUrl().toExternalForm() + '/003/e?&retURL=' + accounts.id);  

        return pageRef; 

    } 

    //This method is to edit the existing contact record while clicking the Edit link 

    public pageReference editContact(){  

        String contactId = Apexpages.currentpage().getParameters().get('contactId');  

        pageReference pageRef = new pageReference(URL.getSalesforceBaseUrl().toExternalForm() + '/' + contactId + '/e?retURL=' + accounts.id);  

        return pageRef;  

    }    


 //This method is to delete the contact record while clicking the Del link 

    public pageReference deleteContact(){  

        String contactId = Apexpages.currentpage().getParameters().get('contactId');  

        contact contactList = [SELECT Id FROM contact WHERE id = : contactId LIMIT 1]; 

        delete contactList; 

        String baseUrl = URL.getSalesforceBaseUrl().toExternalForm(); 

        PageReference redirectPage = new PageReference(baseUrl+'/'+accounts.id); 

        return redirectPage;  

    }   

}