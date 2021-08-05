public class PropertyDetails {
    public PropertyDetails() {
		
    }
@AuraEnabled(cacheable=true)
public static list<Property__c> getLatestProperty(){

list<Property__c> allPropertyList = new list<Property__c>();

    allPropertyList = [SELECT Id,
                   Additional_Room__c,
                   Available_From__c,
                   Carpet_area_sqft__c,
                   Covered_Area_sqft__c,
                   Electricity_Status__c,
                   Facing__c,
                   Floor__c,
                   For_Bachellor__c,
                   For_Family__c,
                   Furnishsing_Available__c,
                   Furnished_Type__c,
                   Geo_Map__c,
                   Landmark__c,
                   Location__c,
                   Area__c,
                   street__c,
                   State__c,
                   country__c,
                   Maintenance_Charge__c,
                   No_of_Balcony__c,
                   No_Of_Bathroom__c,
                   No_of_Bedroom__c,
                   Property_Description__c,
                   Property_Main_Image__c,
                   Property_Owner__c,
                   	Property_Video__c,
                   Name,
                   Rent__c,
                   Security_Deposit__c,
                   Status__c,
                   Verify__c,
                   Water_Available__c
                   FROM Property__c
                   LIMIT 50
					];
			return allPropertyList;
}
}