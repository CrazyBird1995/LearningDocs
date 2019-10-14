package com.woniu.day1012.synchronizedtest;
//唤起了会重新执行wait之前的代码吗？ 猜测：可以，因为等于sleep
public class CounterTests1 {
	public static void main(String[] args) {
		CountNums cn = new CountNums(-500);
		CounterDemo cd = new CounterDemo(cn,1);
		CounterDemo cd2 = new CounterDemo(cn,0);
		Thread t1 = new Thread(cd,"方法一");
		Thread t2 = new Thread(cd2,"方法二");
		t1.start();
		t2.start();
	}
}
