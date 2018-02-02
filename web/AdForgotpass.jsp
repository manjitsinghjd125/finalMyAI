<%-- 
    Document   : Forgotpass
    Created on : Apr 22, 2016, 10:29:44 PM
    Author     : Manjit Singh
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!doctype html>
<html>
<head>
<meta charset="utf-8">
<title>Forgot password</title>
<script src="js/validation.js"></script>
<script class="jsbin" src="js/imageload.js"></script>
<link href="css/social.css" rel="stylesheet" type="text/css">
</head>

<body>
<div class="login"  id="login" name="login">
<div class="forgot">Forgot Pass</div>
  <div class="forgot1"><form action="AdEmailSendingServlet" method="post"><table width="318" height="75" cellpadding="5">
    <tr>
      <th width="136" height="33" style="font-size: 16px; text-align: right;" scope="row">Username :</th>
      <td width="154" style="text-align: left">
        <input name="userid" type="text" autofocus required id="username"></td>
    </tr>
    <tr>
        <th height="34" style="text-align: right" scope="row"><a href="index.jsp"><input type="button" name="submit" id="submit" value="Sign in"></a></th>
      <td style="text-align: center"><input type="submit" name="submit2" id="submit2" value="Reset pass"></td>
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
