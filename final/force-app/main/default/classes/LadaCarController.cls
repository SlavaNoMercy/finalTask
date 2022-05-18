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
    public static List<PricebookEntry> getActualCarList(){
        List<PricebookEntry> products = LadaQueryManager.getCarsListWithPrices('USD');
        return products;
    }

    //@AuraEnabled
    public static List <PricebookEntry> getCarsByFamily(String family, String selectedCurrency){
        List<PricebookEntry> products = LadaQueryManager.getCarsListWithPrices(selectedCurrency);
        for (Integer i=0;i<products.size();i++){
            if(!products[i].Product2.Family.contains(family)){
                products.remove(i);
            }
        }
        return products;
    }
}
