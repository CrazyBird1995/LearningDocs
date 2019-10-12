package com.woniu.day1011.threads2;

import java.util.concurrent.locks.ReentrantLock;

public class Person implements Runnable{
	private Cards c ;
	private Boolean type;//true:花钱 false赚钱
	private int moneyNum;
	private int sleepTime;
	private ReentrantLock r;
	public Person(Cards c,Boolean type,int moneyNum,int sleepTime, ReentrantLock r) {
		// TODO Auto-generated constructor stub
		this.c = c;
		this.type = type;
		this.moneyNum = moneyNum;
		this.sleepTime = sleepTime;
		this.r = r;
	}
	@Override
	public void run() {
		// TODO Auto-generated method stub
		while(true) {
			
			r.lock();
			try {
				if(type) {
					// 花钱
					if(c.getNum() >= moneyNum) {
						c.setNum(c.getNum() - moneyNum);
						System.out.println(Thread.currentThread().getName() + "花了" + moneyNum + "元,还剩" + c.getNum()  + "元");
					}else {
						System.out.println(Thread.currentThread().getName() + "决定不花钱！剩余" + c.getNum() + "元");
					}
				}else {
					// 赚钱
					c.setNum(c.getNum() + moneyNum);
					System.out.println(Thread.currentThread().getName() + "赚了" + moneyNum + "元,还剩" + c.getNum()  + "元");
				}

			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}finally {
				r.unlock();
			}
			try {
				Thread.sleep(sleepTime);
			} catch (InterruptedException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
		}
	}

}
