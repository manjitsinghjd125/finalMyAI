/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package net.codejava.upload;

/**
 *
 * @author Manjit Singh
 */
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
 
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;
@WebServlet("/test")
@MultipartConfig(maxFileSize = 16177215)
public class test  extends HttpServlet{
     
    protected void doPost(HttpServletRequest request,HttpServletResponse response) throws ServletException, IOException {
       response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        try { String s=request.getParameter("imgreq");
              if(s==null||s.equals("")){
                  out.println("bye");
              }
              else{
                  out.println("hello");
              }
        
           
        } catch (Exception ex) {
            ex.printStackTrace();
        } finally {
            }
    }  
    protected void doGet(HttpServletRequest request,HttpServletResponse response) throws ServletException, IOException {
       response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        try { String s=request.getParameter("imgreq");
              if(s==null||s.equals("")){
                  out.println("bye");
              }
              else{
                  out.println("hello");
              }
        
           
        } catch (Exception ex) {
            ex.printStackTrace();
        } finally {
            }
    } 
}
