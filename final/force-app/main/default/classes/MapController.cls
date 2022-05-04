public without sharing class MapController {
    @AuraEnabled
    public static List<Car_Center__c> findServicesForMap(){
        return [SELECT Id,Name,Latitude__c,Longitude__c,Address__c,
        Contact_Number__c,Working_Hours__c FROM Car_Center__c];
    }
}
