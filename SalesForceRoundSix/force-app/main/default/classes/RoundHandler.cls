public without sharing class RoundHandler {

    static String MensagemHtml;

    public static void execute() {
        System.debug('Relatório de Roud'); 
        BuscaDadosRund();
     }

    private static void  BuscaDadosRund()
    {
        
        List<Round__c> roundsAux = RoundsSelector.selectAllRounds();
        Partida__c[] partidaRound = [SELECT Id, Name, InicioPartida__c, TerminoPartida__c, NumeroJogadoresEliminados__c FROM Partida__c WHERE Round__c = : roundsAux[0].Id];
        
        MensagemHtml = 'Acompanhamento do Round' + roundsAux[0].Name + '<br/>';
        
        for(Integer i = 0; i < partidaRound.size(); i++)
        {
            MensagemHtml += 'Partida: ' + partidaRound[i].Name +  '   Jogadores Eliminados: ' + partidaRound[i].NumeroJogadoresEliminados__c + '<br/>';
            
            System.debug('Data Inicio: ' + partidaRound[i].NumeroJogadoresEliminados__c);
            System.debug('record: ' + JSON.serialize(partidaRound[i]));
        }
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
