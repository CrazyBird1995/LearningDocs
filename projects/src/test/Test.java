package test;

public class Test {
	static boolean flag=true;
	static	String str="";
	public static void main(String[] args) {
		Object o = new Object();
		ThreadA threadA = new ThreadA(o);
		ThreadB threadB = new ThreadB(o);
		Thread thread_A = new Thread(threadA,"线程A");
		Thread thread_B = new Thread(threadB,"线程B");
		thread_A.start();
		thread_B.start();
	}

}
