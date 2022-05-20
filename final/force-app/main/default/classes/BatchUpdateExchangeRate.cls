global class BatchUpdateExchangeRate implements Database.Batchable<sObject>,
    Schedulable, Database.AllowsCallouts, Database.Stateful {

    private List<PricebookEntry> originalPriceList;
    @TestVisible private List<PricebookEntry> getOriginalPriceList(){return originalPriceList;}

    global Database.QueryLocator start(Database.BatchableContext bc) { 
        this.originalPriceList = [SELECT Product2Id,UnitPrice
                                  FROM PricebookEntry
                                  WHERE CurrencyIsoCode='USD'
                                  AND Pricebook2.Name = 'LADA Cars Price Book'];
        return Database.getQueryLocator(
                                  [SELECT Id,Product2Id,CurrencyIsoCode,UnitPrice
                                   FROM PricebookEntry
                                   WHERE Pricebook2.Name = 'LADA Cars Price Book']);
   }
    
    global void execute(Database.BatchableContext bc, List<PricebookEntry> pbeList){		
        List<PricebookEntry> updateList = new List<PricebookEntry>();
        for(PricebookEntry pbEntry : pbeList){
            if(pbEntry.CurrencyIsoCode!='USD'){
                Decimal decimalExchangeValue = this.getOriginalPrice(pbEntry.Product2Id) * Double.valueOf(Cache.Org.get('USD' + pbEntry.CurrencyIsoCode));
                pbEntry.UnitPrice = decimalExchangeValue.setScale(-2);
                updateList.add(pbEntry);
            }
        }
        update updateList;
    }
    
    global void finish(Database.BatchableContext bc){}
    
    global void execute(SchedulableContext ctx) {
        Http http = new Http();
        HttpRequest request = new HttpRequest();
        request.setEndpoint('https://api.currencyapi.com/v3/latest?apikey=mZtRwAk3xLwZ24zQdYkY1xDc93twfGIVffrZuhw0');
        request.setMethod('GET');
        request.setTimeout(20000);
        try{
            HttpResponse response = http.send(request); 
            getProducedBy(response.getBody());
            Database.executeBatch(this);
        } catch(Exception e){
            System.debug('Can not update currency rates now!');
        }
    }

    @TestVisible private void getProducedBy(String jsonStr){
        Map<String,Object> dataMap;
        try{
            dataMap = (Map<String,Object>) JSON.deserializeUntyped(jsonStr);
        } catch(System.JSONException e){
            System.debug(loggingLevel.ERROR,'JSON Error');
            throw e;
        }
        if(dataMap.containsKey('data')){
            Map<String,Object> elementMap = (Map<String,Object>) dataMap.get('data');            
            for(String ISO : LadaConstantsManager.AVAILABLE_CURRENCY){
                if(elementMap.containsKey(ISO)){
                    Map<String,Object> ISOKeyMap = (Map<String,Object>) elementMap.get(ISO);
                    if(ISOKeyMap.containsKey('value')){
                        Cache.Org.put('USD'+ISO, ISOKeyMap.get('value'));
                    }
                }                           
            }
        }
    }

    @TestVisible private Double getOriginalPrice(Id productID){
        try{
            for(PricebookEntry pbe : this.originalPriceList){
                if(pbe.Product2Id == productID){
                    return Double.valueOf(pbe.UnitPrice);
                }
            }
        } catch(System.NullPointerException e){
            System.debug(loggingLevel.ERROR,'No products found');
        }
        return 0;
    }
}
    