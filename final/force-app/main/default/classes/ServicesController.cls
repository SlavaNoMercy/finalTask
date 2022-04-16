public without sharing class ServicesController {
    @AuraEnabled
    public static List<Car_Center__c> getServices() {
        return [SELECT Id,Name,Address__c,Contact_Number__c,
            Working_Hours__c, RecordTypeId, Description__c
            FROM Car_Center__c
            ];
        
    }
}
