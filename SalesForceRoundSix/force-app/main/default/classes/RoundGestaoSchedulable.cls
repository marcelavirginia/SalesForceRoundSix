
global  class RoundGestaoSchedulable implements Schedulable {

    global  void execute(SchedulableContext sc) {
        RoundHandler.execute();
    }
}