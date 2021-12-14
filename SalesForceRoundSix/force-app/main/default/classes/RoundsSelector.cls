public without sharing class RoundsSelector {

    public static List<Round__c> selectAllRounds() {
        return[SELECT  Id, Name, Vencedor__c, Premio__c, TotalJogadoresEminados__c FROM Round__c];
       
    }

}