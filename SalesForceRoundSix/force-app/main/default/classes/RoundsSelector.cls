public without sharing class RoundsSelector {

    public static List<Round__c> selectAllRounds() {
        return [SELECT  Id, Name, Vencedor__c, Premio__c, TotalJogadoresEminados__c, (SELECT Id, Name FROM Partidas__r) FROM Round__c WHERE Vencedor__c = '' ];
    }

}