<%-- 
    Document   : Thanks
    Created on : Apr 23, 2016, 8:34:55 PM
    Author     : Manjit Singh
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!doctype html>
<html>
<head>
<meta charset="utf-8" content="5; url=index.jsp" http-equiv="refresh">
<title>Thanks</title>
<link href="css/social.css" rel="stylesheet" type="text/css">
</head>

<body>
<div class="thanks">
  <div class="thanks1">successfully</div>

  <div class="forgot1">
    <p><%=request.getAttribute("Message")%></p>
    <p>Go back and sign in <a href="index.jsp">click here</a></p>
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
