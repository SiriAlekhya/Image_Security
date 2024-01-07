
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
      <ul>
        <li><a href="OwnerHome.jsp">Home</a></li>
       
        <li><a href="UploadImage.jsp">Upload Image</a></li>
          <li class="active"><a href="ViewUploads.jsp">View Uploads</a></li>
            <li><a href="OViewRequest.jsp">View Request</a></li>
          <li class="last"><a href="ImageOwner.jsp">Logout</a></li>
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
          <h2 style="margin-bottom:200px;">View Image</h2>
           
          <table>
              <tr><th>Image Name</th><th>Passcode</th><th>Encrypted Image</th><th>Description</th></tr>
              <%try{
                  ResultSet r=Queries.getExecuteQuery("select * from images where owner_id='"+id+"'");
                  while(r.next()){
                      %>
              <tr>
                  <td><%=r.getString("img_name")%></td>
                   <td><%=r.getString("passcode")%></td>
                    <td><image src="images/enc.jpeg" width="150" height="150"/></td>
                    <td><textarea cols="30" rows="10"><%=r.getString("cipher_desc")%></textarea></td>
                
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