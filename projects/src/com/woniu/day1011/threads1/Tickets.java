package com.woniu.day1011.threads1;

import java.util.concurrent.locks.ReentrantLock;

public class Tickets {
	private int tickets;
	public Tickets(int tickets) {
		super();
		this.tickets = tickets;
//		r = new ReentrantLock();
	}

	public int getTickets() {
		return tickets;
	}
	public Boolean setTickets2(int numSold) {
		return false;
	}
	public void setTickets(int tickets) {
		this.tickets = tickets;
//		try {
//			r.lock();
//			this.tickets = tickets;
//		}catch (Exception e) {
//			e.printStackTrace();
//		}finally {
//			r.unlock();
//		}

	} 
}
