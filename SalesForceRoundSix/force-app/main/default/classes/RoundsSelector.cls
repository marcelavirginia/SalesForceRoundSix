public with sharing class RoundsSelector {

    public static List<Round__c> selectAllRoundsWithJogadores() {
        return [
            SELECT  Id, Name, TotalJogadoresEliminados__c, PremioTotal__c,
                    (
                        SELECT Id, Nick__c, Candidato__r.Name
                        FROM Jogadores2__r 
                        WHERE Eliminado__c = true
                    )
            FROM Round__c
        ];
    }

    public static List<Round__c> selectAllRounds() {
        return [
            SELECT Id FROM Round__c WHERE Premio__c > 0
        ];
    }
}
