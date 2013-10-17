package com.huntcoding;

import java.util.Timer;
import java.util.TimerTask;
public class OJFrameWork {
	private static final int ENFORCE_TIMEOUT = 5000;
	/**
	 * @param args
	 */
	public static void main(String[] args) {
		
		Timer timer = new Timer();
		final Object pass = new Object();
		final HCSecurityManager sm = new HCSecurityManager(pass);
		
		TimerTask task = new TimerTask(){
			@Override
			public void run() {
				sm.disable(pass);
				System.out.println();
				System.out.println(HCUtils.createResultJson(HCUtils.TIMEOUT, 0, 0, "TimeOut"));
				System.exit(0);			
			}
		};
		timer.schedule(task, ENFORCE_TIMEOUT);
		TestRunner runner = new TestRunner();
		// before run, lock permissions
		SecurityManager old = System.getSecurityManager();
		System.setSecurityManager(sm);
		String jsonout = runner.run();
		sm.disable(pass);
		//to get the result, find the last line breaker, parse the last line as json
		System.out.println();
		System.out.println(jsonout);
		System.exit(0);
		
	}
}
