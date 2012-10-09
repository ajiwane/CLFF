<jsp:useBean id="user" class="package1.UserBean" scope="session"/>
<jsp:setProperty name="user" property="*"/> 
<html>
   <head>
        <title>  Logout  </title>
    </head>
     <body >
        <%
		user.setAction("Logout");
        response.sendRedirect("Controller");%>
     </body>
</html>
 