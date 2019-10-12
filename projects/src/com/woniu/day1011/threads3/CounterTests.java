package com.woniu.day1011.threads3;

public class CounterTests {
	public static void main(String[] args) {
		CommonNums s = new CommonNums(200);
		CounterDemo cd1 = new CounterDemo(s);
		CounterDemo cd2 = new CounterDemo(s);
		CounterDemo cd3 = new CounterDemo(s);
		Thread t1 = new Thread(cd1,"计数器1");
		Thread t2 = new Thread(cd2,"计数器2");
		Thread t3 = new Thread(cd3,"计数器3");
		cd1.setR(t2);
		cd2.setR(t1);
		t1.start();
		t2.start();
		t3.start();
	}
}
