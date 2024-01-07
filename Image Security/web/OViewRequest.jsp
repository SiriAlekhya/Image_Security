
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
          <li><a href="ViewUploads.jsp">View Uploads</a></li>
          <li class="active"><a href="OViewRequest.jsp">View Request</a></li>
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
              <tr><th>SrNo</th><th>Passcode</th><th>Action</th></tr>
              <%try{
                  ResultSet r=Queries.getExecuteQuery("select * from request where owner='"+id+"'");
                  int i=0;
                  while(r.next()){
                      i=i+1;
                       String img_id=r.getString("rid");
                        String email1=r.getString("email");
                      String passcode=r.getString("passcode");
                      ResultSet r1=Queries.getExecuteQuery("select * from images where id='"+img_id+"'");
             
                  while(r1.next()){ 
                      
                      String pass=r1.getString("passcode");
                      %>
              <tr>
                  <td><%=i%></td>
               
                 <td><%=r.getString("passcode")%></td>
                 <%if(passcode.equals("waiting")){%>
                     <td><a href="ShareKey.jsp?id=<%=r.getString("id")%>&passcode=<%=pass%>&email=<%=email1%>">generate Link and Share to Mail</a></td>       
                    <%}else{
%>
<td>Passcode Shared</td>
                    <%
}%>
              </tr>
              
              <%
                  }
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