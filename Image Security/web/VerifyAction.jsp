

<%@page import="java.sql.ResultSet"%>
<%@page import="com.database.Queries"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
try{
     String uid=(String)session.getAttribute("id");
     
String rid=request.getParameter("rid");
String pcode=request.getParameter("pcode");
   
       
    String query="select * from request where id='"+rid+"'and passcode='"+pcode+"'";
    ResultSet i=Queries.getExecuteQuery(query);
    if(i.next()){
     String img_id=i.getString("rid");
     String img_pass=i.getString("passcode");
    String query1="select * from images where id='"+img_id+"'and passcode='"+img_pass+"'";
    ResultSet i1=Queries.getExecuteQuery(query1);
    if(i1.next()){%>
    <center>
        <h3><u>Decrypted Image</u></h3>
        
    <image src="view.jsp?id=<%=img_id%>" width="300" height="300"/>
    
    
    <h3><a href="DownloadImage?id=<%=img_id%>">Download</a></h3>
    </center>
    
    <%
      //response.sendRedirect("DownloadImage?id="+img_id);  
    }else{
      %>
      <script type='text/javascript'>
          window.alert("Passcode Mismatch..!!");
          window.location="RequestStatus.jsp";
      </script>
      <%  
    }
    
    }else{
    
%>
      <script type='text/javascript'>
          window.alert("Request Failed..!!");
          window.location="RequestStatus.jsp";
      </script>
      <%
}
}catch(Exception e){
    out.println(e);
}



%>