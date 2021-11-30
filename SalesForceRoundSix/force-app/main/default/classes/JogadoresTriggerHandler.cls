public with sharing class JogadoresTriggerHandler {
   
    public static void beforeUpdate(List<Jogador__c> records, Map<Id, Jogador__c> oldMap) {
        for (Jogador__c jogador : records)
        {
            beforeUpdate(jogador, oldMap.get(jogador.Id));
        }
    }

    private static beforeUpdate(Jogador__c record, Map<Id, Jogador__c> recordOld)
    {
        if (isChanged(record.Eliminado__c, recordOld.Eliminado__c))
        {
            record.DataMorte__c = System.now();
        }
    }

    private static boolean isChanged(boolean value, boolean valueTocompare)
    {
        return value != valueTocompare;
    }
}