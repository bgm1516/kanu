package com.kanu.web.orders;

public class Orders_SearchVO extends OrdersVO2{
	
	Integer start;
	Integer end;
	
	public Integer getStart() {
		return start;
	}
	public void setStart(Integer start) {
		this.start = start;
	}
	public Integer getEnd() {
		return end;
	}
	public void setEnd(Integer end) {
		this.end = end;
	}
	
	@Override
	public String toString() {
		return "Orders_SearchVO [start=" + start + ", end=" + end + "]";
	}
	
}
