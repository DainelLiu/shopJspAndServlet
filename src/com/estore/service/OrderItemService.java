package com.estore.service;

import java.util.List;

import com.estore.domain.OrderItem;
import com.estore.utils.Page;

public interface OrderItemService {

	boolean addOrderItem(OrderItem orderItem);
	List<OrderItem>  findAllOrderItem();
	List<OrderItem>  findOrderItemByOid(String oid);
	
	Page findPageRecodes(String num);
	
}
