public without sharing class LadaCarController {

    @AuraEnabled
    public static List<Car_Center__c> getServices(){
        return LadaQueryManager.getServicesList();
    } 

    @AuraEnabled
    public static List<PricebookEntry> getCarsList(String selectedCurrency) {
        CurrencyName_Iso__c settingObject = CurrencyName_Iso__c.getOrgDefaults();
        settingObject.Selected_Currency__c = selectedCurrency;
        selectedCurrency = LadaConstantsManager.AVAILABLE_CURRENCY.contains(selectedCurrency) ? selectedCurrency : 'USD';
        update settingObject;
        return LadaQueryManager.getCarsListWithPrices(selectedCurrency);
    }

    @AuraEnabled
    public static List<PricebookEntry> getActualCarList(){
        List<PricebookEntry> products = LadaQueryManager.getCarsListWithPrices('USD');
        return products;
    }
}
