public with sharing class CandidatosSelector extends Selector
{
    public CandidatosSelector() {

    }

    private static CandidatosSelector instance = null;

    public static CandidatosSelector getInstance()
    {
        if (instance == null) 
        {
            instance = new CandidatosSelector();
        }

        return instance;
    }

    public CandidatosSelector()
    {
        sObjType = Account.sObjectType;
        fieldset = SObjectType.Candidato__c.FieldSets.Selector;
    }


}
