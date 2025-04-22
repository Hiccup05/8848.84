package com.LoginServlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dao.LoginDao;
import com.db.DBConnection;
import com.entity.UserEntity;

/**
 * Servlet implementation class UserLoginServlet
 */
@WebServlet("/userloginservlet")
public class UserLoginServlet extends HttpServlet {
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String emailString=req.getParameter("email");
		String passwordString=req.getParameter("password");	
		LoginDao dao=new LoginDao(DBConnection.getConnection());
		UserEntity userEntity=dao.getUsers(emailString, passwordString);
		HttpSession session=req.getSession();
		if(userEntity!=null && "admin".equals(userEntity.getRoleString())) {
			session.setAttribute("userObj", userEntity);
	
			RequestDispatcher rd = req.getRequestDispatcher("Admin/index.jsp");
			rd.forward(req, resp);
		}
		else if(userEntity!=null && ("waiter".equals(userEntity.getRoleString()) || "cashier".equals(userEntity.getRoleString()))) {
			System.out.println(userEntity);
			session.setAttribute("userObj", userEntity);
			RequestDispatcher rd = req.getRequestDispatcher("/Staff/index.jsp");
			rd.forward(req, resp);
		}
		else {
			session.setAttribute("errorMsg", "Login Credentials Incorrect");
			resp.sendRedirect("login.jsp");
		}
	}
}
