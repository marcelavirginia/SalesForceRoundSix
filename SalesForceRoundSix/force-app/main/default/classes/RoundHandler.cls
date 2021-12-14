public with sharing class RoundHandler {

    public static void execute() {

        List<Round__c> roundsAux = RoundsSelector.selectRoundsPartidas();
     
        for (Round__c round : roundsAux) {
            if (round.Id.equals(roundId2)) {
                System.assertEquals(1, round.Jogadores2__r.size(), 'Só deveria ter 1 jogador no round 2');
            }
            for (Jogador__c jog : round.Jogadores2__r) {
                if (round.Id.equals(roundId)) {
                    System.assertNotEquals(jog.Id, jog2.Id, 'Jogador 2 não deveria ter retornado nessa query');
                } else if (round.Id.equals(roundId2)) {
                    System.assertEquals(jog.Id, jog3.Id, 'Brotou algum jogador que não era o 3, deu alguma merda.');
                }
            }
        }
    }
}
