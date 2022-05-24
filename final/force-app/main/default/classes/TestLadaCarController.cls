@isTest
public with sharing class TestLadaCarController {

    @isTest static void testServiceGetMethod(){
        TestDataFactoryLada.createTestServices(6);
        Test.startTest();
        List<Car_Center__c> testServicesList = LadaCarController.getServices();
        Test.stopTest();
        System.assert(testServicesList!=null);
        System.assertEquals(6, testServicesList.size());
    }
    @isTest static void testServiceGetMethodNoServices(){
        TestDataFactoryLada.createTestServices(0);
        Test.startTest();
        List<Car_Center__c> testServicesList = LadaCarController.getServices();
        Test.stopTest();
        System.assertEquals(0, testServicesList.size());
    }
    @isTest static void testGetCarListMethod(){
        TestDataFactoryLada.createTestProducts(LadaConstantsManager.AVAILABLE_CURRENCY,3);
        Test.startTest();
        CurrencyName_Iso__c settingObject = CurrencyName_Iso__c.getOrgDefaults();
        insert settingObject;
        List<PricebookEntry> testCarsList = LadaCarController.getCarsList('USD');
        Test.stopTest();
        System.assert(testCarsList!=null);
        System.assertEquals(3, testCarsList.size());
    }
    @isTest static void testGetCarListMethodNoCars(){
        TestDataFactoryLada.createTestProducts(LadaConstantsManager.AVAILABLE_CURRENCY,0);
        Test.startTest();
        CurrencyName_Iso__c settingObject = CurrencyName_Iso__c.getOrgDefaults();
        insert settingObject;
        List<PricebookEntry> testCarsList = LadaCarController.getCarsList('USD');
        Test.stopTest();
        System.assertEquals(0, testCarsList.size());
    }
    @isTest static void testSelectProductFamily(){
        Test.startTest();
        FamilyName__c settingObject = FamilyName__c.getOrgDefaults();
        insert settingObject;
        String testFamily = LadaCarController.selectProductFamily('test family');
        Test.stopTest();
        FamilyName__c settingObjectFamily = FamilyName__c.getOrgDefaults();
        System.assertEquals(settingObjectFamily.Family__c, testFamily);
    }
}
