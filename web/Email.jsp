<%-- 
    Document   : Email
    Created on : Apr 22, 2016, 1:59:15 AM
    Author     : Manjit Singh
--%>

<%@page contentType="text/html" pageEncoding="UTF-8" session="true"%>
<%@page import="servlet.*" %>
<%@page 
    import="bean.*"
    import="services.*"
    import="java.util.*"
    %>
<% 
   String val=(String)session.getAttribute("usrid");
   AIservices service=new AIservices();
   AIbean objAIbean=service.showdata(val);
%>
<!doctype html>
<html>
<head>
<meta charset="utf-8">
<title>Email</title>
<script src="js/validation.js"></script>
<script class="jsbin" src="js/imageload.js"></script>
<link href="css/social.css" rel="stylesheet" type="text/css">
</head>

<body>

<ul>
<li><a  href="Home.jsp">Home</a></li>
<li><a href="Friends.jsp">Friends</a></li>
<li><a href="Messages.jsp">Messages</a></li>
<li><a class="active" href="#">Email</a></li>
<li><a href="Map.jsp">Map</a></li>
<li><a href="Photos.jsp">Photos</a></li>
<li><a href="Profile.jsp">Profile</a></li>
<li><a href="About.jsp">About</a></li>
<li><a href="Contact.jsp">Contact us</a></li>
</ul>

  


<div class="frm">
<div class="title">Email</div>
<div class="emaildate">
    <form  action="EmailSendingServlet" method="post" enctype="multipart/form-data" name="form1" id="form1">
    <table width="397" height="357" cellpadding="5">
      <tr>
        <th style="text-align: right" scope="row">From :</th>
        <td style="text-align: left"><input type="email" name="email" id="email" value="<%=objAIbean.getEmail()%>"></td>
      </tr>
      <tr>
        <th style="text-align: right" scope="row">To :</th>
        <td style="text-align: left"><input type="email" name="To" id="email2"></td>
      </tr>
      <tr>
        <th style="text-align: right" scope="row">Subject :</th>
        <td style="text-align: left"><input type="text" name="subject" id="textfield"></td>
      </tr>
      <tr>
        <th height="91" style="text-align: right" scope="row">Body :</th>
        <td style="text-align: left"><textarea name="body" id="textarea" style="margin: 0px; max-height: 254px;min-height:254px;max-width:290px; min-width: 290px;"></textarea></td>
      </tr>
      <tr>
        <th height="33" colspan="2" scope="row">&nbsp;</th>
        </tr>
      <tr>
        <th colspan="2" scope="row"><label for="fileField">File:</label>
          <input type="file" name="fileField" id="fileField"></th>
        </tr>
      <tr>
        <th colspan="2" scope="row"><input type="submit" name="submit" id="submit" value="Send"></th>
        </tr>
    </table>
  </form>
</div>
</div>
<div id="bottom">
MyAI&copy;Manjit singh
</div>


<div id="top">
MyAI
<div class="signout"><input type="button" name="button" id="button" value="Sign out"></div>
</div>

</body>
</html>
