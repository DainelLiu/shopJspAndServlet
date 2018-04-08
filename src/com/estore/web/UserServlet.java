package com.estore.web;

import java.io.IOException;
import java.io.PrintWriter;
import java.lang.reflect.InvocationTargetException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Map;					

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.beanutils.BeanUtils;
import org.apache.commons.beanutils.ConvertUtils;
import org.apache.commons.beanutils.locale.converters.DateLocaleConverter;

import com.estore.domain.User;
import com.estore.service.UserService;
import com.estore.service.impl.UserServiceImpl;
import com.estore.utils.FillDataBean;
import com.estore.web.bean.UserFormBean;

public class UserServlet extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		doPost(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		String op = request.getParameter("op");
		String uid = request.getParameter("uid");
		
		if ("regist".equals(op)) {
			regist(request, response);
		}else if("login".equals(op)){
			login(request,response);
		}else if("lgout".equals(op)){
			lgout(request,response);
		}else if(uid != null) {
			updatePersonalData(uid,request, response);
		}
	}

	private void updatePersonalData(String uid, HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		UserFormBean userFormBean = FillDataBean.fillData(UserFormBean.class, request);
		User user = new User();
		try {
			ConvertUtils.register(new DateLocaleConverter(), Date.class);
			BeanUtils.copyProperties(user, userFormBean);
			user.setUpdatetime(new Date());
			user.setUid(Integer.parseInt(uid));
			
			UserService userService = new UserServiceImpl();
			System.out.println(user.getBirthday());
			boolean update = userService.updateUserMsg(user);
			if (update) {
				response.getWriter().write("修改成功,1秒后跳到主页");
				request.setAttribute("user", user);
				SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
				String birthday = sdf.format(user.getBirthday());
				request.getSession().setAttribute("birthday", birthday);
				response.setHeader("Refresh", "1;URL="+request.getContextPath()+"/index1.jsp");
				return;
			} else {
//				response.getWriter().write("嗯，个人资料修改失败了，请重新修改吧,1秒后回到个人资料页");
//				response.setHeader("Refresh", "1;URL="+request.getContextPath()+"/user/personal.jsp");
				request.setAttribute("user", user);
				request.getRequestDispatcher("/user/personal.jsp").forward(request, response);
			}
		} catch (IllegalAccessException e) {
			e.printStackTrace();
		} catch (InvocationTargetException e) {
			e.printStackTrace();
		}
	}

	private void lgout(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
		
		request.getSession().removeAttribute("user");
		response.sendRedirect(request.getContextPath()+"/index.jsp");
	}

	private void login(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{

		String username = request.getParameter("username");
		String password = request.getParameter("password");
		
		if(username == null || password == null){
			request.setAttribute("msg", "用户名或密码不能为空");
			request.getRequestDispatcher("/user/login.jsp").forward(request, response);
			return ;
		}
		
		UserService userService = new UserServiceImpl();
		User user = userService.login(username, password);
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		String birthday = sdf.format(user.getBirthday());
		SimpleDateFormat sdf1 = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String updateTime = sdf1.format(user.getUpdatetime());
		if(user != null){
			request.getSession().setAttribute("user", user);
			request.getSession().setAttribute("birthday", birthday);
			request.getSession().setAttribute("updateTime", updateTime);
			response.sendRedirect(request.getContextPath()+"/index1.jsp");
			return ;
		}else{
			request.setAttribute("username", username);
			request.setAttribute("password", password);
			request.getRequestDispatcher("/user/login.jsp").forward(request, response);
			return ;
		}
		
	}

	private void regist(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		UserFormBean userFormBean = FillDataBean.fillData(UserFormBean.class, request);
		boolean validate = userFormBean.validate();
		if(!validate){
			request.setAttribute("msg", userFormBean);
			request.getRequestDispatcher("/user/regist.jsp").forward(request, response);
			return ;
		}
		
		User user = new User();
		try {
			ConvertUtils.register(new DateLocaleConverter(), Date.class);
			BeanUtils.copyProperties(user, userFormBean);
			UserService userService = new UserServiceImpl();
			user.setUpdatetime(new Date());
			
			boolean regist = userService.regist(user);
			if(regist){
				response.getWriter().write("注册成功,1秒后跳到登录页");
				response.setHeader("Refresh", "1;URL="+request.getContextPath()+"/user/login.jsp");
				return;
			}else{
				response.getWriter().write("呃，注册失败了，重新注册吧,1秒后回到注册页");
				response.setHeader("Refresh", "1;URL="+request.getContextPath()+"/user/login.jsp");
			}
		} catch (IllegalAccessException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (InvocationTargetException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
	}

}
