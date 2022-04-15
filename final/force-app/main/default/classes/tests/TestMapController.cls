@isTest(seeAllData=true)
public with sharing class TestMapController {
    @isTest static void compareListWithExistingCenters(){
        List<Car_Center__c> existtingCenters = [SELECT Id,Name,Latitude__c,Longitude__c FROM Car_Center__c];
        System.assertEquals(existtingCenters, MapController.findServicesForMap(),'Wrong list of centers');
    }
    @isTest static void compareServicesListWithExistingCenters(){
        List<Car_Center__c> existtingCenters = [SELECT Id,Name,Address__c,Contact_Number__c,
            Working_Hours__c FROM Car_Center__c];
        System.assertEquals(existtingCenters, ServicesController.getServices(),'Wrong list of centers');
    }
}
