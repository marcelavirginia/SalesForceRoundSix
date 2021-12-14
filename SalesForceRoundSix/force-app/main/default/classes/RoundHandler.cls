public without sharing class RoundHandler {

    static String MensagemHtml;

    public static void execute() {
        System.debug('RoundHandler_execute_Marcela'); 
        handleLog();

    }

    private static  void handleLog()
    {
        System.debug('RoundHandler_handleLog_Marcela');
        List<Round__c> roundsAux = RoundsSelector.selectAllRounds();
     
        for (Round__c  round : roundsAux) {

            if (round != null)
            {
                MensagemHtml += 'Round: ' + round.Name + ' Vencedor: ' + round.Name + '<br/>';  
                MensagemHtml += 'Partidas: ' + '<br/>';  

                System.debug(round.Name); 

            }

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
