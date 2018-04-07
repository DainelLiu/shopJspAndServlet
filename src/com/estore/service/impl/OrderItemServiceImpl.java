package com.estore.service.impl;

import java.util.List;

import com.estore.dao.OrderItemDao;
import com.estore.dao.impl.OrderItemDaoImpl;
import com.estore.domain.Order;
import com.estore.domain.OrderItem;
import com.estore.service.OrderItemService;
import com.estore.utils.Page;
import com.estore.utils.TransactionManager;

public class OrderItemServiceImpl implements OrderItemService {

	private OrderItemDao orderItemDao = new OrderItemDaoImpl();
	
	public boolean addOrderItem(OrderItem orderItem) {
		TransactionManager.startTransaction();
		int placeOrder = orderItemDao.saveOrderItem(orderItem);
		if(placeOrder > 0){
			TransactionManager.commit();
			return true;
		}
		TransactionManager.rollback();
		TransactionManager.release();
		return false;
	}

	@Override
	public List<OrderItem> findAllOrderItem() {
		List<OrderItem> orderItem = orderItemDao.findAllOrderItem();
		return orderItem;
	}

	@Override
	public List<OrderItem> findOrderItemByOid(String oid) {
		List<OrderItem> orderItem = orderItemDao.findOrderItemByOid(oid);
		return orderItem;
	}

	@Override
	public Page findPageRecodes(String num) {
		
		/*int pageNum = 1;
		if(num != null){
			pageNum = Integer.parseInt(num);
		}
		int totalRecordNum = orderItemDao.findRecordCount();
		Page page = new Page(pageNum,totalRecordNum,5);
		List<Order> records = orderItemDao.findPageRecords(page.getStartIndex(), page.getPageSize());
		page.setRecords(records);*/
		return null;
	}

}
