public without sharing class LadaCaseController {
	@AuraEnabled
	public static String saveCase(String caseJSON) {
    	try{
            Case newCase = (Case)JSON.deserialize(caseJSON, Case.class);
            upsert newCase;
            return 'Case Added';
        } catch(Exception e){
            System.debug(loggingLevel.ERROR, 'Error');
            return e.getMessage();
        }
	} 
}
