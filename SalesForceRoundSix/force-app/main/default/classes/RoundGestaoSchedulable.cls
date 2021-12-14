
public class RoundSchedulable implements Schedulable {

    public void execute(SchedulableContext sc) {
        RoundHandler.execute();
    }
   
}