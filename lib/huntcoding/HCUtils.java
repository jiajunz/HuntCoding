package com.huntcoding;

public class HCUtils {
	private HCUtils() {
	}
	
	public static final String PASS = "Passed";
	public static final String FAIL = "Incorrect Answer";
	public static final String ERROR = "Runtime Error";
	public static final String TIMEOUT = "Timeout";
	
	public enum RT{
		C,
		LOGN,
		N,
		NLOGN,
		NS,
		NSLOGN,
		NQ,
		NQLOGN,
		NSS,
		NSSLOGN,
		NE,
		NFAC
	}
	
	
	public static boolean assertEquals(int a, int b) {
		return a==b;
	}
	
	public static boolean assertEquals(Object a, Object b) {
		return a.equals(b);
	}
	
	
	// Json Result
	// { "result ": "passed/filed/runtime",
	//   "passed": 10,
	//   "total": 10,
	//   "details ": "runtime, "first failed case", "errors"
	// }
	//
	//
	//
	public static String createResultJson(String result, int passed, int total, String details) {
		StringBuilder sb = new StringBuilder();
		sb.append("{\"result\":\"");
		sb.append(result);
		sb.append("\",\"passed\":");
		sb.append(passed);
		sb.append(",\"total\":");
		sb.append(total);
		sb.append(",\"details\":\"");
		sb.append(details);
		sb.append("\"}");
		return sb.toString();		
	}
	
	public static boolean isTimedOut(long ctime, long startTime, long endTime, int input_size, RT rt){
		long totalTime = endTime - startTime;
		if(rt == RT.N){
			if(totalTime < 100*ctime + ctime*input_size*Math.sqrt(input_size)) { // less than nlogn
				return false;
			}
			else{
				return true;
			}
		}
		return false;	
	}
	
}
