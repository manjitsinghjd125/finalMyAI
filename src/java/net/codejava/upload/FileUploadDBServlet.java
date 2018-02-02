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
 
@WebServlet("/uploadServlet")
@MultipartConfig(maxFileSize = 16177215)    // upload file's size up to 16MB
public class FileUploadDBServlet extends HttpServlet {
     
    // database connection settings
    private String dbURL = "jdbc:mysql://localhost:3306/ai";
    private String dbUser = "root";
    private String dbPass = "jack";
     
    protected void doPost(HttpServletRequest request,
            HttpServletResponse response) throws ServletException, IOException {
        // gets values of text fields
        String firstName = request.getParameter("fname");
        String lastName = request.getParameter("lname");
        String fullname = firstName.concat(" "+lastName);
        String dob = request.getParameter("dob");
        String gender = request.getParameter("gender");
        String username = request.getParameter("userid");
        String password = request.getParameter("password");
        String address = request.getParameter("address");
        String email = request.getParameter("email");
        String contact =request.getParameter("pno");
        InputStream inputStream = null; // input stream of the upload file
         
        // obtains the upload file part in this multipart request
        Part filePart = request.getPart("photo");
        if (filePart != null) {
            // prints out some information for debugging
            System.out.println(filePart.getName());
            System.out.println(filePart.getSize());
            System.out.println(filePart.getContentType());
             
            // obtains input stream of the upload file
            inputStream = filePart.getInputStream();
        }
         
        Connection conn = null; // connection to the database
        String message = null;  // message will be sent back to client
         
        try {
            HttpSession session=request.getSession();
            session.setAttribute("usersid", username);
            // connects to the database
            DriverManager.registerDriver(new com.mysql.jdbc.Driver());
            conn = DriverManager.getConnection(dbURL, dbUser, dbPass);
 
            // constructs SQL statement
            String sql = "INSERT INTO usersinfo (Fname, Lname, Fullname, dob, gender, username, password, address, email, contact, photo, time, date) values (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?,curtime(),curdate())";
            PreparedStatement statement = conn.prepareStatement(sql);
            statement.setString(1, firstName);
            statement.setString(2, lastName);
            statement.setString(3,fullname);
            statement.setString(4,dob);
            statement.setString(5,gender);
            statement.setString(6,username);
            statement.setString(7,password);
            statement.setString(8,address);
            statement.setString(9,email);
            statement.setString(10,contact);
                 
            if (inputStream != null) {
                // fetches input stream of the upload file for the blob column
                statement.setBlob(11, inputStream);
            }
 
            // sends the statement to the database server
            int row = statement.executeUpdate();
            String sql1="INSERT INTO users (username, password, time, date) values (?, ?,curtime(),curdate())";
            PreparedStatement pst=conn.prepareStatement(sql1);
            pst.setString(1,username);
            pst.setString(2,password);
            pst.executeUpdate();
            if (row > 0) {
                message = "You are successfully sign up";
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
            getServletContext().getRequestDispatcher("/Thanks.jsp").forward(request, response);
        }
    }
}