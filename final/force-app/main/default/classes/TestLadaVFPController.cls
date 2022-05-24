@isTest
public with sharing class TestLadaVFPController {
    @isTest
    static void testGetCarsByFamilyMethod(){
        TestDataFactoryLada.createTestProducts(LadaConstantsManager.AVAILABLE_CURRENCY,2);
        Test.startTest();
        CurrencyName_Iso__c settingObject = CurrencyName_Iso__c.getOrgDefaults();
        settingObject.Selected_Currency__c = 'BYN';
        insert settingObject;
        FamilyName__c settingObjectFamily = FamilyName__c.getOrgDefaults();
        settingObjectFamily.Family__c = 'test';
        insert settingObjectFamily;
        List<PricebookEntry> testList = LadaVFPController.getCarsByFamily();
        Test.stopTest();
        System.assertEquals(2,testList.size());
        CurrencyName_Iso__c actual = CurrencyName_Iso__c.getOrgDefaults();
        System.assertEquals('BYN', actual.Selected_Currency__c);
        FamilyName__c actualFamily = FamilyName__c.getOrgDefaults();
        System.assertEquals('test', actualFamily.Family__c);
    }

    @isTest
    static void testGetCarsByFamilyMethodNoCars(){
        TestDataFactoryLada.createTestProducts(LadaConstantsManager.AVAILABLE_CURRENCY,0);
        Test.startTest();
        CurrencyName_Iso__c settingObject = CurrencyName_Iso__c.getOrgDefaults();
        settingObject.Selected_Currency__c = 'BYN';
        insert settingObject;
        FamilyName__c settingObjectFamily = FamilyName__c.getOrgDefaults();
        settingObjectFamily.Family__c = 'test';
        insert settingObjectFamily;
        List<PricebookEntry> testList = LadaVFPController.getCarsByFamily();
        Test.stopTest();
        System.assertEquals(0,testList.size());
    }
    @isTest
    static void testGetCarsByFamilyMethodWithIncorrectParam(){
        TestDataFactoryLada.createTestProducts(LadaConstantsManager.AVAILABLE_CURRENCY,2);
        Test.startTest();
        CurrencyName_Iso__c settingObject = CurrencyName_Iso__c.getOrgDefaults();
        settingObject.Selected_Currency__c = 'BYN';
        insert settingObject;
        FamilyName__c settingObjectFamily = FamilyName__c.getOrgDefaults();
        settingObjectFamily.Family__c = 'incorrect value';
        insert settingObjectFamily;
        List<PricebookEntry> testList = LadaVFPController.getCarsByFamily();
        Test.stopTest();
        System.assertEquals(0,testList.size());
    }
}
