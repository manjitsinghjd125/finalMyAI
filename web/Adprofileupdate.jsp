<%-- 
    Document   : profileupdate
    Created on : Apr 22, 2016, 1:58:03 AM
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
   AdAIservices service=new AdAIservices();
   AIbean objAIbean=service.showdata(val);
%>
<!doctype html>
<html>
<head>
<meta charset="utf-8">
<title>Profile update</title>
<script>
    function radiobutton(){
    var gender ="<%=objAIbean.getGender()%>";
    if(gender=="Male"){
        document.getElementById('radio').checked=true;
    }
    else{
             document.getElementById('radio2').checked=true;
    }
}
</script>
<script src="js/validation.js"></script>
<script class="jsbin" src="js/imageload.js"></script>
<link href="css/social.css" rel="stylesheet" type="text/css">
</head>

<body onload="radiobutton();">

<ul>
<li><a href="AdHome.jsp">Home</a></li>
<li><a href="AdFriends.jsp">Friends</a></li>
<li><a href="AdMessages.jsp">Messages</a></li>
<li><a href="AdEmail.jsp">Email</a></li>
<li><a href="AdMap.jsp">Map</a></li>
<li><a href="AdWeather.jsp">weather</a></li>
<li><a class="active" href="#">Profile</a></li>
<li><a href="AdAbout.jsp">About</a></li>
<li><a href="AdContact.jsp">Contact us</a></li>

</ul>

  

<form id="form1" name="form1" action="AdprofileupdateServlet?id=<%=objAIbean.getUserid()%>" method="post" enctype="multipart/form-data">
<div class="frm">
<div class="title">Profile</div>
<div class="imge"> <input type="image" name="imageField" id="imageField" onClick="return image();" src="Adphotodisplay.jsp" width="200" height="200">
    <input type="file" name="photo" id="fileField" accept="image/jpg" style="display:none;" onChange="readURL(this);">
    <input type="hidden" id="req"  name="imgreq" value="">
</div>
    <div class="frm1">
       
      <table width="315" height="521" cellpadding="5">
        <tr>
          <th style="text-align: right" scope="row">Username :</th>
          <td style="text-align: left"><%=objAIbean.getUserid()%></td>
        </tr>
        <tr>
          <th style="text-align: right" scope="row">First Name :</th>
          <td style="text-align: left">
              <input type="text" name="fname" ondrop="return false;" onpaste="return false;" onkeypress="return AvoidSpace(event);" autofocus required value="<%=objAIbean.getFname()%>" id="textfield3"></td>
        </tr>
        <tr>
          <th style="text-align: right" scope="row">Last Name :</th>
          <td style="text-align: left"><input name="lname" type="text" value="<%=objAIbean.getLname()%>" ondrop="return false;" onpaste="return false;" onkeypress="return AvoidSpace(event);" autofocus required id="textfield2"></td>
        </tr>
        <tr>
          <th style="text-align: right" scope="row">Contact no:</th>
          <td style="text-align: left"><%=objAIbean.getPno()%></td>
        </tr>
        <tr>
          <th style="text-align: right" scope="row">Gender :</th>
          <td style="text-align: left"><input name="gender" type="radio" required id="radio" value="Male">
          <label for="radio">Male
            <input name="gender" type="radio" required id="radio2" value="Female">
          Female</label></td>
        </tr>
        <tr>
          <th style="text-align: right" scope="row">Dob :</th>
          <td style="text-align: left"><%=objAIbean.getDob()%></td>
        </tr>
        <tr>
          <th style="text-align: right" scope="row">Address :</th>
          <td style="text-align: left"><textarea name="address" required id="textarea" style="max-height:58px;max-width:166px; min-height:58px;min-width:166px;"><%=objAIbean.getAddress()%></textarea></td>
        </tr>
        <tr>
          <th style="text-align: right" scope="row">Email :</th>
          <td style="text-align: left"><%=objAIbean.getEmail()%></td>
        </tr>
        <tr style="text-align: center">
          <th colspan="2" scope="row"><input type="submit" name="profileup" id="submit" value="Update"></th>
        </tr>
      </table>
     
  </div>
 
</div> </form> 
<div id="bottom">
MyAI&copy;Manjit singh
</div>


<div id="top">
MyAI
<div class="signout"><input type="button" name="button" id="button" value="Sign out"></div>
</div>

</body>
</html>
