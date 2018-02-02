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
@WebServlet("/profileupdateServlet")
@MultipartConfig(maxFileSize = 16177215)
public class profileupdate  extends HttpServlet {
     // database connection settings
    private String dbURL = "jdbc:mysql://localhost:3306/ai";
    private String dbUser = "root";
    private String dbPass = "jack";
     
    protected void doPost(HttpServletRequest request,
            HttpServletResponse response) throws ServletException, IOException {
response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();        
// gets values of text fields
        
        String firstName = request.getParameter("fname");
        String lastName = request.getParameter("lname");
        String fullname = firstName.concat(" "+lastName);
        String gender = request.getParameter("gender");
        String username = request.getParameter("id");
        String address = request.getParameter("address");
        // input stream of the upload file
         Connection conn = null;
        // obtains the upload file part in this multipart request
        InputStream inputStream = null;
                Part filePart = request.getPart("photo");
                if (filePart != null) {
            // prints out some information for debugging
            System.out.println(filePart.getName());
            System.out.println(filePart.getSize());
            System.out.println(filePart.getContentType());
             
            // obtains input stream of the upload file
            inputStream = filePart.getInputStream();
            
            
        }
       
       
         // connection to the database
        String message = null;  // message will be sent back to client
         
        try {
            // connects to the database
            DriverManager.registerDriver(new com.mysql.jdbc.Driver());
            conn = DriverManager.getConnection(dbURL, dbUser, dbPass);
             String s=request.getParameter("imgreq");
            
            if(s==null||s.equals("")){
                // constructs SQL statement
                String sql = "update usersinfo set Fname=?, Lname=?, Fullname=?, address=?, gender=? where username=?";
                PreparedStatement statement = conn.prepareStatement(sql);
                statement.setString(1, firstName);
                statement.setString(2, lastName);
                statement.setString(3, fullname);
                statement.setString(4, address);
                
                statement.setString(5,gender);
                statement.setString(6,username);
                
                
                // sends the statement to the database server
                int row = statement.executeUpdate();
                if (row > 0) {
                    message = "You are successfully update";
                }
            } 
          else{
                //out.println("bye bye");
                
                String sql1 = "update usersinfo set Fname=?, Lname=?, Fullname=?, address=?, gender=?,  photo=? where username=?";
                PreparedStatement stmt = conn.prepareStatement(sql1);
                stmt.setString(1, firstName);
                stmt.setString(2, lastName);
                stmt.setString(3, fullname);
                stmt.setString(4, address);
                
                stmt.setString(5,gender);
                
                if (inputStream != null) {
                    // fetches input stream of the upload file for the blob column
                    
                    stmt.setBlob(6, inputStream);
                    
                    
                }
                stmt.setString(7, username);
                stmt.executeUpdate();
            }
        } catch (SQLException ex) {
            message = "ERROR: " + ex.getMessage();
            ex.printStackTrace();
        } finally {
            if (conn != null) {
                // closes the database connection
                try {
                    conn.close();
                } catch (SQLException ex) {
                    ex.printStackTrace();
                }
            }
            // sets the message in request scope
           request.setAttribute("Message", message);
             
            // forwards to the message page
            getServletContext().getRequestDispatcher("/Profile.jsp").forward(request, response);
        }
    }
    
}
