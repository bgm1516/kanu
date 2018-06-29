package com.kanu.web.orders;

import java.util.List;

public interface Order_historyService {
	
	////////////조회//////////////////////////////////////////////////////////////////////
	
	//레코드 건수 조회
	//public int count(Order_history_SearchVO searchVO);
	
	//단건조회
	public Order_historyVO getOrderhistory(String orderId);
	
	//목록조회
	public List<Order_historyVO> getOrderhistoryList(Order_historyVO vo);
	
	////////////갱신//////////////////////////////////////////////////////////////////////
	
	//1)insert
	public void insertOrderhistory(Order_historyVO vo);
	
	//1)update
	public void updateOrderhistory(Order_historyVO vo);
	
	////////////삭제//////////////////////////////////////////////////////////////////////
	
	//1)delete <공통>
	public void deleteOrderhistory(Order_historyVO vo);
	
	//2)delete <reserve에서만>
	public void deleteOrderhistoryR(Order_historyVO vo);
	
	
	
	
	
	
}
