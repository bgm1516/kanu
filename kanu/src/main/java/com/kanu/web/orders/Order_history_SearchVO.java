package com.kanu.web.orders;

public class Order_history_SearchVO  extends Order_historyVO{
	
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
		return "DeptSearchVO [start=" + start + ", end=" + end + "]";
	}

}
