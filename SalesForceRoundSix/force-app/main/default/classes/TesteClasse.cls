public with sharing class TesteClasse {
    public TesteClasse() {       
    }

    public void execute()
    {
        Jogador__c atacante;
        Jogador__c defensor;

        List<Jogador__c> listJogadoresVivos = BuscaJogadoresVivos(); 

        ObterAtacanteDefensor(listJogadoresVivos, atacante, defensor);

        Jogador__c JogaodorVencedor = Confronto(atacante, defensor);
        
        if (JogaodorVencedor != null)
        {
            Jogador__c jogador = new Jogador__c();
            jogador.Id = participantes[i].Jogador__c;
            jogador.Eliminado__c = true;
            jogadores.add(jogador);
            
            insert  JogaodorVencedor;
        }
    }

//Busca por clientes vivos
    public List<Jogador__c> BuscaJogadoresVivos() {
         List<Jogador__c> JogadoresVivos = [SELECT Id, Eliminado__c, Inteligencia__c, Velocidade__c 
         FROM Jogador__c WHERE Eliminado__c = false];
         
         return JogadoresVivos;
    }

//Busca o atacante e Defensor do jogo
public void ObterAtacanteDefensor(List<Jogador__c> Jogadores, Jogador__c Atacante, Jogador__c Defensor) 
{
    Integer listSize = Jogadores.size() - 1;
    
    Integer PosicaoRandom = Integer.valueof((Math.random() * listSize));

    Atacante = Jogadores[PosicaoRandom];
    Defensor = Jogadores[PosicaoRandom + 1];   
  
}

public Jogador__c Confronto (Jogador__c atacante, Jogador__c defensor) {
    
    bool ExisteVencedor = false;
    Jogador__c Vencedor = null;

    Integer qtdD20 = 0;
    Integer qtdD10 = 0;

   if ((qtdD20 + atacante.Forca__c) > (qtdD10 + defensor.Velocidade__c + defensor.Inteligencia__c))
   {
       ExisteVencedor = true;
       defensor.Eliminado__c = true;
       Vencedor = atacante;
   }
   else  if (qtdD20 == 1)
   {
        qtdD20 = 0;
        qtdD10 = 0;

        if ((qtdD20 + defensor.Forca__c) > (qtdD10 + atacante.Velocidade__c + atacante.Inteligencia__c))
        {
            ExisteVencedor = true;
            defensor.Eliminado__c = true;
            Vencedor = defensor;
        }
   }

   if (ExisteVencedor)
      return Vencedor;
   else
      return null;
    
}


}
