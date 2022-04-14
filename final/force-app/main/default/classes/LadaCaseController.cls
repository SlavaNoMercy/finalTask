public class LadaCaseController {
	@AuraEnabled
	public static String saveCase(String caseJSON) {
    	Case newCase = (Case)JSON.deserialize(caseJSON, Case.class);
    	try{
            upsert newCase;
            return 'Case Added';
        } catch(Exception e){
            System.debug(loggingLevel.ERROR, 'Error');
            return e.getMessage();
        }
	}
    
}
