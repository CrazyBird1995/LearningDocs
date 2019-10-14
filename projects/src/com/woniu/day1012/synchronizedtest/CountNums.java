package com.woniu.day1012.synchronizedtest;

//import java.util.concurrent.locks.ReentrantLock;

public class CountNums {
	private int total;

	public CountNums(int total) {
		// TODO Auto-generated constructor stub
		this.total = total;
	}
	
	public void printTotal() {
		System.out.println(total);
	}
	public int getTotal(){
		return this.total;
	}
	public synchronized void count2() {
		System.out.println("方法2开始");
		while(total <= 0) {
			try {
				
				wait();
			} catch (InterruptedException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		total = total - 1;
		System.out.println(Thread.currentThread().getName() + ":" + total);
		notify();
		System.out.println("方法2结束，,唤醒方法1");
	}
	
	public synchronized void count1() {
		System.out.println("方法1开始");
		while(total > 0) {
			try {
				wait();
			} catch (InterruptedException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		total = total + 1;
		System.out.println(Thread.currentThread().getName() + ":" + total);
		notify();
		System.out.println("方法1结束,唤醒方法2");
	}
}
