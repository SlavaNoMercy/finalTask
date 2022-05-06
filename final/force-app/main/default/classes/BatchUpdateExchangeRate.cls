global class BatchUpdateExchangeRate implements Database.Batchable<sObject>, Schedulable {
    
    global Database.QueryLocator start(Database.BatchableContext bc) {
        return Database.getQueryLocator('SELECT Id,Product2Id,CurrencyIsoCode,UnitPrice'+
                                        'FROM PricebookEntry'+
                                        'WHERE Pricebook2Id = 01s5j00000GRjGZAA1'+
                                        'AND CurrencyIsoCode = BYR');
    }
    
    global void execute(Database.BatchableContext bc, List<PricebookEntry> pbeBYR){
        Http http = new Http();
        HttpRequest request = new HttpRequest();
        request.setEndpoint('https://www.nbrb.by/api/exrates/rates?periodicity=0');//nb ne rabotaet!!!
		request.setMethod('GET');
        HttpResponse response; 
        try{
            response = http.send(request);
        } catch (System.CalloutException e){
            System.debug('The following exception has occurred: ' + e.getMessage());
        }
        //
        List<Map<String, String>> valueList = (List<Map<String, String>>)JSON.deserializeUntyped(response.getBody());
		
        List<PricebookEntry> updateList = new List<PricebookEntry>();
        for(PricebookEntry pbEntry : pbeBYR){
            for(Map<String, String> value : valueList){
                for(String ISOCode : LadaCarController.AVAILABLE_CURRENCY){
                    try{
                        Cache.Org.put(ISOCode, 
                            Double.valueOf(value.get('Cur_OffitialRate'))*
                            Double.valueOf(value.get('Cur_Scale')));
//!!! for nbrb  !!!
                        pbEntry.CurrencyIsoCode = ISOCode;
                        pbEntry.UnitPrice *= Double.valueOf(Cache.Org.get(ISOCode));
                        updateList.add(pbEntry);
                    } catch(Exception e) {
                        System.debug('The following exception has occurred:' + e.getMessage());
                        continue;
                    }
                }
            }
        }
        update updateList;
    }
    
    global void finish(Database.BatchableContext bc){
        /*PricebookEntry currentPbe = new PricebookEntry();
        currentPbe.valueIsoCode.set(ISOCode);
        currentPbe.UnitPrice *= Cache.Org.get(ISOCode);*/
    }
    
    global void execute(SchedulableContext ctx) {
        Database.executeBatch(this);
    }
}