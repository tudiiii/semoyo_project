package com.ltf.semoyo.service;


import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import com.ltf.semoyo.dao.OrdersCmtDAO;
import com.ltf.semoyo.vo.OrdersCmt;
import com.ltf.semoyo.vo.PageVO;


@Service
public class OrdersCmtServiceImpl implements OrdersCmtService {

	private OrdersCmtDAO ordersCmtDAO;
	
	public void setOrdersCmtDAO(OrdersCmtDAO ordersCmtDAO) {
		this.ordersCmtDAO = ordersCmtDAO;
	}
	
	//현
	@Override
	public int insertOrdersCmt(OrdersCmt ordersCmt) {
		return ordersCmtDAO.insert(ordersCmt);
	}

	//현
	@Override
	public List<OrdersCmt> getOrderCmt(int orNo, int pageNo) {
		
		PageVO pageVO = new PageVO(pageNo,3);//페이징 계산start, end
		
		Map<String,Object> data = new HashMap<>();
		data.put("start", pageVO.getStart());
		data.put("end", pageVO.getEnd());
		data.put("orNo", orNo);
		
		return ordersCmtDAO.selectList(data);
	}

}
