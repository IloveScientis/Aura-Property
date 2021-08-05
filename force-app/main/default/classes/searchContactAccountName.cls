public with sharing class searchContactAccountName {

    public String searchValue{get;set;}
    public List<AccountWrapper> AccountWrapperList{get;set;}
    public List<ContactWrapper> ContactWrapperList{get;set;}
    public String getAccountContactList(){return null;}
    public searchContactAccountName(){
        AccountWrapperList = new List<AccountWrapper>();
        ContactWrapperList = new List<ContactWrapper>();
        if(searchValue.length()>=2){
         for(Account ac:[Select Id,Name from Account where Name like '%searchValue%' ]){
            AccountWrapper accountwrapperObj = new AccountWrapper();
            accountwrapperObj.accountName= ac.Name;
            accountwrapperObj.accountType='Account';
            AccountWrapperList.add(accountwrapperObj);
        }
        
        }
       
        
        
      } 
      public void getDisplayAccountContact() {
        
      }
      public void displayAccountContact(){
      
      }
    
    public class AccountWrapper{
        public String accountName{get;set;}
        public String accountType{get;set;}
    }
     public class ContactWrapper{
        public String contactName{get;set;}
        public String contactType{get;set;}
    }
}