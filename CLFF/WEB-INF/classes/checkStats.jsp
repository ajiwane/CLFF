<jsp:useBean id="user" class="package1.UserBean" scope="session"/>
<jsp:setProperty name="user" property="*"/> 
<html>
   <head>
        <title>  Login  </title>
    </head>
     <body >
        <%	
	   
		String action = request.getParameter("viewstats");
		if(action.equals("Clubs")){
		user.setAction("showClubs1");
		response.sendRedirect("Controller");
		}
        else if(action.equals("Players")){
        user.setAction("showClubs2");
		response.sendRedirect("Controller");        
        }
       
       %>
     </body>
</html>
 