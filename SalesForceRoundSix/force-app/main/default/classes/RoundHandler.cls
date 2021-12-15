public without sharing class RoundHandler {

    static String MensagemHtml;

    public static void execute() {
        System.debug('Relatório de Roud'); 
        MontaRelatorioRund();
        sendRel();
     }

    private static void  MontaRelatorioRund()
    {
        
        List<Round__c> roundsAux = RoundsSelector.selectAllRounds();
        List<Partida__c> partidaRound = PartidasSelector.selectAllPartidasRounds(roundsAux[0].Id);
        
        if (roundsAux.size() == 0)
        {
            MensagemHtml = 'Acompanhamento do Round' + '<br/>';
            MensagemHtml += 'Round: ' + roundsAux[0].Name + '<br/>';
            MensagemHtml += '----------------------------------------------' + '<br/>';

            for (Partida__c record : partidaRound) {

                MensagemHtml += 'Partida : ' + record.Name  + '<br/>';
                System.debug('record: ' + JSON.serialize(record));
            }
        }
        else {
            System.debug('Nenhum round está em andamento!');
            MensagemHtml = 'Nenhum round está em andamento!';
        }
    }

    private static void sendRel()
    {
        Messaging.SingleEmailMessage message = new Messaging.SingleEmailMessage();
        message.setToAddresses(new List<String>{'marcelavirginia@gmail.com'});
        message.setSubject('Acompanhamento de Round');
        message.setHtmlBody(MensagemHtml);
        List<Messaging.SingleEmailMessage> messages = new List<Messaging.SingleEmailMessage>{message};
        
        Messaging.sendEmail(messages);
    }
   
}
