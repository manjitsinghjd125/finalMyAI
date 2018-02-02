<%-- 
    Document   : Map
    Created on : Apr 22, 2016, 1:54:28 AM
    Author     : Manjit Singh
--%>

<%@page contentType="text/html" pageEncoding="UTF-8" session="true"%>
 
<!doctype html>
<html>
<head>
<meta charset="utf-8">
<title>Map</title>
<script type="text/javascript" src="http://maps.googleapis.com/maps/api/js?sensor=false"></script>
<script src="js/location.js"></script>
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
<li><a class="active" href="#">Map</a></li>
<li><a href="Photos.jsp">Photos</a></li>
<li><a href="Profile.jsp">Profile</a></li>
<li><a href="About.jsp">About</a></li>
<li><a href="Contact.jsp">Contact us</a></li>
</ul>

  


<div class="frm">
<div class="title">Map</div>

<div id="dvMap" style="left: 31px;top: 83px;width: 813px;height: 547px;position: relative;overflow: hidden;transform: translateZ(0px);background-color: rgb(229, 227, 223);">
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
