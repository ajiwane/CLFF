<jsp:useBean id="user" class="package1.UserBean" scope="session"/>
<jsp:setProperty name="user" property="*"/> 

<html>
   <head>
        <title>  Login  </title>
    </head>
     <body >
        <%	
	    		user.setAction("showResults");
        response.sendRedirect("Controller");%>
     </body>
</html>
 