public without sharing class CandidatosCEPAlteradoBatchable implements Database.Batchable<SObject>, Database.Stateful {
    
    private String query;
    global String errorMessageHtml;

    global CandidatosCEPAlteradoBatchable()
    {
        errorMessageHtml = '';
        query = CandidatosSelector.getInstance().buildQuery();
    }

    public Database.QueryLocator start(Database.BatchableContext BC) {
        return Database.getQueryLocator(query);
    }
  
    //TODO: atualizar o campo CEPAlterado__c para FALSE
    public void execute(Database.BatchableContext BC, List<Candidato__c> scope) {
        System.debug("Executou ")

        for (Candidato__c record : scope) {
            record.CEPAlterado__c = false;    
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