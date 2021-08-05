public with sharing class AccountSearchController {
    public String searchValue{get;set;}
    public List<Account> accountList{get;set;}
    public List<Contact> contactList{get;set;}

    public List<ContactAccountWrapper>  ContactAccountWrapperList{get;set;}
    
    public  List<ContactAccountWrapper> displayWrapperList{get;set;}
    public  List<ContactAccountWrapper> filterWrapperList{get;set;}
    public AccountSearchController(){
        ContactAccountWrapperList = new  List<ContactAccountWrapper>();
         displayWrapperList= new   List<ContactAccountWrapper>();
         
           try{
            for(Contact c:[select Id,Name,Account.Id,Account.Name from Contact])
            {
               String url ='/';
                ContactAccountWrapper contactAccountWrapperObj = new ContactAccountWrapper();
               
                    contactAccountWrapperObj.contactName = c.Name;
                    contactAccountWrapperObj.contactType='Contact';
                    contactAccountWrapperObj.contactlink=url+c.id;
                    contactAccountWrapperObj.accountName=c.Account.Name;
                    contactAccountWrapperObj.accountType='Account';
                    contactAccountWrapperObj.accountlink=  url+c.Account.Id;
                    displayWrapperList.add(contactAccountWrapperObj);
                    System.debug('displayWrapperList'+displayWrapperList);
                
            }
           } catch(Exception e) {
                System.debug(e);
           }
               
    }
     
    // public static String searchRecords(String objName, String fieldName, String searchKey){
    //     String searchKeyword = searchKey + '*';
    //     String returningQuery = objName+' ( Id, '+fieldName+')';
    //     String query = 'FIND :searchKeyword IN ALL FIELDS RETURNING '+returningQuery+' LIMIT 2000';
    //     List<List<sObject>> sobjectList = Search.query(Query);
    //     return JSON.serialize(sobjectList);
    // }

    public void dosearch1(){
        displayWrapperList= new  List<ContactAccountWrapper>();
        filterWrapperList= new  List<ContactAccountWrapper>();
        
        String searchAccountquery='select Name,id from account where name like \'%'+searchValue+'%\' and name !=null';
        accountList=Database.query(searchAccountquery);

        String searchContactquery='select Name,id from contact where name like \'%'+searchValue+'%\' and name !=null';
        contactList=Database.query(searchContactquery);
        for(Contact a:contactList){
            if(contactList.size()>=1){
                String url ='/';
            ContactAccountWrapper contactAccountWrapperObj = new ContactAccountWrapper();
            contactAccountWrapperObj.contactName = a.Name;
            contactAccountWrapperObj.contactType='Contact';
            contactAccountWrapperObj.contactlink=url+a.id;
            displayWrapperList.add(contactAccountWrapperObj);
            }
        
        }
        for(Account a:accountList){
               if(accountList.size()>=1){
                String url ='/';
                ContactAccountWrapper contactAccountWrapperObj = new ContactAccountWrapper();
                contactAccountWrapperObj.accountName = a.Name;
                contactAccountWrapperObj.accountType='Account';
                contactAccountWrapperObj.accountlink=url+a.id;
                filterWrapperList.add(contactAccountWrapperObj);
               }
            
        }
    }
    
    
    public class ContactAccountWrapper{
     
        public String contactName{get;set;}
        public String contactType{get;set;}
        public String contactlink{get;set;}
        public String accountName{get;set;}
        public String accountType{get;set;}
        public String accountlink{get;set;}

    }

}