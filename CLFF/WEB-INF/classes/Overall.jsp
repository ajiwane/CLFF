<jsp:useBean id="user" class="package1.UserBean" scope="session"/>
<jsp:setProperty name="user" property="*"/> 
<html>
   <head>
        <title>  Overall  </title>
    </head>
     <body >
        <%
		user.setAction("Overall");
        response.sendRedirect("Controller");%>
     </body>
</html>
 