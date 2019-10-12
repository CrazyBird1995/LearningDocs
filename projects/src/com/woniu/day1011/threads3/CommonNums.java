package com.woniu.day1011.threads3;

import java.util.concurrent.locks.ReentrantLock;

public class CommonNums {
	private int total;
	ReentrantLock r = new ReentrantLock();
	public CommonNums(int total) {
		// TODO Auto-generated constructor stub
		this.total = total;
	}
	
	public int count() {
		r.lock();
		try {
			if(this.total > 0) {
				this.total--;
				System.out.println(Thread.currentThread().getName() + ":" + this.total);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			r.unlock();
		}
		return total;
	}
	
}
