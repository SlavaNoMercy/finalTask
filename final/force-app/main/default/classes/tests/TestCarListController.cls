@isTest(seeAllData=true)
global with sharing class TestCarListController {
    @isTest static void compareListWithExistingCars(){
        List<Product2> existtingCars = [SELECT Id, Name, ProductCode, Family
                FROM Product2 ];
        System.assertEquals(existtingCars, CarListController.getProduct(),'Wrong list of cars');
    }
}
