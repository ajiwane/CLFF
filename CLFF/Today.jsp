<jsp:useBean id="user" class="package1.UserBean" scope="session"/>
<jsp:setProperty name="user" property="*"/> 
<html>
   <head>
        <title>  Overall  </title>
    </head>
     <body >
        <%
		user.setAction("Today");
        response.sendRedirect("Controller");%>
     </body>
</html>
 