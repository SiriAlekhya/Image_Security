/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.upload;

import com.database.Dbconnection;
import com.sun.org.apache.xerces.internal.impl.dv.util.Base64;
import java.io.BufferedReader;
import java.io.ByteArrayInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.util.stream.Collectors;
import javax.crypto.SecretKey;
import javax.crypto.spec.SecretKeySpec;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

/**
 *
 * @author GKV
 */
@MultipartConfig(maxFileSize=16*1024*1024)
public class UploadImage extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try{
            HttpSession session=request.getSession();
   String id=(String)session.getAttribute("id");
   
           String passcode=request.getParameter("passcode");
           String name=request.getParameter("name");
           String description=request.getParameter("description");
           Part p=request.getPart("image");
           
           InputStream in=p.getInputStream();
            InputStream in1=p.getInputStream();
            String imgdata = new BufferedReader(new InputStreamReader(in1)).lines().collect(Collectors.joining("\n"));
       
            byte[] bs=Base64.decode(passcode);
         SecretKey sec=new SecretKeySpec(bs, "AES");
      
         
         
         String cipher_name=Encryption.encrypt(name, sec);
         String cipher_desc=Encryption.encrypt(description, sec);
         String cipher_imgdata=Encryption.encrypt(imgdata, sec);
         
        byte[] a=cipher_imgdata.getBytes();
        InputStream targetStream = new ByteArrayInputStream(cipher_imgdata.getBytes());
        
           Connection con=Dbconnection.getcon();
           PreparedStatement pst=con.prepareStatement("insert into images values(null,?,?,?,?,?,?,?,?)");
           pst.setString(1,id);
           pst.setString(2,name); 
             pst.setString(3,passcode); 
           pst.setString(4,cipher_name);
           pst.setString(5,description);
            pst.setString(6,cipher_desc);
            pst.setBlob(7,in);
            pst.setBlob(8,targetStream);
            
              int ii=pst.executeUpdate();
          if(ii>0)
          {
         response.sendRedirect("UploadImage.jsp?msg=successful...!!");
          }else{
              response.sendRedirect("UploadImage.jsp?msg=Failed...!!");
         }
              
        }catch(Exception e){
            System.out.println(e);
        }
        
        
        
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
