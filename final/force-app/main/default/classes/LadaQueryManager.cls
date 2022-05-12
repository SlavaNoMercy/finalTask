public without sharing class LadaQueryManager {
    @AuraEnabled
    public static List<Car_Center__c> getServicesList() {
        return [SELECT Id,Name,Address__c, Latitude__c,
        Longitude__c,Contact_Number__c,Working_Hours__c, RecordTypeId, Description__c
            FROM Car_Center__c
            LIMIT 10
            ];
    }

    @AuraEnabled
    public static List<PricebookEntry> getCarsListWithPrices(String selectedCurrency){
        //if(Schema.sObjectType.PricebookEntry.isAccessible()){
            return [SELECT UnitPrice, Product2Id, Product2.Name, Product2.ProductCode, Product2.Family,
            Product2.Description,Product2.Equipment__c,Product2.Description__c,CurrencyIsoCode,Product2.Product_Image_Link__c
            FROM PricebookEntry
            WHERE CurrencyIsoCode =:selectedCurrency 
            AND Pricebook2Id = '01s5j00000GRjGZAA1'
            LIMIT 15];
        //} else{
        //    System.debug('cannot reach class');
        //    return null;
        //}
    }
}
