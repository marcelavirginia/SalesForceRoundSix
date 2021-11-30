public with sharing class JogadoresTriggerHandler {
   
    public static void beforeUpdate(List<Jogador__c> records, Map<Id, Jogador__c> oldMap) {
        for (Jogador__c jogador : records)
        {
            beforeUpdate(jogador, oldMap.get(jogador.Id));
        }
    }

    private static void beforeUpdate(Jogador__c record, Jogador__c recordOld)
    {
        if (isChanged(record, recordOld, Jogador__c.Eliminado__c))
        {
            setValue(record, Jogador__c.DataMorte__c, System.now());
        }
    }

    private static boolean isChanged(Jogador__c record, Jogador__c recordTocompare, Schema.SObjectField fieldToValued)
    {
        return  isChanged(record.get(fieldToValued), recordTocompare.get(fieldToValued));
    }

    private static boolean isChanged(Object value, Object valueTocompare)
    {
        return value != valueTocompare;
    }

    private static void setValue (Jogador__c record, SObjectField field, Object value)
    {
        record.put(field, value);
    }
}