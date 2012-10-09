<jsp:useBean id="user" class="package1.UserBean" scope="session"/>
<jsp:setProperty name="user" property="*"/> 
<%@ page import="java.util.Vector,package1.*"%>
<html>
   <head>
        <title>  Login  </title>
    </head>
     <body >
        <%	if(user.getSelectionAllowed().equals("AllowSelectTeam")){
        session.setAttribute("currentpositionview","Goalkeepers");
        session.setAttribute("currentindex",0);
        session.setAttribute("sortby","Pts");
        Vector tmpteam=new Vector();
        for(int i=0;i<15;++i)
        {
        	Player p=new Player();
        	tmpteam.add(p);
        }
        user.setTmpnewplayers(tmpteam);
        }
	    user.setAction("setSelectTeam");
        response.sendRedirect("Controller");
        
        %>
     </body>
</html>
 