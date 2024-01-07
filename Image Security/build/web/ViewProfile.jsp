
<%@page import="java.sql.ResultSet"%>
<%@page import="com.database.Queries"%>
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
      <li><a href="UserHome.jsp">Home</a></li>
        <li class="active"><a href="ViewProfile.jsp">View Profile</a></li>
        <li><a href="ViewImage.jsp">View Images</a></li>
          <li><a href="RequestStatus.jsp">Request Status</a></li>
          
         <li class="last"><a href="ImageUser.jsp">Logout</a></li>
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
   <style>
       table{
           margin-top:20px;
       }
       table tr th{
           border: 1px solid black;
           background: #059BD8;
           height:50px;
       }
       table tr td{
           border: 1px solid black;
           background:#ADD6ED;
           height:30px;
       }
   </style>
     <center>
          <h2 style="margin-bottom:200px;">View Profile</h2>
           
          <table>
              <tr><th>Name</th><th>Email</th><th>Mobile</th><th>Address</th></tr>
              <%try{
                  ResultSet r=Queries.getExecuteQuery("select * from user where id='"+id+"'");
                  
                  while(r.next()){
                     
                      %>
              <tr>
               
                  <td><%=r.getString("name")%></td>
                 <td><%=r.getString("email")%></td>
                    <td><%=r.getString("mobile")%></td>
                     <td><%=r.getString("address")%></td>
                            </tr>
              
              <%
                  }
              }catch(Exception e){
                  System.out.println(e);
}%>
          </table>
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