<%-- 
    Document   : newjsp
    Created on : Apr 22, 2016, 12:11:04 PM
    Author     : Manjit Singh
--%>

<%
    
    session.removeAttribute("usersid");
    
    session.invalidate();
    
   response.sendRedirect("Thanks.jsp");
    
    
    
    
    
    %>