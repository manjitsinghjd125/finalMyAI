<%-- 
    Document   : Resetpass
    Created on : Apr 22, 2016, 10:31:32 PM
    Author     : Manjit Singh
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!doctype html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Reset</title>
<script src="js/validation.js"></script>
<script class="jsbin" src="js/imageload.js"></script>
<link href="css/social.css" rel="stylesheet" type="text/css">
</head>

<body>
<div class="login"  id="login" name="login">
<div class="forgot">Forgot Pass</div>
  <div class="forgot1">
    <p><%=request.getAttribute("Message")%></p>
    
  </div>


  
</div>
<div id="bottom">
  MyAI&copy;Manjit singh
</div>


<div id="top">
MyAI
</div>

</body>
</html>

