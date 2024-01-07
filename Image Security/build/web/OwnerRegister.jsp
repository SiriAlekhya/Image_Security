

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title> Encrypted</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<link rel="stylesheet" href="layout/styles/layout.css" type="text/css" />
</head>
<body id="top">
<div class="wrapper col1">
  <div id="header">
    <div id="logo" style="width:auto;">
      <h1><a href="#">Image Security</a></h1>
      <p><strong></strong></p>
    </div>
    
    <br class="clear" />
  </div>
</div>
<div class="wrapper col2">
  <div id="topbar">
    <div id="topnav">
      <ul>
        <li><a href="index.html">Home</a></li>
        <li class="active"><a href="ImageOwner.jsp">Image Owner</a></li>
        <li><a href="ImageUser.jsp">Image User</a></li>
     
        
        
      </ul>
    </div>
   
    <br class="clear" />
  </div>
</div>
<div class="wrapper col3">
  <div id="intro">
      <div class="fl_left" style="height:300px;">
   
       <center>
          <h2>Registration</h2>
            <form action='OwnerRegAction.jsp' method='post'>
                <table style="margin-bottom:200px;">
                    <tr><th>Name</th><td><input type='text' name='name' required='' placeholder="Name"></td><tr/>
                   
                    <tr><th>Email</th><td><input type='email' name='email' required='' placeholder="Email"></td><tr/>
                     <tr><th>Mobile</th><td><input type='number' name='mobile' required='' placeholder="Mobile"></td><tr/>
                
                    <tr><th>Address</th><td><input type='text' name='address' required='' placeholder="Address"></td><tr/>
                   
                    <tr><th>UserName</th><td><input type='text' name='uname' required='' placeholder="UserName"></td><tr/>
                
                    <tr><th>Password</th><td><input type='password' name='pwd' required='' placeholder="Password"></td><tr/>
           
                    <tr><th><input type='submit' value='Register'></th>
                    <td><a href='ImageOwner.jsp'>Login</a></td><tr/>
                </table>
            </form>   
            
        </center>
    
    </div>
  
    <br class="clear" />
  </div>
</div>

<div class="wrapper col5">
  <div id="container">
    <div id="content">
      
    </div>
    <div id="column">
     
    </div>
    <br class="clear" />
  </div>
</div>
<div class="wrapper col6">
  <div id="footer">
    
    
    
    <br class="clear" />
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
