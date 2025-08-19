<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.net.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>SapSecOps Solutions - Home Page</title>
<link href="images/SSO.png" rel="icon">
<style>
  body {
    background-color: #f1c40f; /* Yellow */
    font-family: Arial, sans-serif;
    margin: 0;
    padding: 0;
    color: #222;
  }
  .header {
    background-color: #333;
    overflow: hidden;
    white-space: nowrap;
    padding: 15px 0;
  }
  .header-text {
    display: inline-block;
    color: white;
    font-size: 22px;
    font-weight: bold;
    padding-left: 100%;
    animation: scroll-left 50s linear infinite;
  }
  @keyframes scroll-left {
    0%   { transform: translateX(100%); }
    100% { transform: translateX(-100%); }
  }
  .info {
    margin: 30px;
    font-size: 18px;
  }
  .info span {
    font-weight: bold;
  }
  .center {
    text-align: center;
    margin-top: 20px;
  }
  .footer {
    text-align: center;
    background: #333;
    color: white;
    padding: 15px;
    margin-top: 40px;
  }
  .footer a {
    color: #ffdd00;
    text-decoration: none;
  }
</style>
</head>
<body>

  <!-- Scrolling Header -->
  <div class="header">
    <div class="header-text">✨ SapSecOps Solutions Java Project-V1 ✨</div>
  </div>

  <!-- Server Info -->
  <div class="info">
    <h3>Server Side IP Address</h3>
    <%
      InetAddress inetAddress = InetAddress.getLocalHost();
      String serverHost = inetAddress.getHostName();
      String serverIp = inetAddress.getHostAddress();
    %>
    <p><span>Hostname:</span> <%= serverHost %></p>
    <p><span>IP Address:</span> <%= serverIp %></p>
  </div>

  <!-- Client Info -->
  <div class="info">
    <h3>Client Side IP Address</h3>
    <p><span>Client IP:</span> <%= request.getRemoteAddr() %></p>
    <p><span>Client Host:</span> <%= request.getRemoteHost() %></p>
  </div>

  <!-- Logo + Contact -->
  <div class="center">
    <img src="images/SSO.png" width="120" alt="Logo"><br><br>
    <b>SapSecOps Solutions, Srikalahsti</b><br>
    <a href="mailto:sapsecopssolutions@gmail.com">Mail to SapSecOps Solutions</a>
  </div>

  <!-- Services -->
  <div class="info">
    Service : <a href="services/employee/getEmployeeDetails">Get Employee Details</a>
  </div>

  <!-- Footer -->
  <div class="footer">
    SapSecOps Solutions - Consultant, Training, Development Center. <br>
    <small>Copyright © <%= java.time.Year.now() %> by 
      <a href="http://SapSecOpssolutions.com/">SapSecOps Solutions, Srikalahsti</a>
    </small>
  </div>

</body>
</html>
