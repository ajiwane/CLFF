<jsp:useBean id="user" class="package1.UserBean" scope="session"/>
<jsp:setProperty name="user" property="*"/> 
<html>
   <head>
        <title>  Login  </title>
    </head>
     <body >
        <%	if(user.getSelectionAllowed().equals("AllowTransfer")){
        session.setAttribute("currentpositionview","Goalkeepers");
        session.setAttribute("currentindex",0);
        session.setAttribute("sortby","Pts");
        }
	    user.setAction("setTransfer");
        response.sendRedirect("Controller");
        
        %>
     </body>
</html>
 