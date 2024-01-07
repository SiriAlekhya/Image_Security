

<%@page import="com.mail.Mail"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="com.database.Queries"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
try{
      
String rid=request.getParameter("id");
String passcode=request.getParameter("passcode");
String email=request.getParameter("email");
   
String url="http://localhost:8084/Image_Security/RequestStatus.jsp?rid="+rid;

Mail.secretMail(url, email, email);
    String query="update request set passcode='"+passcode+"' where id='"+rid+"'";
    int i=Queries.getExecuteUpdate(query);
    if(i>0){
      
     
%>
      <script type='text/javascript'>
          window.alert("Passcode Sent Successful...!!");
          window.location="OViewRequest.jsp";
      </script>
      <%

    }else{
    
%>
      <script type='text/javascript'>
          window.alert("Sending Failed..!!");
          window.location="OViewRequest.jsp";
      </script>
      <%
}
}catch(Exception e){
    out.println(e);
}



%>