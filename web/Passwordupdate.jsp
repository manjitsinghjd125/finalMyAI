<%-- 
    Document   : Passwordupdate
    Created on : Apr 22, 2016, 1:57:28 AM
    Author     : Manjit Singh
--%>

<%@page contentType="text/html" pageEncoding="UTF-8" session="true"%>
<!doctype html>
<html>
<head>
<meta charset="utf-8">
<title>Password update</title>
<script src="js/validation.js"></script>
<script class="jsbin" src="js/imageload.js"></script>
<link href="css/social.css" rel="stylesheet" type="text/css">
</head>

<body>

<ul>
<li><a href="Home.jsp">Home</a></li>
<li><a href="Friends.jsp">Friends</a></li>
<li><a href="Messages.jsp">Messages</a></li>
<li><a href="Email.jsp">Email</a></li>
<li><a href="Map.jsp">Map</a></li>
<li><a href="Photos.jsp">Photos</a></li>
<li><a class="active" href="#">Profile</a></li>
<li><a href="About.jsp">About</a></li>
<li><a href="Contact.jsp">Contact us</a></li>

</ul>

  


<div class="frm">
<div class="title">Change Password</div>
<div class="frm3"><form  action="AIcontroller.jsp" method="get" enctype="multipart/form-data">
      <table width="315" height="153" cellpadding="5">
        <tr>
          <th width="98" height="38" style="text-align: right; font-style: italic;" scope="row">Old Pass :</th>
          <td width="177" style="text-align: left"><input name="password" type="text" id="textfield"></td>
        </tr>
        <tr>
          <th height="32" style="text-align: right" scope="row">New pass :</th>
          <td style="text-align: left"><input name="forgotpass" type="text" id="textfield2"></td>
        </tr>
        <tr>
          <th height="37" style="text-align: right" scope="row">Conform pass:</th>
          <td style="text-align: left"><input name="cpass" type="text" id="textfield4"></td>
        </tr>
        <tr>
          <th height="34" colspan="2" scope="row"><input type="submit" name="passup" id="submit" value="Done"></th>
        </tr>
      </table>
  </form> </div>

    
 
 
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
