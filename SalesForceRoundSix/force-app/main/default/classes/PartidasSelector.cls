public without sharing class PartidasSelector {

    public static Partida__c[] selectAllPartidasRounds(Id idRound) {
        return [SELECT Id, Name, InicioPartida__c, TerminoPartida__c, NumeroJogadoresEliminados__c FROM Partida__c WHERE Round__c = :idRound];
    }
}
