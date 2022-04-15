@isTest
public with sharing class TestLadaLeadController {
    @isTest
    public  static void testRealLead() {
        Lead newLead = new Lead(Company = 'none',LastName = 'Doe',LeadSource = 'Web',
        Status = 'Open - Not Contacted', Email = 'slavam2001@bk.ru', Description = 'qwe');
        String result = LadaLeadController.saveLead(JSON.serialize(newLead));
        System.assertEquals('Lead Added', result);
    }

    @isTest
    public  static void testNullLead() {
        Lead newLead = new Lead();
        String result = LadaLeadController.saveLead(JSON.serialize(newLead));
        System.assertEquals('Upsert failed. First exception on row 0; first error:'+
                            ' REQUIRED_FIELD_MISSING, Required fields are missing: '+
                            '[LastName, Company]: [LastName, Company]', result);
    }
}