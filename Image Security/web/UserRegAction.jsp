<%-- 
    Document   : OwnerRegAction
    Created on : 29 Sep, 2020, 5:52:17 PM
    Author     : KishanVenky
--%>

<%@page import="com.database.Queries"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
try{
    String name=request.getParameter("name");
    String email=request.getParameter("email");
    String mobile=request.getParameter("mobile");
    String address=request.getParameter("address");
    String uname=request.getParameter("uname");
    String pwd=request.getParameter("pwd");
    
    String query="insert into user values(null,'"+name+"','"+email+"','"+mobile+"','"+address+"','"+uname+"','"+pwd+"')";
    int i=Queries.getExecuteUpdate(query);
    if(i>0){
      %>
      <script type='text/javascript'>
          window.alert("Registration Successful..!!");
          window.location="ImageUser.jsp";
      </script>
      <%
    }else{
%>
      <script type='text/javascript'>
          window.alert("Registration Failed..!!");
          window.location="UserRegister.jsp";
      </script>
      <%
}
}catch(Exception e){
    out.println(e);
}



%>