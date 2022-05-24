@isTest
global with sharing class TestDataFactoryLada implements HttpCalloutMock {
    public static void createTestProducts(Set<String> currencies, Integer numberOfRecords) {
        List<Product2> productList = new List<Product2>();
        Pricebook2 ladaPB = new Pricebook2(Name='LADA Cars Price Book',isActive=true);
        insert ladaPB;
        List<PricebookEntry> pbEntries = new List<PricebookEntry>();
        List<PricebookEntry> standartPBEntries = new List<PricebookEntry>();
        for (Integer i = 0; i < numberOfRecords; i++) {
            Product2 product = new Product2(Name='Test'+i,ProductCode='teSTcoDE'+i,Family='test',CurrencyIsoCode='USD');
            productList.add(product);
        }
        insert productList;
        
        for(Product2 subj : productList){
            for(String ISO : currencies){
                PricebookEntry standartPBEntry = new PricebookEntry(Product2Id=subj.Id,UnitPrice=1,CurrencyIsoCode=ISO,Pricebook2Id=Test.getStandardPricebookId());
                standartPBEntries.add(standartPBEntry);
                PricebookEntry pbEntry = new PricebookEntry(Product2Id=subj.Id,UnitPrice=1,CurrencyIsoCode=ISO,Pricebook2Id=ladaPB.Id,UseStandardPrice=false);
                pbEntries.add(pbEntry);
            }
        }
        insert standartPBEntries;
        insert pbEntries;        
    }

    public static void createTestServices(Integer numberOfRecords){
        List<Car_Center__c> servicesList = new List<Car_Center__c>();
        for(Integer i = 0; i < numberOfRecords; i++){
            Car_Center__c newService = new Car_Center__c(Name = 'test'+i,Address__c = 'test', Latitude__c = 23.23,
            Longitude__c = 56.56,Contact_Number__c = '33212313' ,Working_Hours__c = 'test',  Description__c = 'test service');
            servicesList.add(newService);
        }
        insert servicesList;
    }

    global static HTTPResponse respond(HTTPRequest request) {
        HttpResponse response = new HttpResponse();
        response.setHeader('Content-Type', 'application/json');
        response.setBody('{"data": {"USD":{"value":1},"BYN":{"value":0}, "RUB":{"value":0}, "EUR":{"value":0}, "UAH":{"value":0}}}');
        response.setStatusCode(200);
        return response;
    } 
}
