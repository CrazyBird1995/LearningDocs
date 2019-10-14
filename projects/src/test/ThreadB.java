package test;

public class ThreadB implements Runnable {
	Object o;
	public ThreadB(Object o) {
		super();
		this.o = o;
	}
	@Override
	public void run() {
		while (true) {
			synchronized (o) {
				if (Test.flag) {
					try {
						o.wait();
					} catch (InterruptedException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
				}
				Test.str = "B";
				System.out.println(Thread.currentThread().getName() + ":" + Test.str);
				Test.flag = true;
				o.notify();
			}
		}
	}
}
