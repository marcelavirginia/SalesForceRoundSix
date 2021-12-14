public with sharing class RoundHandler {

    static    String MensagemHtml;

    public static void execute() {

        handleLog();

    }

    private static  void handleLog()
    {
        List<Round__c> roundsAux = RoundsSelector.selectAllRounds();
     
        for (Round__c round : roundsAux) {
            MensagemHtml += 'Round: ' + round.Name + '<br/>';
        }

        sendLog();
    }


    private static  void sendLog()
    {
        Messaging.SingleEmailMessage message = new Messaging.SingleEmailMessage();
        message.setToAddresses(new List<String>{'marcelavirginia@gmail.com'});
        message.setSubject('Log de erros');
        message.setHtmlBody(MensagemHtml);
        List<Messaging.SingleEmailMessage> messages = new List<Messaging.SingleEmailMessage>{message};
        
        Messaging.sendEmail(messages);
    }
   
}
