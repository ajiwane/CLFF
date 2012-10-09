<jsp:useBean id="user" class="package1.UserBean" scope="session"/>
<jsp:setProperty name="user" property="*"/> 
<html>
   <head>
        <title>  Registration  </title>
    </head>
     <body >
        <%
		user.setAction("showPlayers");
        response.sendRedirect("Controller");%>
     </body>
</html>
