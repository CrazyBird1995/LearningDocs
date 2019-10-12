package com.woniu.day1011.threads3;

public class CounterDemo implements Runnable{
	private CommonNums c;
	private Thread r;
	public CounterDemo(CommonNums c) {
		// TODO Auto-generated constructor stub
		this.c = c;
	}
	
	public void setR(Thread r) {
		this.r = r;
	}
	
	@Override
	public void run() {
		if(r!=null) {
			try {
				r.join();
			} catch (InterruptedException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		while(true) {
			if(c.count() <= 0) {
				break;
			}
		}

	}
}
