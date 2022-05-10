global class BatchUpdateExchangeRate implements Database.Batchable<sObject>,
    Schedulable, Database.AllowsCallouts, Database.Stateful {

    global Database.QueryLocator start(Database.BatchableContext bc) { 
        return Database.getQueryLocator(
            [SELECT Id,Product2Id,CurrencyIsoCode,UnitPrice
            FROM PricebookEntry
            WHERE Pricebook2.Name = 'LADA Cars Price Book'
            /*AND CurrencyIsoCode = 'BYR'*/]);
                                        // 'SELECT Id,Product2Id,CurrencyIsoCode,UnitPrice'+
                                        // 'FROM PricebookEntry'+
                                        // 'WHERE Pricebook2Id = "01s5j00000GRjGZAA1"'+
                                        // 'AND CurrencyIsoCode = "BYR"');
    }
    
    global void execute(Database.BatchableContext bc, List<PricebookEntry> pbe){		
        List<PricebookEntry> updateList = new List<PricebookEntry>();
        for(PricebookEntry pbEntry : pbe){
            if(pbEntry.CurrencyIsoCode!='BYN'){
                pbEntry.UnitPrice /= Double.valueOf(Cache.Org.get(CurrencyIsoCode));
            }
        }
        update updateList;
    }
    
    global void finish(Database.BatchableContext bc){
        
    }
    
    global void execute(SchedulableContext ctx) {
        Http http = new Http();
        HttpRequest request = new HttpRequest();
        request.setEndpoint('https://www.nbrb.by/api/exrates/rates?periodicity=0');
		request.setMethod('GET');
        HttpResponse response; 
        try{
            response = http.send(request);
        } catch (System.CalloutException e){
            System.debug('The following exception has occurred: ' + e.getMessage());
        }
        List<Map<String, String>> valueList = (List<Map<String, String>>)JSON.deserializeUntyped(response.getBody());
        for(String ISOCode : LadaCarController.AVAILABLE_CURRENCY){
            try{
                Cache.Org.put(ISOCode, 
                    Double.valueOf(value.get('Cur_OffitialRate'))*
                    Double.valueOf(value.get('Cur_Scale')));
            } catch(Exception e) {
                System.debug('The following exception has occurred:' + e.getMessage());
                continue;
            }
        }
        Database.executeBatch(this);
    }
}