
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!DOCTYPE html>
<html>
<head>
<title>Image Security</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<link rel="stylesheet" href="layout/styles/layout.css" type="text/css" />
</head>
<body id="top">
<div class="wrapper col1">
  <div id="header">
    <div id="logo" style="width:auto;">
         <h1><a href="#">Image Security</a></h1>
     
  </div>
    
    <br class="clear" />
  </div>
</div>
<div class="wrapper col2">
  <div id="topbar">
    <div id="topnav">
      <ul>
        <li class="active"><a href="UserHome.jsp">Home</a></li>
         <li><a href="ViewProfile.jsp">View Profile</a></li>
        <li><a href="ViewImage.jsp">View Images</a></li>
          <li><a href="RequestStatus.jsp">Request Status</a></li>
          
         <li class="last"><a href="ImageUser.jsp">Logout</a></li>
      </ul>
    </div>
   
    <br class="clear" />
  </div>
</div>


<div class="wrapper col5">
  <div id="container">
    <div id="content">
   <%
   String id=(String)session.getAttribute("id");
   String username=(String)session.getAttribute("username");
   String email=(String)session.getAttribute("email");
   
   
   %>
     <center>
          <h2 style="margin-bottom:200px;">Welcome To :<%=email%></h2>
           
        </center>

    </div>
    <div id="column">
     
    </div>
    <br class="clear" />
  </div>
</div>
<div class="wrapper col6">
  <div id="footer">
    
  
  </div>
</div>
<div class="wrapper col7">
  <div id="copyright">
    <p class="fl_left">Image Security</p>
     <br class="clear" />
  </div>
</div>
</body>
</html>