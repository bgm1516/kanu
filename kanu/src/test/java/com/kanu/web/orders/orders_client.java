package com.kanu.web.orders;

import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { "classpath:config/applicationContext.xml", "classpath:config/transactionContext.xml" })
public class orders_client {
	
	@Autowired OrdersService ordersService;
	@Test
	public void getOrdersListTest(OrdersVO vo) {
		List<OrdersVO> list = ordersService.getOrdersList(vo);
		for(OrdersVO orders :list) {
			System.out.println(orders.getOrder_id() +"/"+ orders.getMenu_id() +"/"+ orders.getOrder_quantity());
		}
	}
}
