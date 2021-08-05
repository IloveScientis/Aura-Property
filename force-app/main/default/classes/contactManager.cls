@RestResource(UrlMapping='/v1/Contact/*')
global with sharing class contactManager {

    @httpPatch
    global static contactWrapper updateContact(String lastName, String firstName, String email, String phone){
        RestRequest request = RestContext.request;
        String requestURI = request.requestURI;
        String contactId = requestURI.substringAfterLast('/');  
        
        Contact con;
        List<Contact> contactList =[Select Id, Name, FirstName, LastName, Email, Phone From Contact where Id=:contactId];

        ContactWrapper wrapper = new ContactWrapper();
            if(contactList.size()>0 && contactList !=null){
                con = new Contact(       
                    Id = contactId ,             
                    LastName = lastName,
                    FirstName = firstName,
                    Email = email,
                    Phone = phone
                );
                update con;

                wrapper.conRecord = con;
                wrapper.message ='Record updated successfully';
            }else{
                wrapper.message ='Records have not found';
            }
            return wrapper;
    }

    @httpGet
    global static contactWrapper getContact(){
        RestRequest request = RestContext.request;
        String requestURI = request.requestURI;
        String contactId = requestURI.substringAfterLast('/');
        List<Contact> contactList = [Select Id, Name, FirstName, LastName, Email, Phone From Contact where Id=:contactId];

        ContactWrapper wrapper = new ContactWrapper();        
        if(contactList.size()>0 && contactList!=null){
            wrapper.conRecord = contactList.get(0);
            wrapper.message = 'Success';
        }else{
            wrapper.message ='Records have not found';
        }
        return wrapper;
    }
    
    
    global class contactWrapper{
        global Contact conRecord;
        global String message;
    }
    // global class responseWrapper{
    //     global List<Contact> contList;
        
    // }
}