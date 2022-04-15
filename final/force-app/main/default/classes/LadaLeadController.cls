public with sharing class LadaLeadController {
    @AuraEnabled
	public static String saveLead(String leadJSON) {
        try{
    	    Lead newLead = (Lead)JSON.deserialize(leadJSON, Lead.class);
            System.debug(newLead);
            upsert newLead;
            return 'Lead Added';
        } catch(Exception e){
            System.debug(loggingLevel.ERROR, 'Error');
            return e.getMessage();
        }
	}
}
