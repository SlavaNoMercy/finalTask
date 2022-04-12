public with sharing class ServicesController {
    @AuraEnabled
    public static List<Car_Center__c> getDealers() {
        try{
            return [SELECT Id,Name,Address__c,Contact_Number__c,
            Working_Hours__c
            FROM Car_Center__c
            WHERE RecordTypeId = '0125j000000UISwAAO'];
        } catch (Exception e) {
            throw new AuraHandledException(e.getMessage());
        }
    }
    @AuraEnabled
    public static List<Car_Center__c> getServices() {
        try {
            return [SELECT Id,Name,Address__c,Contact_Number__c,
            Working_Hours__c
            FROM Car_Center__c
            WHERE RecordTypeId = '0125j000000UIT1AAO'];
        } catch (Exception e) {
            throw new AuraHandledException(e.getMessage());
        }
    }
}
