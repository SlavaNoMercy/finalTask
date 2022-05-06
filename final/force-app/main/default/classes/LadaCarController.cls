public without sharing class LadaCarController {

    public static final Set<String>  AVAILABLE_CURRENCY = new Set<String>{'BYR','EUR','USD','RUB','UAH'};

    @AuraEnabled
    public static List<Car_Center__c> getServices(){
        return LadaQueryManager.getServicesList();
    } 

    @AuraEnabled
    public static List<PricebookEntry> getCarsList(String selectedCurrency) {
        selectedCurrency = AVAILABLE_CURRENCY.contains(selectedCurrency) ? selectedCurrency : 'USD';
        return LadaQueryManager.getCarsListWithPrices(selectedCurrency);
    }

    @AuraEnabled
    public static List<Product2> getActualCarList(){
        List<Product2> products = new List<Product2>();
        for (PriceBookEntry pbEntry : LadaQueryManager.getCarsListWithPrices('USD')) {
            Product2 aProduct = new Product2();
            aProduct.Id = pbEntry.Product2Id;
            aProduct.Name = pbEntry.Product2.Name;
            products.add(aProduct);
        }
        return products;
    }
}
