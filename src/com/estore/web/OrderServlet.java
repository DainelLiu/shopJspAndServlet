package com.estore.web;

import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.estore.domain.Order;
import com.estore.domain.OrderItem;
import com.estore.domain.OrderTimeExtend;
import com.estore.domain.Product;
import com.estore.domain.ShoppingCar;
import com.estore.domain.ShoppingItem;
import com.estore.domain.User;
import com.estore.service.OrderItemService;
import com.estore.service.OrderService;
import com.estore.service.ProductService;
import com.estore.service.ShoppingItemService;
import com.estore.service.UserService;
import com.estore.service.impl.OrderItemServiceImpl;
import com.estore.service.impl.OrderServiceImpl;
import com.estore.service.impl.ProductServiceImpl;
import com.estore.service.impl.ShoppingItemServiceImpl;
import com.estore.service.impl.UserServiceImpl;
import com.estore.utils.OrderIdUtils;
import com.estore.utils.Page;

public class OrderServlet extends HttpServlet {

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doPost(request, response);
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=utf-8");

		String op = request.getParameter("op");
		if ("findAllOrder".equals(op)) {
			findAllOrder(request, response);
		} else if ("placeOrder".equals(op)) {
			processOrder(request, response);
		} else if ("myoid".equals(op)) {
			myOrder(request, response);
		} else if ("delOrder".equals(op)) {
			delOrder(request, response);
		} else if ("lgout".equals(op)) {
			// lgout(request, response);
		}else if ("getOrderItem".equals(op)) {
			getOrderItem(request, response);
		}else if ("updateOrderSign".equals(op)) {
			updateOrderSign(request, response);
		}
	}

	private void delOrder(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		String oid = request.getParameter("oid");
		String stateStr = request.getParameter("state");
		OrderService orderService = new OrderServiceImpl();
		boolean result = orderService.updateOrderState(oid, Integer.parseInt(stateStr));
		if(result){
			User user = (User) request.getSession().getAttribute("user");
			String num = request.getParameter("num");
			Page orders = orderService.findPageRecodes(user.getUid(),num);
			request.setAttribute("page", orders);
			List<OrderTimeExtend> ordertimes = new ArrayList<OrderTimeExtend>();
			for(int i = 0 ; i < orders.getRecords().size(); i++){
				Order order = (Order) orders.getRecords().get(i);
				OrderTimeExtend ote = new OrderTimeExtend();
				ote.setOid(order.getOid());
				SimpleDateFormat sdf1 = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
				String ordertime = sdf1.format(order.getOrdertime());
				ote.setOrdertime(ordertime);
				ordertimes.add(ote);
			}
			request.setAttribute("orders", orders);
			request.setAttribute("ordertimes", ordertimes);
//			response.sendRedirect(request.getContextPath()+"/myOrders.jsp");
			request.getRequestDispatcher("/myOrders.jsp").forward(request, response);
			return ;
		}
	}

	private void myOrder(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		User user = (User) request.getSession().getAttribute("user");
		OrderService orderService = new OrderServiceImpl();
		//List<Order> orders = orderService.findOrderByUid(user.getUid());
		
		/*---*/
		
		String num = request.getParameter("num");
		Page orders = orderService.findPageRecodes(user.getUid(),num);
		request.setAttribute("page", orders);
		
		/*--*/
		
		List<OrderTimeExtend> ordertimes = new ArrayList<OrderTimeExtend>();
		for(int i = 0 ; i < orders.getRecords().size(); i++){
			Order order = (Order) orders.getRecords().get(i);
			OrderTimeExtend ote = new OrderTimeExtend();
			ote.setOid(order.getOid());
			SimpleDateFormat sdf1 = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			String ordertime = sdf1.format(order.getOrdertime());
			ote.setOrdertime(ordertime);
			ordertimes.add(ote);
		}
		request.setAttribute("orders", orders);
		request.setAttribute("ordertimes", ordertimes);
		request.getRequestDispatcher("/myOrders.jsp")
				.forward(request, response);
		return;
	}

	private void processOrder(HttpServletRequest request,
			HttpServletResponse response) throws IOException {
		ShoppingCar shoppingCar = (ShoppingCar) request.getSession()
				.getAttribute("shoppingCar");
		List<ShoppingItem> shoppingItems = shoppingCar.getShoppingItems();
		String oid = OrderIdUtils.getOid();
		String uid = request.getParameter("uid");
		String money = request.getParameter("money");
		String address = request.getParameter("address");
		String tel = request.getParameter("tel");

		int state = 1;

		SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");  
		Date sysdDate = null;  
		try {  
		sysdDate = sdf.parse(sdf.format(new Date()));  
		} catch (ParseException e) {  
		e.printStackTrace();  
		} 
		Order order = new Order();
		order.setOid(oid);
		order.setUid(Integer.parseInt(uid));
		order.setMoney(Double.parseDouble(money));
		order.setAddress(address);
		order.setTel(tel);
		order.setState(state);
		order.setOrdertime(sysdDate);

		OrderService orderService = new OrderServiceImpl();
		ShoppingItemService shoppingItemService = new ShoppingItemServiceImpl();

		boolean placeOrder = orderService.placeOrder(order);
		if (placeOrder) {
			String[] ids = request.getParameterValues("ids");
			if (ids == null || ids.length == 0) {
				response.sendRedirect("/shoppingcart.jsp");
			}
			for (int i = 0; i < ids.length; i++) {
				for (int j = 0; j < shoppingItems.size(); j++) {
					ShoppingItem shoppingItem = shoppingItems.get(j);
					if (shoppingItem.getPid().equals(ids[i])) {
						OrderItem orderItem = new OrderItem();
						orderItem.setBuynum(shoppingItem.getSnum());
						orderItem.setPid(shoppingItem.getPid());
						orderItem.setOid(oid);
						OrderItemService orderItemService = new OrderItemServiceImpl();
						boolean result1 = orderItemService
								.addOrderItem(orderItem);
						if (result1) {
							shoppingItems.remove(j);
							shoppingCar.setShoppingItems(shoppingItems);
							boolean result2 = shoppingItemService
									.deleteShoppingItem(shoppingItem
											.getItemid());
						} else {
							response.sendRedirect(request.getContextPath()
									+ "/shoppingcart.jsp");
						}
					}
				}
			}
			response.sendRedirect(request.getContextPath()
					+ "/shoppingcart.jsp");
		} else {
			response.sendRedirect("/shoppingcart.jsp");
		}

	}

	private void findAllOrder(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {

		OrderService orderService = new OrderServiceImpl();
		UserService userService = new UserServiceImpl();
		List users = userService.findAllUser();
		String num = request.getParameter("num");
		Page orders = orderService.findPageRecodes(num);
		request.setAttribute("page", orders);
		request.setAttribute("users", users);
		request.getRequestDispatcher("/admin/order/orderList.jsp").forward(
				request, response);

	}
	
	//@SuppressWarnings("unused")
	private void getOrderItem(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		
		String oid =request.getParameter("oid");
		OrderService orderService = new OrderServiceImpl();
		OrderItemService orderItemService = new OrderItemServiceImpl();
		UserService userService = new UserServiceImpl();
		List users = userService.findAllUser();
		List orderItem = orderItemService.findOrderItemByOid(oid);
		String num = request.getParameter("num");
		ProductService productServlet = new ProductServiceImpl();
		List product =  productServlet.findAllProduct();
		Page orders = orderService.findPageRecodes(num);
		request.setAttribute("page", orders);
		request.setAttribute("page", orders);
		request.setAttribute("product", product);
		request.setAttribute("orderItem", orderItem);
		request.getRequestDispatcher("/admin/order/orderItemList.jsp").forward(
				request, response);

	}
	
	//updateOrderSign
	private void updateOrderSign(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		String oid =request.getParameter("oid");
		OrderService orderService = new OrderServiceImpl();
		ProductService productService = new ProductServiceImpl();
		
		if(orderService.updateOrderState(oid, 2)){
			OrderItemService orderItemService = new OrderItemServiceImpl();
			List<OrderItem> orderItem = orderItemService.findOrderItemByOid(oid);
			for(int i =0;i<orderItem.size();i++){
				int number = orderItem.get(i).getBuynum();
				Product product = productService.findProductByPid(orderItem.get(i).getPid());
				int num = product.getPnum();
				product.setPnum(num - number);
				productService.updateProduct(product);
				
			}
			UserService userService = new UserServiceImpl();
			List users = userService.findAllUser();
			String num = request.getParameter("num");
			Page orders = orderService.findPageRecodes(num);
			request.setAttribute("page", orders);
			request.setAttribute("users", users);
			request.getRequestDispatcher("/admin/order/orderList.jsp").forward(
					request, response);
			
		}

		
		

	}

}
