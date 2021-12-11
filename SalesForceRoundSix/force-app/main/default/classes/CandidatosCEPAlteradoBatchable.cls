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
  
    private void handleLog(List<Database.SaveResult> srList, List<Candidato__c> scope)
    {
        for (Integer i = 0; i < scope.size(); i++)
        {
            if (!srList.get(i).isSuccess())
            {
                errorMessageHtml += '====== [' + 'Erro ao atualizar o registro: ' + scope.get(i).Id + '] ====<br/>' ;
                for (Database.Error err: srList.get(i).getErrors())
                {
                    errorMessageHtml += 'Mensagem: ' + err.getMessage() + '<br/>';
                }
            }
        }
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