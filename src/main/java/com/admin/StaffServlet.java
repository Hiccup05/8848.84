package com.admin;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dao.UserDao;
import com.db.DBConnection;
import com.entity.UserEntity;

@WebServlet("/staffservlet")

public class StaffServlet extends HttpServlet{
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String fullName=req.getParameter("fullname");
		String email=req.getParameter("email");
		String password=req.getParameter("password");
		String dob=req.getParameter("dob");
		long contact = Long.parseLong(req.getParameter("contact"));
		String role=req.getParameter("role");
		HttpSession session=req.getSession();
		
		UserEntity userEntity=new UserEntity(fullName,email,password,dob,contact,role);
		UserDao userDao=new UserDao(DBConnection.getConnection());
		ArrayList<UserEntity> staffArrayList=userDao.getUsers();
		
		if(userDao.registerUser(userEntity)) {
			session.setAttribute("suscMsg", "UserRegister Sucessfully");
			resp.sendRedirect("Admin/index.jsp");
		}
		else {
			session.setAttribute("errorMsg", "User Registration fail");
			resp.sendRedirect("Admin/index.jsp");
		}
	}
}
