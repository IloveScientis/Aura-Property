public with sharing class DataLoadTestingClass {
    public PageReference doInsert() {
		Account objdlt = new Account();
		objdlt.Name=accountName;
		objdlt.BillingCity=accountCountry;
		objdlt.BillingCountry=accountPhone;		
        objdlt.Phone =accountPhone;
		insert objdlt;
		pagereference ref = new pagereference('/'+objdlt.id+'');
		ref.setredirect(true);
		return ref;
	}
	public String accountName { get; set; }
	public String accountCountry { get; set; }
	public String accountCity { get; set; }
    public String accountPhone { get; set; }
	
}