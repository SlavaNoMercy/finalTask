@isTest
global with sharing class TestDataFactoryLada implements HttpCalloutMock {
    public static List<PricebookEntry> createTestProducts(Set<String> currencies, Integer numberOfProducts) {
        List<Product2> productList = new List<Product2>();
        Pricebook2 ladaPB = new Pricebook2(Name='LADA Cars Price Book',isActive=true);
        insert ladaPB;
        List<PricebookEntry> pbEntries = new List<PricebookEntry>();
        List<PricebookEntry> standartPBEntries = new List<PricebookEntry>();
        for (Integer i = 0; i < numberOfProducts; i++) {
            Product2 product = new Product2(Name='Test'+i,ProductCode='teSTcoDE'+i,CurrencyIsoCode='USD');
            productList.add(product);
        }
        insert productList;
        
        for(Product2 subj : productList){
            for(String ISO : currencies){
                PricebookEntry standardPBEntry = new PricebookEntry(Product2Id=subj.Id,UnitPrice=1,CurrencyIsoCode=ISO,Pricebook2Id=Test.getStandardPricebookId());
                standartPBEntries.add(standardPBEntry);
                PricebookEntry pbEntry = new PricebookEntry(Product2Id=subj.Id,UnitPrice=1,CurrencyIsoCode=ISO,Pricebook2Id=ladaPB.Id,UseStandardPrice=false);
                pbEntries.add(pbEntry);
            }
        }
        insert standartPBEntries;
        insert pbEntries;
        return pbEntries;        
    }

    global HTTPResponse respond(HTTPRequest request) {
        HttpResponse response = new HttpResponse();
        response.setHeader('Content-Type', 'application/json');
        response.setBody('{"data": {"USD":{"value":1},"BYN":{"value":2.5}, "RUB":{"value":0.01}, "EUR":{"value":0.9}, "UAH":{"value":0.06}}}');
        response.setStatusCode(200);
        return response;
    } 
}
