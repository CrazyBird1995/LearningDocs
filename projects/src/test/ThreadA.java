package test;

public class ThreadA implements Runnable {
	Object o;
	public ThreadA(Object o) {
		super();
		this.o = o;
	}
	@Override
	public void run() {
		while (true) {
			synchronized (o) {
				if (!Test.flag) {
					try {
						o.wait();
					} catch (InterruptedException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
					
				}
				Test.str = "A";
				System.out.println(Thread.currentThread().getName() + ":" + Test.str);
				Test.flag = false;
				o.notify();
			}
		}
	}
}
