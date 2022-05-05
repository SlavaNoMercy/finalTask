public without sharing class LadaQueryManager {
    //@AuraEnabled
    public static List<Car_Center__c> getServicesList() {
        return [SELECT Id,Name,Address__c, Latitude__c,
        Longitude__c,Contact_Number__c,Working_Hours__c, RecordTypeId, Description__c
            FROM Car_Center__c
            LIMIT 10
            ];
    }

    //@AuraEnabled
    public static List<PricebookEntry> getCarsListWithPrices(String selectedCurrency){
        if(Schema.sObjectType.PricebookEntry.isAccessible()){
            return [SELECT UnitPrice, Product2Id, Product2.Name, Product2.ProductCode, Product2.Family
            FROM PricebookEntry
            WHERE Pricebook2Id='01s5j00000GRjGZAA1' 
            AND CurrencyIsoCode=:selectedCurrency
            LIMIT 15];
        } else{
            return null;
        }
    }

    public static Boolean isLeadExist(String enteredEmail, String enteredPhone){
        enteredEmail = '%' + enteredEmail + '%';
        enteredPhone = '%' + enteredPhone + '%';
        try{
            Lead checkLead = [SELECT Id,Email,Phone 
            FROM Lead
            WHERE Email=:enteredEmail
            OR Phone=:enteredPhone
            LIMIT 1];
            return true;
        } catch(QueryException e){
            return false;
        }
    }


}
