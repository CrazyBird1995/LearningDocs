package com.woniu.day1011.threads2;

import java.util.concurrent.locks.ReentrantLock;

public class Cards {
	private int num;
	
	ReentrantLock r = new ReentrantLock();
	
	public Cards(int n) {
		// TODO Auto-generated constructor stub
		this.setNum(n);
	}
	
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
}
