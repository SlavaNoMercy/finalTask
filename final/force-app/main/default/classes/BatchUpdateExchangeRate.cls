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
        Http http = new Http();
        HttpRequest req = new HttpRequest();
        req.setEndpoint('https://belarusbank.by/api/kursExchange');
		req.setMethod('GET');
        HttpResponse res = http.send(req);
        
		Map<String,Map<String,String>> exchangeRates = (Map<String, Map<String,String>>) JSON.deserializeUntyped(res.getBody());        
        Map<String,String> actualCources = exchangeRates.get('0');
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
    }
    
    global void execute(SchedulableContext ctx) {
        Database.executeBatch(this);
    }
}