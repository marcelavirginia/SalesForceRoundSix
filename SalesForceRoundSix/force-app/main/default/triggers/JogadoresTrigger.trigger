trigger JogadoresTrigger on Jogador__c (after insert, before update, after update) {
    
    if(trigger.isAfter){
        if(trigger.isInsert || trigger.isUpdate || trigger.isUndelete){
            System.debug('trigger1'); 
            RoundHandler.execute(); 
        }
       
    }
}