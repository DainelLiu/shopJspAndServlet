package com.estore.dao;

import java.util.List;

import com.estore.domain.Order;
import com.estore.domain.OrderItem;

public interface OrderItemDao {
	
	/**
	 * 保存订单项
	 * @param orderItem
	 * 			传入oid,pid,buynum的内容，itemid为数据库自增
	 * @return
	 */
	public int saveOrderItem(OrderItem orderItem);
	
	/**
	 * 删除订单项
	 * @param itemid
	 * @return
	 */
	public int deleteOrderItem(int itemid);
	
	/**
	 * 修改订单项
	 * @param orderItem
	 * @return
	 */
	public int updateOrderItem(OrderItem orderItem);
	
	/**
	 * 根据订单项id查询订单项
	 * @param itemid
	 * @return
	 */
	public OrderItem findOrderItemByItemid(int itemid);

	/**
	 * 查询所有商品
	 * @return
	 */
	public List<OrderItem> findAllOrderItem();
	
	public List<OrderItem> findOrderItemByOid(String oid);
	
	public List<OrderItem> findPageRecords(int startIndex, int pageSize, String oid);

}
