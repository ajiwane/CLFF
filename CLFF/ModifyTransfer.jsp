<jsp:useBean id="user" class="package1.UserBean" scope="session"/>
<jsp:useBean id="allplayers" class="package1.AllPlayers" scope="session"/>
<jsp:setProperty name="user" property="*"/> 
<%@ page import="java.util.Vector,package1.*"%>
<html>
   <head>
        <title>  Login  </title>
    </head>
     <body >
        <%
        String submit=request.getParameter("Submit");
        String val=new String();
        val=null;
        if(submit.equals("Make Transfers"))
        {
        Vector newteam= new Vector();
		val=request.getParameter("gk1");
		int i= Integer.parseInt(val);
		newteam.add((Player)allplayers.getGoalkeepers().get(i));
		
		val=request.getParameter("gk2");
		i= Integer.parseInt(val);
		newteam.add((Player)allplayers.getGoalkeepers().get(i));
		
		val=request.getParameter("df1");
		i= Integer.parseInt(val);
		newteam.add((Player)allplayers.getDefenders().get(i));
		
		val=request.getParameter("df2");
		i= Integer.parseInt(val);
		newteam.add((Player)allplayers.getDefenders().get(i));

		val=request.getParameter("df3");
		i= Integer.parseInt(val);
		newteam.add((Player)allplayers.getDefenders().get(i));

		val=request.getParameter("df4");
		i= Integer.parseInt(val);
		newteam.add((Player)allplayers.getDefenders().get(i));

		val=request.getParameter("df5");
		i= Integer.parseInt(val);
		newteam.add((Player)allplayers.getDefenders().get(i));
		
		val=request.getParameter("mf1");
		i= Integer.parseInt(val);
		newteam.add((Player)allplayers.getMidfielders().get(i));
		
		val=request.getParameter("mf2");
		i= Integer.parseInt(val);
		newteam.add((Player)allplayers.getMidfielders().get(i));

		val=request.getParameter("mf3");
		i= Integer.parseInt(val);
		newteam.add((Player)allplayers.getMidfielders().get(i));

		val=request.getParameter("mf4");
		i= Integer.parseInt(val);
		newteam.add((Player)allplayers.getMidfielders().get(i));

		val=request.getParameter("mf5");
		i= Integer.parseInt(val);
		newteam.add((Player)allplayers.getMidfielders().get(i));

		val=request.getParameter("ff1");
		i= Integer.parseInt(val);
		newteam.add((Player)allplayers.getForwards().get(i));

		val=request.getParameter("ff2");
		i= Integer.parseInt(val);
		newteam.add((Player)allplayers.getForwards().get(i));

		val=request.getParameter("ff3");
		i= Integer.parseInt(val);
		newteam.add((Player)allplayers.getForwards().get(i));
		
		user.setNewplayers(newteam);
		}
		user.setAction("MakeTransfer");
        response.sendRedirect("Controller");
        %>
        
     </body>
</html>
 