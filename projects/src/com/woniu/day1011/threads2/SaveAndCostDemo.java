package com.woniu.day1011.threads2;

import java.util.concurrent.locks.ReentrantLock;

public class SaveAndCostDemo {
	public static boolean SAVE_MONEY = false;
	public static boolean COST_MONEY = true;
	public static void main(String[] args) {
		Cards c = new Cards(2000);
		ReentrantLock lock1 = new ReentrantLock();
		Person u = new Person(c,SAVE_MONEY, 200, 1000, lock1);
		Person uG = new Person(c,COST_MONEY, 800, 3000, lock1);
		Thread t = new Thread(u,"你");
		Thread t2 = new Thread(uG,"你女朋友");
		t.start();
		t2.start();
		
	}
}
