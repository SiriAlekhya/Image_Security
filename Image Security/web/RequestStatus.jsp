
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
        <li><a href="ViewProfile.jsp">View Profile</a></li>
        <li class="active"><a href="ViewImage.jsp">View Images</a></li>
        
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
     <center>
          <h2 style="margin-bottom:200px;">View Image</h2>
           
          <table>
              <tr><th>SrNo</th><th>Passcode</th><th>Action</th></tr>
              <%try{
                  ResultSet r=Queries.getExecuteQuery("select * from request where uid='"+id+"'");
                  int i=0;
                  while(r.next()){
                      i=i+1;
                      String pass=r.getString("passcode");
                      %>
              <tr>
                  <td><%=i%></td>
               
                 <td><%=r.getString("passcode")%></td>
                 <%if(pass.equals("waiting")){%>
                 <td style="color:red">Your Request Passcode it Waiting At Image owner<br>owner will generate mail link for verification and download image
                        </td>
                    <%}else{
%>
<td><font color="red">Passcode Verification Link Sent Mail Please OPen Registred Mail And Verify Passcode</font></td>
<%
}%>
              </tr>
              
              <%
                  }
              }catch(Exception e){
                  System.out.println(e);
}%>
          </table>
          <hr>
          
           <center>
               <%String rid=request.getParameter("rid");
               if(rid!=null){%>
          <h2>Verify Passcode</h2>
            <form action='VerifyAction.jsp' method='post'>
                <table style="margin-bottom: 200px;">
                 <tr><th>id</th><td><input type='text' name='rid' value="<%=rid%>" readonly></td><tr/>
                
                    <tr><th>passcode</th><td><input type='text' name='pcode' required='' ></td><tr/>
           
                    <tr><th></th><td><input type='submit' value='Verify'>
                         </td>
                  <tr/>    </table>
            </form>   
            <%}%>
        </center>
          
          
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