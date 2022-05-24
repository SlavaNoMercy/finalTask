@isTest
public with sharing class TestBatchUpdateExchangeRate {
    
    @isTest static void testCorrectUseCase() {
        TestDataFactoryLada.createTestProducts(LadaConstantsManager.AVAILABLE_CURRENCY,3);
        Test.setMock(HttpCalloutMock.class, new TestDataFactoryLada()); 
        Test.startTest();
        BatchUpdateExchangeRate testBatchObject = new BatchUpdateExchangeRate();
        testBatchObject.execute(null);
        Test.stopTest();
        System.assertEquals(30,[SELECT count() FROM PricebookEntry]);
        System.assertEquals(0,testBatchObject.getOriginalPrice('01t5j000000tOjQAAU'),'getOriginalPrice() doesn\'t work!');
        PricebookEntry testEntry = [SELECT UnitPrice FROM PricebookEntry WHERE CurrencyIsoCode = 'BYN' AND Pricebook2.Name = 'LADA Cars Price Book' LIMIT 1];
        System.assertEquals(0, testEntry.UnitPrice);        
    }

    @isTest static void testEmptyListOfProducts() {
        TestDataFactoryLada.createTestProducts(LadaConstantsManager.AVAILABLE_CURRENCY,0);
        Test.setMock(HttpCalloutMock.class, new TestDataFactoryLada()); 
        Test.startTest();
        BatchUpdateExchangeRate testBatchObject = new BatchUpdateExchangeRate();
        testBatchObject.execute(null);
        Test.stopTest();
        System.assertEquals(null,testBatchObject.getOriginalPriceList());        
    }

    @isTest static void testIncorrectHttpResponse() {
        TestDataFactoryLada.createTestProducts(LadaConstantsManager.AVAILABLE_CURRENCY,0);
        Test.setMock(HttpCalloutMock.class, new TestIncorrectHttpMock()); 
        Test.startTest();
        BatchUpdateExchangeRate testBatchObject = new BatchUpdateExchangeRate();
        testBatchObject.execute(null);
        Test.stopTest();
        System.assertEquals(null,testBatchObject.getOriginalPriceList());       
    }
}
