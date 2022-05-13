global class BatchUpdateExchangeRate implements Database.Batchable<sObject>,
    Schedulable, Database.AllowsCallouts, Database.Stateful {

    global Database.QueryLocator start(Database.BatchableContext bc) { 
        return Database.getQueryLocator(
            [SELECT Id,Product2Id,CurrencyIsoCode,UnitPrice
            FROM PricebookEntry
            WHERE Pricebook2.Name = 'LADA Cars Price Book'
            AND CurrencyIsoCode = 'USD']);
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
        System.debug('passed');
    }
    
    global void execute(SchedulableContext ctx) {
        Http http = new Http();
        HttpRequest request = new HttpRequest();
        request.setEndpoint('https://api.currencyapi.com/v3/latest?apikey=mZtRwAk3xLwZ24zQdYkY1xDc93twfGIVffrZuhw0');
        request.setMethod('GET');
        request.setTimeout(20000);
        HttpResponse response = http.send(request); 
        Map<String,Map<String, Map<String,String>>> responseMap = (Map<String,Map<String, Map<String,String>>>)JSON.deserializeUntyped(response.getBody());

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