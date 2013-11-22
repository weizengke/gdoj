/**
 * 
 */
package com.gdoj.test.thread;

import java.util.concurrent.ConcurrentLinkedQueue;

public class JudgeQueue {

	private static ConcurrentLinkedQueue<Integer> QueueGCC = new ConcurrentLinkedQueue<Integer>();

	public static int getsize() {
		try {
			return QueueGCC.size();
			
		} catch (NullPointerException ne) {
			ne.printStackTrace();
		}
		return 0;
	}
	public static boolean addGCC(int runId) {
		try {
			QueueGCC.add(runId);
			//System.out.println("add"+runId);
			//System.out.println("size0:"+QueueGCC.size());
			return true;
		} catch (NullPointerException ne) {
			ne.printStackTrace();
			return false;
		}
	}
	public static Integer pollGCC() {
		return QueueGCC.poll();
	}
	public static boolean isGCCEmpty() {
		return QueueGCC.isEmpty();
	}
}
