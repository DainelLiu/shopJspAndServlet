package com.estore.dao.impl;

import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.List;

import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanHandler;
import org.apache.commons.dbutils.handlers.BeanListHandler;
import org.apache.commons.dbutils.handlers.ColumnListHandler;

import com.estore.dao.OrderDao;
import com.estore.domain.Order;
import com.estore.domain.OrderItem;
import com.estore.domain.User;
import com.estore.utils.C3P0Util;

public class OrderDaoImpl implements OrderDao {

	public int placeOrder(Order order) {
		try {
			QueryRunner qr = new QueryRunner(C3P0Util.getDataSource());
			String sql = "insert into `order`(oid,money,recipients,tel,address,state,ordertime,uid) values(?,?,?,?,?,?,?,?)";
			int update = qr.update(sql, order.getOid(), order.getMoney(), order.getRecipients(), order.getTel(),
					order.getAddress(), order.getState(), order.getOrdertime(), order.getUid());
			return update;
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}

	public int updateOrderStateByOid(String oid, int state) {
		try {
			QueryRunner qr = new QueryRunner(C3P0Util.getDataSource());
			String sql = "update `order` set state=? where oid=?";
			int update = qr.update(sql, state, oid);
			return update;
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}

	public Order findOrderById(String oid) {
		try {
			QueryRunner qr = new QueryRunner(C3P0Util.getDataSource());
			String sql = "select * from `order` where oid=?";
			Order order = qr.query(sql, new BeanHandler<Order>(Order.class), oid);
			if(order != null){
				return order;
			}
			return null;
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}

	public List<Order> findAllOrder() {
		try {
			QueryRunner qr = new QueryRunner(C3P0Util.getDataSource());
			String sql = "select * from `order`";
			List<Order> order = qr.query(sql, new BeanListHandler<Order>(Order.class));
			return order;
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}

	public int findRecordCount() {
		try {
			QueryRunner qr = new QueryRunner(C3P0Util.getDataSource());
			String sql = "select count(*) count from `order`";
			List query = (List) qr.query(sql,new ColumnListHandler("count"));
			return Integer.parseInt(query.get(0).toString());
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}

	public List<Order> findPageRecords(int startIndex, int pageSize) {
		try {
			String sql = "select * from `order` limit ?,?";
			QueryRunner qr = new QueryRunner(C3P0Util.getDataSource());
			List<Order> orders = qr.query(sql, new BeanListHandler<Order>(Order.class), startIndex, pageSize);
			if(orders != null || orders.size() > 0){
				for(int i = 0; i < orders.size(); i++){
					sql = "select * from user where uid=?";
					int uid = orders.get(i).getUid();
					User user = qr.query(sql, new BeanHandler<User>(User.class),uid);
					orders.get(i).setUser(user);
				}
			}
			return orders;
		} catch (SQLException e) {
			throw new RuntimeException(e+"...查询失败");
		}
	}
	
	public List<Order> findPageRecords(int startIndex, int pageSize, int uid) {
		try {
			String sql = "select * from `order` where uid=? order by ordertime DESC,oid DESC limit ?,?";
			QueryRunner qr = new QueryRunner(C3P0Util.getDataSource());
			List<Order> orders = qr.query(sql, new BeanListHandler<Order>(Order.class), uid, startIndex, pageSize);
			if(orders != null || orders.size() > 0){
				for(int i = 0; i < orders.size(); i++){
					sql = "select * from user where uid=?";
					uid = orders.get(i).getUid();
					User user = qr.query(sql, new BeanHandler<User>(User.class),uid);
					orders.get(i).setUser(user);
				}
			}
			return orders;
		} catch (SQLException e) {
			throw new RuntimeException(e+"...查询失败");
		}
	}

	public List<Order> findOrderByUid(int uid) {
		try {
			String sql = "select * from `order` where uid=? order by ordertime DESC,oid DESC ";
			QueryRunner qr = new QueryRunner(C3P0Util.getDataSource());
			List<Order> orders = qr.query(sql, new BeanListHandler<Order>(Order.class), uid);
			if(orders != null || orders.size() > 0){
				for(int i = 0; i < orders.size(); i++){
					SimpleDateFormat sdf1 = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
					String ordertime = sdf1.format(orders.get(i).getOrdertime());
					try {
						orders.get(i).setOrdertime(sdf1.parse(ordertime));
					} catch (ParseException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
					sql = "select * from orderitem where oid=?";
					String oid = orders.get(i).getOid();
					List<OrderItem> orderitems = qr.query(sql, new BeanListHandler<OrderItem>(OrderItem.class),oid);
					orders.get(i).setOrderitems(orderitems);
				}
			}
			return orders;
		} catch (SQLException e) {
			throw new RuntimeException(e+"...查询失败");
		}
	}

}
