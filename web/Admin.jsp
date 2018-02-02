<%-- 
    Document   : Admin
    Created on : Apr 22, 2016, 10:27:37 PM
    Author     : Manjit Singh
--%>

<%@page contentType="text/html" pageEncoding="UTF-8" session="true"%>
<%@page 
    import="bean.*"
    %>
<!doctype html>
<html>
<head>
<meta charset="utf-8">
<title>Admin</title>
<script src="js/validation.js"></script>
<script class="jsbin" src="js/imageload.js"></script>
<link href="css/social.css" rel="stylesheet" type="text/css">
</head>

<body>
  <div class="adminsignin">
    <div class="admintitle">Admin Sign in</div>

  <div class="admin"></div>
  <div class="login1"><form action="AdAIcontroller.jsp" method="get"><table width="318" height="140" cellpadding="5">
    <tr>
      <th width="136" height="33" style="font-size: 16px; text-align: right;" scope="row">Username :</th>
      <td width="154" style="text-align: left">
        <input name="userid" type="text" autofocus required id="username"></td>
    </tr>
    <tr style="text-align: right">
      <th height="33" scope="row">Password :</th>
      <td style="text-align: left">
      <span style="text-align: left"></span>
      <input type="password" name="password" id="password"></td>
    </tr>
     <tr style="text-align: right; font-size: 12px;">
      <th height="28" colspan="2" scope="row"><span style="text-align: center"><%
        if(request.getParameter("msg")!=null)
                       {
            out.println("<p style=\"color:red\">"+request.getParameter("msg")+"</p>");
        }
    %></span></th>
    </tr>
    <tr style="text-align: right; font-size: 12px;">
        <th height="28" colspan="2" scope="row"><span style="text-align: right"></span><a href="AdForgotpass.jsp">Forgot Password?</a></th>
    </tr>
    <tr>
      <th height="34" colspan="2" scope="row"><input type="submit" name="adminsign" id="submit" value="Sign in"></th>
      </tr>
  </table>
  <div id="message"></div>
  </form></div>


  
</div>
<div id="bottom">
  MyAI&copy;Manjit singh
</div>


<div id="top">
MyAI
</div>

</body>
</html>
