package com.kanu.web.orders;

import java.util.List;

public interface Order_historyService {
	
	//레코드 건수 조회
	public int count(Order_history_SearchVO searchVO);
	
	//목록조회
	public List<Order_historyVO> getOrder_historyList(Order_historyVO vo);
	
	
	//취소여부가 Y인 경우
	public void insertCanceled_orderY(Order_historyVO vo);
	
	
	//취소여부가 N인 경우
	public void updateOrder_historyN(Order_historyVO vo);
	
	
	//1)delete <공통>
	public void deleteOrder_history(Order_historyVO vo);
	
	
	
	
	
	
}
