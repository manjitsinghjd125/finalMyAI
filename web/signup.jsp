<%-- 
    Document   : signup
    Created on : Apr 22, 2016, 1:18:59 AM
    Author     : Manjit Singh
--%>
<%@page contentType="text/html" pageEncoding="UTF-8" session="true"%>
<% if(session.getAttribute("usersid")==null){
response.sendRedirect("index.jsp");
}%>
<!doctype html>
<html>
<head>
<meta charset="utf-8">
<script src="js/validation.js"></script>
<title>Sign up</title>

<script class="jsbin" src="js/imageload.js"></script>
<link href="css/social.css" rel="stylesheet" type="text/css">
</head>

<body>
<div class="signup"><form onsubmit="return dataEntry();" method="post" action="uploadServlet" enctype="multipart/form-data">
  <div class="signuptitle">Sign up</div>

  <div class="imge"> <input type="image" name="imageField" id="imageField" onClick="image();" src="#" width="200" height="200">
    <input name="photo" type="file" autofocus required id="fileField" style="display:none;" onChange="readURL(this);" accept="image/jpg"></div>
     <div class="data">
    <table width="536" height="516" cellpadding="5">
      <tr>
        <th width="176" style="text-align: right" scope="row">First name :</th>
        <td width="170"><input name="fname" type="text"  onpaste="return false;" maxlength="20" autofocus required id="Fname" ></td>
      <td width="150" style="text-align: left">&nbsp;</td>
      </tr>
      
      <tr>
        <th style="text-align: right" scope="row">Last name:</th>
        <td><input name="lname" type="text" onpaste="return false;" maxlength="10" autofocus required id="textfield3"></td>
      <td style="text-align: left">&nbsp;</td>
      </tr>
      <tr>
        <th style="text-align: right" scope="row">Date of Birth :</th>
        <td><input name="dob" type="date" id="date" style="width: 170px; height: 21px;" autofocus required  max="1996-01-01" ></td>
      <td style="text-align: left">&nbsp;</td>
      </tr>
      <tr>
        <th style="text-align: right" scope="row">Gender :</th>
        <td><input name="gender" type="radio" required id="radio" value="Male">
        <label for="radio">Male
        <input name="gender" type="radio" required id="radio2" value="Female">
        Female</label></td>
      <td style="text-align: left">&nbsp;</td>
      </tr>
      <tr>
        <th style="text-align: right" scope="row">Address :</th>
        <td> <textarea name="address" style="margin: 0px; max-height:58px;max-width:166px; min-height:58px;min-width:166px;"  autofocus required id="textarea"></textarea></td>
      <td style="text-align: left">&nbsp;</td>
      </tr>
      <tr>
        <th style="text-align: right" scope="row">Username :</th>
        <td><input name="userid" type="text" value="" maxlength="15"autofocus required id="user" ondrop="return false;" onpaste="return false;" onkeypress="return AvoidSpace(event);" autocomplete="off"></td>
      <td style="text-align: left">&nbsp;</td>
      </tr>
      <tr>
        <th style="text-align: right" scope="row">Email :</th>
        <td><input name="email" type="email" onpaste="return false;" ondrop="return false;" onkeypress="return AvoidSpace(event);" autofocus required id="email"></td>
      <td style="text-align: left">&nbsp;</td>
      </tr>
      <tr>
        <th style="text-align: right" scope="row">Conform Email :</th>
        <td><input name="email2" type="email" onpaste="return false;" ondrop="return false;" onkeypress="return AvoidSpace(event);" autofocus required id="email2"></td>
      <td style="text-align: left"><span id="span2"></span></td>
      </tr>
      <tr>
        <th style="text-align: right" scope="row">Password :</th>
        <td><input name="password" type="password" ondrop="return false;" onpaste="return false;" ondrop="return false;" onkeypress="return AvoidSpace(event);" id="pass" value="" autofocus required ></td>
      <td style="text-align: left"><span id="span4"></span></td>
      </tr>
      <tr>
        <th style="text-align: right" scope="row">Conform Password :</th>
        <td><input name="cpass" type="password" onpaste="return false;" ondrop="return false;" onkeypress="return AvoidSpace(event);" id="repass" autofocus required ></td>
      <td style="text-align: left"><span id="span1"></span></td>
      </tr>
      <tr>
        <th style="text-align: right" scope="row">Contact Number :</th>
        <td><input name="pno" type="number" id="tel" onpaste="return false;" maxlength="10" autocomplete="off" onkeypress="return isNumberKey(event)" autofocus required ></td>
      <td style="text-align: left">&nbsp;</td>
      </tr>
      <tr>
        <th style="text-align: right" scope="row">Terms&amp;conditions :</th>
        <td><input name="term" type="radio" required id="radio3" value="agree">
        <label for="radio3">Agree
        <input name="term" type="radio" required id="radio4" value="disagree">
        Disagree</label></td>
      <td style="text-align: left"><span id="span3"></span></td>
      </tr>
      <tr>
          <th style="text-align: center" scope="row"><a href="index.jsp"><input type="button" name="button" id="submit" value="Sign in"></a></th>
        <td style="text-align: center"><input type="submit" name="123" id="submit" value="Sign up"></td>
      <td style="text-align: left">&nbsp;</td>
      </tr>
    </table>
  </div>
    </form>
</div>
<div id="bottom">
  MyAI&copy;Manjit singh
</div>


<div id="top">
MyAI
</div>

</body>
</html>
