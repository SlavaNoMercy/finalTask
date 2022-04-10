public with sharing class CarListController {
    @AuraEnabled
    public static List<Product2> getProduct() {
        // Perform isAccessible() checking first, then
        return [SELECT Id, Name, ProductCode, Family
                FROM Product2];
    }
}
