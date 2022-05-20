@isTest
public with sharing class TestBatchUpdateExchangeRate {
    
    @isTest static void testCorrectUseCase() {
        List<PricebookEntry> pbEntries = TestDataFactoryLada.createTestProducts(LadaConstantsManager.AVAILABLE_CURRENCY,3);
        Test.setMock(HttpCalloutMock.class, new TestDataFactoryLada()); 
        Test.startTest();
        BatchUpdateExchangeRate testBatchObject = new BatchUpdateExchangeRate();
        testBatchObject.execute(null);
        Test.stopTest();
        System.assertEquals(30,[SELECT count() FROM PricebookEntry]);
        System.assertEquals(0,testBatchObject.getOriginalPrice('01t5j000000tOjQAAU'),'Original price is wrong!');        
    }

    @isTest static void testEmptyListOfProducts() {
        List<PricebookEntry> pbEntries = TestDataFactoryLada.createTestProducts(LadaConstantsManager.AVAILABLE_CURRENCY,0);
        Test.setMock(HttpCalloutMock.class, new TestDataFactoryLada()); 
        Test.startTest();
        BatchUpdateExchangeRate testBatchObject = new BatchUpdateExchangeRate();
        testBatchObject.execute(null);
        Test.stopTest();
        System.assertEquals(null,testBatchObject.getOriginalPriceList());        
    }

    @isTest static void testIncorrectHttpResponse() {
        List<PricebookEntry> pbEntries = TestDataFactoryLada.createTestProducts(LadaConstantsManager.AVAILABLE_CURRENCY,0);
        Test.setMock(HttpCalloutMock.class, new TestIncorrectHttpMock()); 
        Test.startTest();
        BatchUpdateExchangeRate testBatchObject = new BatchUpdateExchangeRate();
        testBatchObject.execute(null);
        Test.stopTest();
        System.assertEquals(null,testBatchObject.getOriginalPriceList());       
    }
}
