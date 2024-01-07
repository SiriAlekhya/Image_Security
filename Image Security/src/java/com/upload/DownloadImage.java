/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.upload;

import com.database.Dbconnection;
import java.io.IOException;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.sql.Blob;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author GKV
 */
public class DownloadImage extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
          
         Blob image = null;
    Connection con = null;
    byte[] imgData = null;
    Statement stmt = null;
    ResultSet rs = null;
    String id = request.getParameter("id");
    String filename=null;
    try {
        
        con = Dbconnection.getcon();
        stmt = con.createStatement();
        rs = stmt.executeQuery("select image,img_name from images where id = '" + id + "' ");
        if (rs.next()) {
            image = rs.getBlob("image");
            filename=rs.getString("img_name");
            imgData = image.getBytes(1, (int) image.length());
        } else {
            System.out.println("Display Blob Example");
            System.out.println("image not found for given image>");
            return;
        }
// display the image
        response.setContentType("image/gif");
        OutputStream o = response.getOutputStream();
        response.setHeader("Content-Disposition", "attachment;filename=\"" + filename + "\"");
        o.write(imgData);
        o.flush();
        o.close();
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
