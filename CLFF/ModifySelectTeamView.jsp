<jsp:useBean id="user" class="package1.UserBean" scope="session"/>
<jsp:setProperty name="user" property="*"/> 
<html>
   <head>
        <title>  Login  </title>
    </head>
     <body >
        <%
        String submit=request.getParameter("Submit");
        if(submit.equals("GK"))
        {
        session.setAttribute("currentindex",0);
        session.setAttribute("currentpositionview","Goalkeepers");
        }
        else if(submit.equals("DF"))
        {
        session.setAttribute("currentindex",0);
        session.setAttribute("currentpositionview","Defenders");
        }
        else if(submit.equals("MF"))
        {
        session.setAttribute("currentindex",0);
        session.setAttribute("currentpositionview","Midfielders");
        }
        else if(submit.equals("FF"))
        {
		session.setAttribute("currentindex",0);
        session.setAttribute("currentpositionview","Forwards");
        }
        else if(submit.equals("<<Prev"))
        {
		int i=(Integer)session.getAttribute("currentindex");
	    session.setAttribute("currentindex",i-10);
        }
        else if(submit.equals("Next>>"))
        {
		int i=(Integer)session.getAttribute("currentindex");
        session.setAttribute("currentindex",i+10);
        }
        response.sendRedirect("SelectTeam.jsp");
        %>

        </body>
        </html>
        