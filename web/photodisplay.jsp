<%-- 
    Document   : photodisplay
    Created on : Apr 22, 2016, 11:48:22 AM
    Author     : Manjit Singh
--%>

<%@page contentType="text/html" pageEncoding="UTF-8" session="true"%>
 
<!DOCTYPE html>
<%@ page import="java.sql.*"%>
<%@ page import="services.*"%>
<%@ page import="servlet.*"%>
<%@ page import="java.io.*"
         import="connection.connect;"
         %>

<% Blob image = null;

Connection con = null;

byte[ ] imgData = null ;

Statement stmt = null;

ResultSet rs = null;

try {

String usr=(String)session.getAttribute("usrid");


 con =connect.javaconnect();

stmt = con.createStatement();

rs = stmt.executeQuery("select photo from usersinfo where username = '"+usr+"'");

if (rs.next()) {

image = rs.getBlob("photo");

imgData = image.getBytes(1,(int)image.length());

} else {

out.println("Display Blob Example");

out.println("image not found for given id>");

return;

}

// display the image

response.setContentType("image/gif");

OutputStream o = response.getOutputStream();

o.write(imgData);

o.flush();

o.close();

} catch (Exception e) {

out.println("Unable To Display image");

out.println("Image Display Error=" + e.getMessage());

return;

} finally {

}

%> 