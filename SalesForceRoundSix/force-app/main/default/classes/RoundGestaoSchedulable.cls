
global  class RoundGestaoSchedulable implements Schedulable {

    Integer addMinutes;

    global RoundGestaoSchedulable() {
        this.addMinutes = 1;        
    }

    global  void execute(SchedulableContext sc) {
        
        System.debug('tarefa executada marcela'); 
        RoundHandler.execute();
    }

    

   

}