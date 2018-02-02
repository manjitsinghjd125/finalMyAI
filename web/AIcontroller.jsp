
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
    if (request.getParameter("profileup") != null) {
        String url1="Profile.jsp";
        AIservices obj =new AIservices();
        String result = obj.updation(object);
        //url = "index.jsp?msg=" + result;
    }
%>

<%
   String url;
    if (request.getParameter("signin") != null) {
       
        AIservices obj = new AIservices();
        String output = obj.Auth(object);
        
//System.out.println(output);
        if(output.equals("welcome")){
        url="sessionhandling?id="+object.getUserid()+"";
    }
        else if(output.equals("admin")){
            url="Admin.jsp";
        }
        else{
         
            String val="wrong username or password";
            url = "index.jsp?msg=" + val;
        }
    response.sendRedirect(url);
    }
%>

<%       
    String site="";
   
    if (request.getParameter("passup") != null) { 
        String ur=(String)session.getAttribute("usrid");
        AIservices aiobject =new AIservices();
        String result1 = aiobject.passupdate(object , ur);
        
        if(result1.equals("successful")){
           site="Profile.jsp?msg="+result1;
        }
        else{
            site="Passwordupdate.jsp?msg="+result1;
        }
        response.sendRedirect(site);
//url = "index.jsp?msg=" + result;
    }
%>

