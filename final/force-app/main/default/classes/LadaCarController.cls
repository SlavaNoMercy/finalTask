public without sharing class LadaCarController {

    @AuraEnabled
    public static List<Car_Center__c> getServices(){
        return LadaQueryManager.getServicesList();
    } 

    @AuraEnabled
    public static List<PricebookEntry> getCarsList(String selectedCurrency) {
        CurrencyName_Iso__c settingObject = CurrencyName_Iso__c.getOrgDefaults();
        selectedCurrency = LadaConstantsManager.AVAILABLE_CURRENCY.contains(selectedCurrency) ? selectedCurrency : settingObject.Selected_Currency__c;
        settingObject.Selected_Currency__c = selectedCurrency;
        update settingObject;
        return LadaQueryManager.getCarsListWithPrices(selectedCurrency);
    }

    // @AuraEnabled
    // public static List<PricebookEntry> getActualCarList(){
    //     List<PricebookEntry> products = LadaQueryManager.getCarsListWithPrices('USD');
    //     return products;
    // }

    @AuraEnabled
    public static String selectProductFamily(String newFamily){
        FamilyName__c settingObjectFamily = FamilyName__c.getOrgDefaults();
        settingObjectFamily.Family__c = newFamily;
        update settingObjectFamily;
        return settingObjectFamily.Family__c;
    }
}
