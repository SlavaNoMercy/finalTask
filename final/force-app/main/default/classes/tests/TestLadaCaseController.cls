@isTest
public with sharing class TestLadaCaseController {
    @isTest
    public  static void testReaCase() {
        Case newCase = new Case(Status = 'New',Origin = 'Web',
        Subject = 'Lada ne edet!', SuppliedEmail = 'slavam2001@bk.ru', Description = 'qwe');
        String result = LadaCaseController.saveCase(JSON.serialize(newCase));
        System.assertEquals('Case Added', result);
    }

    @isTest
    public  static void testNullCase() {
        Case newCase = new Case();
        String result = LadaCaseController.saveCase(JSON.serialize(newCase));
        System.assertEquals('Case Added', result);
    }
}
