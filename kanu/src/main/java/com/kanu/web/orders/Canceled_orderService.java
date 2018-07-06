package com.kanu.web.orders;

import java.util.List;


public interface Canceled_orderService {
	
	////////////조회//////////////////////////////////////////////////////////////////////

	//단건조회
	public Canceled_orderVO getCanceled_order(String orderId);
	
	//목록조회
	public List<Canceled_orderVO> getCanceled_orderList(Canceled_orderVO vo);
	
	
	
}
