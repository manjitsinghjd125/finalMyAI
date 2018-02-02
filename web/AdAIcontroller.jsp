
<%-- 
    Document   : AIcontroller
    Created on : Apr 22, 2016, 10:55:55 AM
    Author     : Manjit Singh
--%>
<%@page session="true"%>
<%@page 
    import="bean.*"
    import="services.*"
    import="servlet.*"
    %>



<jsp:useBean id="object" class="bean.AIbean">

    <jsp:setProperty name="object" property="*"/>
</jsp:useBean>


<%
   String url;
    if (request.getParameter("adminsign") != null) {
       
        AdAIservices obj = new AdAIservices();
        String output = obj.Auth(object);
        
//System.out.println(output);
        if(output.equals("welcome")){
        url="adminsession?id="+object.getUserid()+"";
    }
        
        else{
         
            String val="wrong username or password";
            url = "Admin.jsp?msg=" + val;
        }
    response.sendRedirect(url);
    }
%>

<%       
    String site="";
   
    if (request.getParameter("passup") != null) { 
        String ur=(String)session.getAttribute("usrid");
        AdAIservices aiobject =new AdAIservices();
        String result1 = aiobject.passupdate(object , ur);
        
        if(result1.equals("successful")){
           site="AdProfile.jsp?msg="+result1;
        }
        else{
            site="AdPasswordupdate.jsp?msg="+result1;
        }
        response.sendRedirect(site);
//url = "index.jsp?msg=" + result;
    }
%>