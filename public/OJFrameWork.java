import java.util.Timer;
import java.util.TimerTask;



public class OJFrameWork {

	
	/**
	 * @param args
	 */
	public static void main(String[] args) {
		
		Timer timer = new Timer();
		TimerTask task = new TimerTask(){

			@Override
			public void run() {
				System.out.println("Timeout");
				System.exit(0);			
			}
		};
		
		timer.schedule(task, 5000);
		TestRunner runner = new TestRunner();
		System.out.println(runner.run());
		System.exit(0);
	}
}
