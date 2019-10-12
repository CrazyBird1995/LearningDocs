package com.woniu.day1011.threads1;

import com.woniu.day1011.threads1.Tickets;
import com.woniu.day1011.threads1.WindowForTickets;

/**
 * 卖票系统
 * @author EDZ
 *
 */
public class TicketsTest {
	public static void main(String[] args) {
		Tickets t = new Tickets(1000);
		WindowForTickets w1 = new WindowForTickets(t,1,0,0,"窗口1");
		WindowForTickets w2 = new WindowForTickets(t,1,0,0,"窗口2"); 
		Thread t1 = new Thread(w1,"窗口1");
		Thread t2 = new Thread(w2,"窗口2");
//		t1.setPriority(10);
//		t2.setPriority(1);
//		System.out.println(t1.isAlive());
		t1.start();
//		System.out.println(t1.isAlive());
//		try {
//			t1.join();
//		} catch (InterruptedException e1) {
//			// TODO Auto-generated catch block
//			e1.printStackTrace();
//		}
		t2.start();
		

//		try {
//			t2.join();
//		} catch (InterruptedException e) {
//			// TODO Auto-generated catch block
//			e.printStackTrace();
//		}
	}
}