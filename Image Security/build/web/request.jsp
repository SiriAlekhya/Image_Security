

<%@page import="java.sql.ResultSet"%>
<%@page import="com.database.Queries"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
try{
     String uid=(String)session.getAttribute("id");
     String email=(String)session.getAttribute("email");
     
String rid=request.getParameter("id");
String owner=request.getParameter("owner");
   
       
    String query="insert into request values(null,'"+uid+"','"+email+"','"+rid+"','"+owner+"','waiting')";
    int i=Queries.getExecuteUpdate(query);
    if(i>0){
      
     
%>
      <script type='text/javascript'>
          window.alert("Request Sent Successful...!!");
          window.location="ViewImage.jsp";
      </script>
      <%

    }else{
    
%>
      <script type='text/javascript'>
          window.alert("Request Failed..!!");
          window.location="ViewImage.jsp";
      </script>
      <%
}
}catch(Exception e){
    out.println(e);
}



%>