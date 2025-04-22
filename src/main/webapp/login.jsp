<%@page import="java.awt.print.Printable"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Caffeine Corner - Login</title>
  <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;700&family=Roboto:wght@400;500&display=swap" rel="stylesheet">
  <link rel="stylesheet" href="login.css">
</head>
<body>
  <div class="login-container">
    <header class="login-header">
      <img src="images/logo-4.png" class="logo" alt="Caffeine Corner Logo">
      
      <div class="welcome-text">
        <h1>CAFFEINE CORNER</h1>
        <p>WELCOME TO CAFFEINE CORNER</p>
      </div>
    </header>

    <main class="login-form-container">
    <%
    String err = (String) session.getAttribute("errorMsg");
    if (err != null) {
        out.print("<h2 style='color:red'>" + err + "</h2>");
        session.removeAttribute("errorMsg");
    }
%>
 <%
    String susc = (String) session.getAttribute("suscMsg");
    if (susc != null) {
        out.print("<h2 style='color:red'>" + susc + "</h2>");
        session.removeAttribute("suscMsg");
    }
%>

      <form class="login-form" action="userloginservlet" method="post">
        <div class="form-group">
          <label for="username">Email</label>
          <input type="text" id="username" name="email" placeholder="Enter your email">
        </div>
        
        <div class="form-group">
          <label for="pin">PIN</label>
          <input type="password" id="pin" name="password" placeholder="Enter your password">
        </div>
        
        <button type="submit" class="login-button">log in</button>
        
      </form>

    </main>
  </div>
</body>
</html>
