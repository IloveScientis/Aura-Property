global with sharing class test1Controller {
  
    public Decimal contactCounter{get;set;}
    public Decimal accountCounter{get;set;}
    public static Account account{get;set;}
    public static Contact contact{get;set;}
    public String searchValue{get;set;}
    public List<Account> accountList{get;set;}
    public List<Contact> contactList{get;set;}

    public List<ContactAccountWrapper>  ContactAccountWrapperList{get;set;}
    
    public  List<ContactAccountWrapper> displayWrapperList{get;set;}
    public  List<ContactAccountWrapper> filterWrapperList{get;set;}
    public test1Controller(){
        ContactAccountWrapperList = new  List<ContactAccountWrapper>();
         displayWrapperList= new   List<ContactAccountWrapper>();
         
           try{
            for(Contact c:[select Id,Name,Counter__c,Account.Id,Account.Name,Account.Counter__c from Contact])
            {
               String url ='/';
                ContactAccountWrapper contactAccountWrapperObj = new ContactAccountWrapper();
               
                    contactAccountWrapperObj.contactName = c.Name;
                    contactAccountWrapperObj.contactType='Contact';
                    contactAccountWrapperObj.contactCounter=c.Counter__c;
                    contactAccountWrapperObj.contactlink=c.id;
                    contactAccountWrapperObj.isClicked=false;
                    contactAccountWrapperObj.accountName=c.Account.Name;
                    contactAccountWrapperObj.accountType='Account';
                    contactAccountWrapperObj.accountCounter=c.Account.Counter__c;
                    contactAccountWrapperObj.accountlink=c.Account.id;
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
        
        String searchAccountquery='select Name,id,Counter__c from account where name like \'%'+searchValue+'%\' and name !=null';
        accountList=Database.query(searchAccountquery);

        String searchContactquery='select Name,id,Counter__c from contact where name like \'%'+searchValue+'%\' and name !=null';
        contactList=Database.query(searchContactquery);
        for(Contact a:contactList){
            if(contactList.size()>=1){
                String url ='/';
            ContactAccountWrapper contactAccountWrapperObj = new ContactAccountWrapper();
            contactAccountWrapperObj.contactName = a.Name;
            contactAccountWrapperObj.contactType='Contact';
            contactAccountWrapperObj.contactCounter=a.Counter__c;
            contactAccountWrapperObj.contactlink=a.id;
            contactAccountWrapperObj.isClicked=false;
            displayWrapperList.add(contactAccountWrapperObj);
            }
        }
        for(Account a:accountList){
               if(accountList.size()>=1){
                String url ='/';
                ContactAccountWrapper contactAccountWrapperObj = new ContactAccountWrapper();
                contactAccountWrapperObj.accountName = a.Name;
                contactAccountWrapperObj.accountType='Account';
                contactAccountWrapperObj.accountCounter=a.Counter__c;
                contactAccountWrapperObj.accountlink=a.id;
                contactAccountWrapperObj.isClicked=false;
                filterWrapperList.add(contactAccountWrapperObj);
               }
        }
    }
    
    
    public class ContactAccountWrapper{
        public String contactName{get;set;}
        public String contactType{get;set;}
        public Decimal contactCounter{get;set;}
        public String contactlink{get;set;}
        public Boolean isClicked{get;set;}
        public String accountName{get;set;}
        public String accountType{get;set;}
        public Decimal accountCounter{get;set;}
        public String accountlink{get;set;}
       

    }
}