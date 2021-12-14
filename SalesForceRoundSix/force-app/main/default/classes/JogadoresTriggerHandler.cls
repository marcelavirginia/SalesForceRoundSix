public without sharing class JogadoresTriggerHandler {

    public static void afterUpdate(List<Jogador__c> records, Map<Id, Jogador__c> oldMap) {
        System.debug('trigger 1 executada marcela'); 
        RoundHandler.execute(); 

    }

    public static void beforeUpdate(List<Jogador__c> records, Map<Id, Jogador__c> oldMap) {
        System.debug('trigger 2 executada marcela'); 
    }
}