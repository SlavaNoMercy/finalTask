public without sharing class LadaVFPController {
    public List <PricebookEntry> getCarsByFamily(){
        FamilyName__c settingObjectFamily = FamilyName__c.getOrgDefaults();
        CurrencyName_Iso__c settingObjectCurrency = CurrencyName_Iso__c.getOrgDefaults();
        List<PricebookEntry> products = LadaQueryManager.getCarsListWithPrices(settingObjectCurrency.Selected_Currency__c);
        for (Integer i = (products.size()-1) ; i>= 0 ; i--){
            if(products[i].Product2.Family != settingObjectFamily.Family__c){
                products.remove(i);
            }
        }
        return products;
    }
}
