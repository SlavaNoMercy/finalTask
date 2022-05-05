public without sharing class LadaCarController {

    public static final Set<String>  AVAILABLE_CURRENCY = new Set<String>{'BYN','EUR','USD','RUB','UAH'};

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
    public static String saveCase(String caseJSON) {
    	try{
            Case newCase = (Case)JSON.deserialize(caseJSON, Case.class);
            insert newCase;
            return 'Case Added';
        } catch(Exception e){
            System.debug(loggingLevel.ERROR, 'Error');
            return e.getMessage();
        }
	} 

    // @AuraEnabled
	// public static String saveLead(String leadJSON) {
    //     try{
    // 	    Lead newLead = (Lead)JSON.deserialize(leadJSON, Lead.class);
    //         newLead.Title = 'Test-Drive';
    //         if(!LadaQueryManager.isLeadExist(newLead.Email,newLead.Phone)){
    //             insert newLead;
    //             return 'Lead Added';
    //         } else {
    //             return 'Lead Exsists';
    //         }
    //     } catch(DMLException e){
    //         System.debug(loggingLevel.ERROR, 'Error');
    //         return e.getMessage();
    //     }
	// }

    @AuraEnabled
    public static List<Product2> getCarsAllowedTestDrive(){
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
