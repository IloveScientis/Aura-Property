public with sharing class SearchInVFControlle {
    public list <Account> acc {get;set;}
    public String searchKey {get;set;}
    public SearchInVFControlle( ) {
    }
    public void search(){
        string searchquery='select Name,id from account where name like \'%'+searchKey.toLowerCase()+'%\' Limit 10';
        acc= Database.query(searchquery);
    }
    public void clear(){
        acc.clear();
    }
}