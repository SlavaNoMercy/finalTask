global class BatchUpdateExchangeRate implements Database.Batchable<sObject>, Schedulable {
	
    static final String USD_CURRENCY_PB = 'UsdPriceBook';
    static final String RUB_CURRENCY_PB = 'RubPriceBook';
    
    global Database.QueryLocator start(Database.BatchableContext bc) {
        return Database.getQueryLocator('SELECT Id,Product2Id,CurrencyIsoCode,'+
                                        'UnitPrice FROM PricebookEntry'+
                                        'WHERE Id = '+ USD_CURRENCY_PB +
                                        'OR Id = ' + RUB_CURRENCY_PB +
                                        'ORDER BY CurrencyIsoCode');
    }
    
    global void execute(Database.BatchableContext bc, List<PricebookEntry> priceBooks){
    	//Forming request to bank to get exchange rates
        Http http = new Http();
        HttpRequest req = new HttpRequest();
        req.setEndpoint('https://belarusbank.by/api/kursExchange');
		req.setMethod('GET');
        HttpResponse res = http.send(req);
        //Analyze results
		Map<String,Map<String,String>> exchangeRates = (Map<String, Map<String,String>>) JSON.deserializeUntyped(res.getBody());        
        Map<String,String> actualCources = exchangeRates.get('0');
        //Math
        Double realPrice;
        Double rubleCost;
        PriceBookEntry rub;
        rubleCost = (Double.valueOf(actualCources.get('USD_RUB_in')) + 
                      (1/Double.valueOf(actualCources.get('USD_RUB_out'))))/2;
        for(PriceBookEntry pb : priceBooks){
            if(pb.CurrencyIsoCode=='USD'){
                realPrice=pb.UnitPrice;
         	}
            if(pb.CurrencyIsoCode=='RUB'){
                rub=pb;
            }
        }
        rub.UnitPrice*=rubleCost;
    }
    
    global void finish(Database.BatchableContext bc){
        // execute any post-processing operations
    }
    
    global void execute(SchedulableContext ctx) {
        Database.executeBatch(this);
    }
}