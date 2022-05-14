@isTest
public with sharing class TestBatchUpdateExchangeRate {
    
    @isTest static void testSmthng() {
        List<PricebookEntry> pbEntries = TestDataFactoryLada.createTestProducts(LadaCarController.AVAILABLE_CURRENCY,3);
        Test.setMock(HttpCalloutMock.class, new TestDataFactoryLada()); 
        Test.startTest();
        BatchUpdateExchangeRate buer = new BatchUpdateExchangeRate();
        buer.execute(null);
        Test.stopTest();
        System.assertEquals(30,[SELECT count() FROM PricebookEntry]);
        System.assertEquals(0,buer.getOriginalPrice('01t5j000000tOjQAAU'),'Original price is wrong!');        
    }

    @isTest static void testSmthngElse() {
        List<PricebookEntry> pbEntries = TestDataFactoryLada.createTestProducts(LadaCarController.AVAILABLE_CURRENCY,0);
        Test.setMock(HttpCalloutMock.class, new TestDataFactoryLada()); 
        Test.startTest();
        BatchUpdateExchangeRate buer = new BatchUpdateExchangeRate();
        buer.execute(null);
        Test.stopTest();
        System.assertEquals(null,buer.getOriginalPriceList());        
    }

    @isTest static void testSmthngElseElse() {
        List<PricebookEntry> pbEntries = TestDataFactoryLada.createTestProducts(LadaCarController.AVAILABLE_CURRENCY,0);
        Test.setMock(HttpCalloutMock.class, new TestIncorrectHttpMock()); 
        Test.startTest();
        BatchUpdateExchangeRate buer = new BatchUpdateExchangeRate();
        buer.execute(null);
        Test.stopTest();       
    }
}
