<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
      <%@ page import="com.entity.UserEntity"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Caffeine Corner - Staff Login</title>
  <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;700&family=Roboto:wght@400;500&display=swap" rel="stylesheet">
  <link rel="stylesheet" href="index.css">
</head>
<body>
<%
    if (session.getAttribute("userObj") == null) {
        response.sendRedirect("../login.jsp");
        return;
    }
%>
  <div class="staff-container">
    <!-- Navigation Bar -->
    <nav class="staff-nav">
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
      <button class="logout-btn">
        <img src="../images/icon-152.svg" alt="Logout">
      </button>
    </nav>

    <!-- Header Section -->
    <header class="staff-header">
      <img src="../images/logo-4.png" class="logo" alt="Caffeine Corner Logo">
      <div class="header-text">
        <h1>CAFFEINE CORNER</h1>
        <p>WELCOME TO CAFFEINE CORNER</p>
      </div>
    </header>

    <!-- Main Content -->
    <main class="staff-main">
      <h2 class="staff-title">STAFFS</h2>
      
      <div class="tables-grid">
        <div class="table-card">
          <div class="table-highlight"></div>
          <h3>TABLE 1</h3>
        </div>
        <div class="table-card">
          <div class="table-highlight"></div>
          <h3>TABLE 2</h3>
        </div>
        <div class="table-card">
          <div class="table-highlight"></div>
          <h3>TABLE 3</h3>
        </div>
        <div class="table-card">
          <div class="table-highlight"></div>
          <h3>TABLE 4</h3>
        </div>
      </div>
    </main>

    <!-- Footer -->
    <footer class="staff-footer">
      <p>THANK YOU!!!</p>
    </footer>
  </div>
</body>
</html>