<%@page import="com.db.DBConnection"%>
<%@page import="com.dao.UserDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<%-- <%@ page import="com.DB.DBConnect" %>
<%@ page import="com.dao.SpecialistDao" %>
<%@ page import="com.dao.DoctorDao" %>
<%@ page import="com.entity.Specialist" %>

 --%>
 <%@ page import="java.util.ArrayList" %>
<%@ page import="com.entity.UserEntity"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Caffeine Corner - Admin Panel</title>
  <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;700&family=Karla:wght@400;500;700&display=swap" rel="stylesheet">
  <link rel="stylesheet" href="css/index.css">
</head>
<body>
<%
    if (session.getAttribute("userObj") == null) {
        response.sendRedirect("../login.jsp");
        return;
    }
%>
<!-- Navigation Bar -->
<nav class="admin-nav">
  <div class="nav-links">
    <a href="#" class="nav-link">HOME</a>
    <a href="#" class="nav-link">MENU</a>
    <a href="#" class="nav-link">PAYMENT</a>
  </div>

  <div class="user-info">
    <span>Welcome, 
<%
    UserEntity user = (UserEntity) session.getAttribute("userObj");
    if (user != null) {
        out.print(user.getFullNameString());
    }
%>

    </span>
  </div>

  <a href="../userlogout" class="logout-btn">
    <img src="../images/icon-152.svg" alt="Logout">
  </a>
</nav>


    <!-- Header Section -->
    <header class="admin-header">
      <img src="../images/logo-4.png" class="logo" alt="Caffeine Corner Logo">
      <div class="header-text">
        <h1>CAFFEINE CORNER</h1>
        <p>WELCOME TO CAFFEINE CORNER</p>
      </div>
    </header>

    <!-- Admin Center Section -->
    <section class="admin-center">
      <h2>ADMIN CENTER</h2>
      
      <div class="admin-tabs">
        <button class="tab-btn">ADD PRODUCT</button>
        <button class="tab-btn active">ADD STAFF</button>
      </div>
      
      <div class="staff-actions">
        <button class="action-btn">ADD STAFFS</button>
        <button class="action-btn active">STAFF'S DETAILS</button>
      </div>
    </section>

    <!-- Staff Management Section -->
    <section class="staff-management">
      <!-- Staff Input Form -->
      <form method="post" action="../staffservlet" class="staff-form">
        <div class="form-group">
          <label>STAFF NAME</label>
          <input type="text" name="fullname" placeholder="Enter Staff Name">
        </div>
        <div class="form-group">
          <label>DOB</label>
          <input type="date" name="dob" placeholder="Enter Dob">
        </div>
        <div class="form-group">
          <label>PHONE NUMBER</label>
          <input type="text" name="contact" placeholder="Enter Phone Number">
        </div>
        <div class="form-group">
          <label>EMAIL</label>
          <input type="email" name="email" placeholder="Enter Email">
        </div>
        <div class="form-group">
          <label>ROLE</label>
          <input type="text" name="role" placeholder="Enter Role">
        </div>
        <div class="form-group">
          <label>PASSWORD</label>
          <input type="password" name="password" placeholder="Enter Password">
        </div>
        <button class="add-btn">ADD</button>
      </form>

      <!-- Staff Table -->
      <div class="staff-table-container">
        <table class="staff-table">
          <thead>
            <tr>
              <th>NAME</th>
              <th>GMAIL</th>
              <th>PASSWORD</th>
              <th>DOB</th>
              <th>CONTACT</th>
              <th>ROLE</th>
            </tr>
          </thead>
        <tbody>
						    <%
						        UserDao dao2 = new UserDao(DBConnection.getConnection());
						        ArrayList<UserEntity> staffs = dao2.getUsers();
						        
						        if (staffs != null && !staffs.isEmpty()) {
						            for (UserEntity staff : staffs) {
						    %>
						                <tr>
						                    <td><%= staff.getFullNameString() %></td>
						                    <td><%= staff.getEmailString() %></td>
						                    <td><%= staff.getPasswordString() %></td>
						                    <td><%= staff.getDobString() %></td>
						                    <td><%= staff.getContactString() %></td>
						                    <td><%= staff.getRoleString() %></td>
						                    <td>
						                        <a href="#" class="btn btn-sm btn-primary">Edit</a>
						                        <a href="#" class="btn btn-sm btn-danger">Delete</a>
						                    </td>
						                </tr>
						    <%
						            }
						        } else {
						    %>
						            <tr>
						                <td colspan="7">No users found</td>
						            </tr>
						    <%
						        }
						    %>
						</tbody>
        </table>
<!--         <button class="edit-btn">EDIT TABLE</button> -->
      </div>
    </section>

    <!-- Footer -->
    <footer class="admin-footer">
      <p>THANK YOU!!!</p>
    </footer>
  </div>
</body>
</html>