package com.kanu.web.orders;

import java.util.List;

public interface Order_historyService {
	
	////////////조회//////////////////////////////////////////////////////////////////////
	
	//레코드 건수 조회
	public int count(Order_history_SearchVO searchVO);
	
	//목록조회
	public List<Order_historyVO> getOrder_historyList(Order_historyVO vo);
	
<<<<<<< HEAD
	//취소여부가 Y인 경우
	public void insertCanceled_orderY(Order_historyVO vo);
=======
	////////////추가 및 갱신//////////////////////////////////////////////////////////////////////
	
	//1)insert(예약여부가 Y라면 reserve_history에 삽입한다)
	public void insertOrder_history(Order_historyVO vo);
>>>>>>> branch 'master' of https://github.com/bgm1516/kanu
	
<<<<<<< HEAD
	//취소여부가 N인 경우
	public void updateOrder_historyN(Order_historyVO vo);
	
	//예약여부가 Y인 경우
	public void insertReserve_historyY(Order_historyVO vo);
	
	//예약여부가 N인경우
	public void updateReserve_historyN(Order_historyVO vo);
	
=======
	//1)update(예약여부/취소여부)
	public void updateOrder_history(Order_historyVO vo);
	
	////////////삭제//////////////////////////////////////////////////////////////////////
>>>>>>> branch 'master' of https://github.com/bgm1516/kanu
	
	//1)delete <공통>
	public void deleteOrder_history(Order_historyVO vo);
	
	
	
	
	
	
}
