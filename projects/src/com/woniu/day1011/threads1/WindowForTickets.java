package com.woniu.day1011.threads1;

import java.util.concurrent.locks.ReentrantLock;

import com.woniu.day1011.threads1.Tickets;

public class WindowForTickets implements Runnable {
	Tickets c;
	int num;
	int interal;
	String name;
	
	static ReentrantLock r = new ReentrantLock();
	int stopNum;
	public WindowForTickets(Tickets c,int num,int stopNum,int interal,String name) {
		// TODO Auto-generated constructor stub
		this.c = c;
		this.num = num;
		this.name = name;
		this.stopNum = stopNum;
		this.interal = interal;
	}
	@Override
	public void run() {
		// TODO Auto-generated method stub
		int all =0;
		while(true) {
			r.lock();
			try {
				if(c.getTickets() > this.stopNum) {
					if(c.getTickets() <= this.num) {
						//	break;
						all += c.getTickets();
						System.out.println(Thread.currentThread().getName() +"--窗口" + this.name +"卖出了"+ c.getTickets() + "张票!剩余" + 0 + "张票！");
						c.setTickets(0);
					}else {
						all +=num;
						System.out.println(Thread.currentThread().getName() +"--窗口" + this.name +"卖出了"+ num + "张票!剩余" + (c.getTickets() - this.num) + "张票！");
						c.setTickets(c.getTickets() - this.num);
					}
					
					try {
						Thread.sleep(interal);
					} catch (InterruptedException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
				}else {
					break;
				}
			}catch (Exception e) {
				e.printStackTrace();
			}finally {
				r.unlock();
			}
		}
		System.out.println(Thread.currentThread().getName() + "--窗口"+ this.name + "结束售票!(票已卖光！)共卖票"+ all + "张！");
	}	
}

