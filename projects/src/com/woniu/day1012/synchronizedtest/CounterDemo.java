package com.woniu.day1012.synchronizedtest;

public class CounterDemo implements Runnable {
	private CountNums c; 
	private int type;
	public CounterDemo(CountNums c,int type) {
		// TODO Auto-generated constructor stub
		this.c = c;
		this.type = type;
	}
	
	@Override
	public void run() {
		// TODO Auto-generated method stub
		int i = 1000;
		if(type == 1) {
			while(i-->0) {
				c.count1();
			}
		}else {
			while(i-->0) {
				c.count2();
			}
		}
	}
}
