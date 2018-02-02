<%-- 
    Document   : Profile
    Created on : Apr 22, 2016, 1:57:49 AM
    Author     : Manjit Singh
--%>

<%@page contentType="text/html" pageEncoding="UTF-8" session="true"%>
 
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
<title>Profile</title>
<script src="js/validation.js"></script>
<script class="jsbin" src="js/imageload.js"></script>
<link href="css/social.css" rel="stylesheet" type="text/css">
</head>

<body>

<ul>
<li><a href="Home.jsp">Home</a></li>
<li><a href="Friends.jsp">Friends</a></li>
<li><a href="Messages.jsp">Messages</a></li>
<%--<li><a href="Email.jsp">Email</a></li>--%>
<li><a href="Map.jsp">Map</a></li>
<li><a href="Photos.jsp">Photos</a></li>
<li><a class="active" href="#">Profile</a></li>
<li><a href="About.jsp">About</a></li>
<li><a href="Contact.jsp">Contact us</a></li>

</ul>

  


<div class="frm">
<div class="title">Profile</div>
<form id="form1" name="form1" action="photodisplay.jsp" method="post">
    <div class="imge"> <input type="image" name="imageField" id="imageField" src="photodisplay.jsp" width="200" height="200">
    </div>
   <div class="frm1">
      <form id="form1" name="form1" method="post">
      <table width="332" height="521" cellpadding="5">
        <tr>
          <th width="120" style="text-align: right" scope="row">Username :</th>
          <td colspan="2" style="text-align: left"><%=objAIbean.getUserid()%></td>
        </tr>
        <tr>
          <th style="text-align: right" scope="row">Fullname :</th>
          <td colspan="2" style="text-align: left"><%=objAIbean.getFullname()%></td>
        </tr>
        <tr>
          <th style="text-align: right" scope="row">Contact no:</th>
          <td colspan="2" style="text-align: left"><%=objAIbean.getPno()%></td>
        </tr>
        <tr>
          <th style="text-align: right" scope="row">Gender :</th>
          <td colspan="2" style="text-align: left"><%=objAIbean.getGender()%></td>
        </tr>
        <tr>
          <th style="text-align: right" scope="row">Dob :</th>
          <td colspan="2" style="text-align: left"><%=objAIbean.getDob()%></td>
        </tr>
        <tr>
          <th style="text-align: right" scope="row">Address :</th>
          <td colspan="2" style="text-align: left"><textarea name="address" readonly id="textarea" style="max-height:58px;max-width:166px; min-height:58px;min-width:166px;"><%=objAIbean.getAddress()%></textarea></td>
        </tr>
        <tr>
          <th style="text-align: right" scope="row">Email :</th>
          <td colspan="2" style="text-align: left"><%=objAIbean.getEmail()%></td>
        </tr>
        <tr>
          <th style="text-align: right" scope="row">Password :</th>
          <td width="144" style="text-align: left"><%=objAIbean.getPassword()%></td>
          <td width="28" style="text-align: left"><a href="Passwordupdate.jsp">Edit</a></td>
        </tr>
        <tr style="text-align: center">
            
            <th colspan="3" scope="row"><a href="profileupdate.jsp"><input type="button" name="submit" id="submit" value="Edit Profile"></a></th>
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
