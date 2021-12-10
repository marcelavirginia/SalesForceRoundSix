public without sharing class CandidatosCEPAlteradoBatchable implements Database.Batchable<sObject> {
    
    public Database.QueryLocator start(Database.BatchableContext BC) {
        return Database.getQueryLocator(CandidatosSelector.getQueryLocatorCEPBatchable());
    }
  
    //TODO: atualizar o campo CEPAlterado__c para FALSE
    public void execute(Database.BatchableContext BC, List<Candidato__c> scope) {
        
        for (Candidato__c record : scope) {
            record.Idade__c = 0;    
        }

        update scope;
        
        List<Database.SaveResult> srList = Database.update(scope, false);
        
        handleLog(srList, scope);

    }
  
    public void finish(Database.BatchableContext BC) {
        sendLog();
    }

    private void sendLog()
    {
        Messaging.SingleEmailMessage message = new Messaging.SingleEmailMessage();
        message.setToAddresses(new List<String>{'marcelavirginia@gmail.com'});
        message.setSubject('Log de erros');
        message.setHtmlBody(errorMessageHtml);
        List<Messaging.SingleEmailMessage> messages = new List<Messaging.SingleEmailMessage>{message};
        
        Messaging.sendEmail(messages);
    }
}