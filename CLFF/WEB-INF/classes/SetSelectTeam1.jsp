<jsp:useBean id="user" class="package1.UserBean" scope="session"/>
<jsp:setProperty name="user" property="*"/> 
<html>
   <head>
        <title>  Login  </title>
    </head>
     <body >
        <%	
        session.setAttribute("currentindex",0);
        String submit=request.getParameter("Submit");
        if(submit.equals("Name"))
        {
        session.setAttribute("sortby","Name");
        }
        else if(submit.equals("Club"))
        {
        session.setAttribute("sortby","Club");
        }
        else if(submit.equals("Val"))
        {
        session.setAttribute("sortby","Val");
        }
        else if(submit.equals("Pts"))
        {
        session.setAttribute("sortby","Pts");
        }
	    user.setAction("setSelectTeam");
        response.sendRedirect("Controller");%>
     </body>
</html>
 