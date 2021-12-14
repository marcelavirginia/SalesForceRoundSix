public with sharing class RoundsSelector {

    public static List<Round__c> selectAllRounds() {
        return [
            SELECT Id FROM Round__c WHERE Premio__c > 0
        ];
    }
}
