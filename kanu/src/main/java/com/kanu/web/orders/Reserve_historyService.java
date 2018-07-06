package com.kanu.web.orders;

import java.util.List;


public interface Reserve_historyService {
	
	////////////조회//////////////////////////////////////////////////////////////////////

	
	//단건조회
	public Reserve_historyVO getReserve_history(String orderId);
	
	//목록조회
	public List<Reserve_historyVO> getReserve_historyList(Reserve_historyVO vo);
	
	
	
}
