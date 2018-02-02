<%-- 
    Document   : index
    Created on : Apr 22, 2016, 1:13:00 AM
    Author     : Manjit Singh
--%>

<%@page contentType="text/html" pageEncoding="UTF-8" session="true"%>
<% String value="temp";
    session.setAttribute("usersid", value); %>
<!doctype html>
<%@page 
    import="bean.*"
    %>
<html>
<head>
<meta charset="utf-8">
<title>Sign in</title>
<script src="js/validation.js"></script>
<script class="jsbin" src="js/imageload.js"></script>
<link href="css/social.css" rel="stylesheet" type="text/css">
</head>

<body>
<div class="login">
  <div class="signintitle">Sign in</div>
  <div class="login1"><form action="AIcontroller.jsp" method="get" ><table width="318" height="140" cellpadding="5">
    <tr>
      <th width="136" height="33" style="font-size: 16px; text-align: right;" scope="row">Username :</th>
      <td width="154" style="text-align: left">
          <input name="userid" type="text" autofocus required id="userid" ondrop="return false;" onpaste="return false;" onkeypress="return AvoidSpace(event);"></td>
    </tr>
    <tr style="text-align: right">
      <th height="33" scope="row">Password :<span style="text-align: right"></span></th>
      <td style="text-align: left">
      <span style="text-align: left"></span>
      <input type="password" name="password" ondrop="return false;" onpaste="return false;" onkeypress="return AvoidSpace(event);" autofocus required id="password"></td>
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
        <th height="28" colspan="2" scope="row"><a href="Forgotpass.jsp"><span style="text-align: right"></span>Forgot Password?</a></th>
    </tr>
    <tr>
      <th height="34" scope="row"><input type="submit" name="signin" id="submit" value="Sign in"></th>
      <td style="text-align: center">New user?
          <a href="signup.jsp" ><input type="button" name="signup" id="submit2" value="Signup"></a></td>
    </tr>
  </table></form></div>


  
</div>
<div id="bottom">
  MyAI&copy;Copyright Manjit singh 2016
</div>


<div id="top">
MyAI
</div>

</body>
</html>