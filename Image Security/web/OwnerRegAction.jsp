
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
    
    String query="insert into owner values(null,'"+name+"','"+email+"','"+mobile+"','"+address+"','"+uname+"','"+pwd+"')";
    int i=Queries.getExecuteUpdate(query);
    if(i>0){
      %>
      <script type='text/javascript'>
          window.alert("Registration Successful..!!");
          window.location="ImageOwner.jsp";
      </script>
      <%
    }else{
%>
      <script type='text/javascript'>
          window.alert("Registration Failed..!!");
          window.location="OwnerRegister.jsp";
      </script>
      <%
}
}catch(Exception e){
    out.println(e);
}



%>