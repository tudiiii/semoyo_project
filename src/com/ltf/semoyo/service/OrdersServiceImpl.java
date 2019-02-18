package com.ltf.semoyo.service;


import java.util.List;

import org.springframework.stereotype.Service;

import com.ltf.semoyo.dao.OrdersDAO;
import com.ltf.semoyo.vo.Order;


@Service
public class OrdersServiceImpl implements OrdersService {

	private OrdersDAO ordersDAO;
	
	public void setOrdersDAO(OrdersDAO ordersDAO) {
		this.ordersDAO = ordersDAO;
	}
	
	//현
	@Override
	public List<Order> getOrder(int no) {
		
		return ordersDAO.selectList(no);
	}
	//예빈
	@Override
	public boolean insert2(Order order) {
		return 1 == ordersDAO.insert2(order);
	}
}
