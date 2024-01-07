
<%@page import="com.sun.org.apache.xerces.internal.impl.dv.util.Base64"%>
<%@page import="javax.crypto.SecretKey"%>
<%@page import="javax.crypto.KeyGenerator"%>
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
       
        <li class="active"><a href="UploadImage.jsp">Upload Image</a></li>
          <li><a href="ViewUploads.jsp">View Uploads</a></li>
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
   
   
KeyGenerator keygen=KeyGenerator.getInstance("AES");
           keygen.init(128);
           SecretKey s=keygen.generateKey();
           //converting secret keyto string
           byte[] b=s.getEncoded();//encoding secret key
           String skey=Base64.encode(b);
   %>
     <center>
          <h2 style="margin-bottom:200px;">Upload Image</h2>
           
          <form action="UploadImage" method="post" enctype="multipart/form-data">
              <table>   
               
                  <tr><th>Passcode</tH><td><input type="text" name="passcode"  value="<%=skey%>" required=""></tD></tr>
                  <tr><th>Image Name</tH><td><input type="text" name="name" placeholder="Sample.png" required=""></tD></tr>
                  <tr><th>Image Description</tH><td><textarea cols="20" rows="3" name="description" placeholder="about image" required=""></textarea></tD></tr>
                      <tr><th>Choose Image</tH><td><input type="file" name="image" required=""></tD></tr> 
                   <tr><th></tH><td><input type="submit" name="upload" required=""></tD></tr>
              </table>   
          </form> 
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