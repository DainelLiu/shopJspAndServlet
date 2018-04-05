package com.estore.service.impl;

import java.util.List;

import com.estore.dao.OrderDao;
import com.estore.dao.impl.OrderDaoImpl;
import com.estore.domain.Order;
import com.estore.domain.Product;
import com.estore.service.OrderService;
import com.estore.utils.Page;
import com.estore.utils.TransactionManager;

public class OrderServiceImpl implements OrderService {
	
	private OrderDao orderDao = new OrderDaoImpl();

	public boolean placeOrder(Order order) {
		TransactionManager.startTransaction();
		int placeOrder = orderDao.placeOrder(order);
		if(placeOrder > 0){
			TransactionManager.commit();
			return true;
		}
		TransactionManager.rollback();
		TransactionManager.release();
		return false;
	}

	public boolean updateOrderState(String oid, int state) {
		TransactionManager.startTransaction();
		int updateOrder = orderDao.updateOrderStateByOid(oid, state);
		if(updateOrder > 0){
			TransactionManager.commit();
			return true;
		}
		TransactionManager.rollback();
		TransactionManager.release();
		return false;
	}
	
	public Order findOrderById(String oid) {
		Order findOrderById = orderDao.findOrderById(oid);
		return findOrderById;
	}

	public List<Order> findAllOrder() {
		List<Order> orders = orderDao.findAllOrder();
		return orders;
	}

	public Page findPageRecodes(String num) {
		int pageNum = 1;
		if(num != null){
			pageNum = Integer.parseInt(num);
		}
		int totalRecordNum = orderDao.findRecordCount();
		Page page = new Page(pageNum,totalRecordNum,5);
		List<Order> records = orderDao.findPageRecords(page.getStartIndex(), page.getPageSize());
		page.setRecords(records);
		return page;
	}

	public List<Order> findOrderByUid(int uid) {
		List<Order> orders = orderDao.findOrderByUid(uid);
		return orders;
	}

}
