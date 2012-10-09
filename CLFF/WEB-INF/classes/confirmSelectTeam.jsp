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
        Vector newteam= new Vector();
        Vector newteamtmp=new Vector();
        Vector newteamtmpvalues=new Vector();
        val=null;
        int check=0;
        float tmpvalue=0;
        if(submit.equals("Confirm"))
        {
        val=request.getParameter("gk1");
		int i= Integer.parseInt(val);
		newteamtmpvalues.add(i);
		if(i==-1){
			user.setErrorMessage("Select All 15 Players");
	        check=1;
	        Player p=new Player();
	        newteamtmp.add(p);
		}else
		{
			newteamtmp.add((Player)allplayers.getGoalkeepers().get(i));
			newteam.add((Player)allplayers.getGoalkeepers().get(i));
			tmpvalue+=((Player)allplayers.getGoalkeepers().get(i)).getValue();
		}
		
		val=request.getParameter("gk2");
		i= Integer.parseInt(val);
		newteamtmpvalues.add(i);
		if(i==-1){
			user.setErrorMessage("Select All 15 Players");
			check=1;
			Player p=new Player();
	        newteamtmp.add(p);}else
		{
				newteamtmp.add((Player)allplayers.getGoalkeepers().get(i));
				newteam.add((Player)allplayers.getGoalkeepers().get(i));
				tmpvalue+=((Player)allplayers.getGoalkeepers().get(i)).getValue();
		}
		
		val=request.getParameter("df1");
		i= Integer.parseInt(val);
		newteamtmpvalues.add(i);
		if(i==-1){
			user.setErrorMessage("Select All 15 Players");
			check=1;
			Player p=new Player();
	        newteamtmp.add(p);	}else{
				newteamtmp.add((Player)allplayers.getGoalkeepers().get(i));
			newteam.add((Player)allplayers.getDefenders().get(i));
			tmpvalue+=((Player)allplayers.getDefenders().get(i)).getValue();
			}
		
		val=request.getParameter("df2");
		i= Integer.parseInt(val);
		newteamtmpvalues.add(i);
		if(i==-1){
			user.setErrorMessage("Select All 15 Players");
			check=1;Player p=new Player();
	        newteamtmp.add(p);		}else{
				newteamtmp.add((Player)allplayers.getGoalkeepers().get(i));
			newteam.add((Player)allplayers.getDefenders().get(i));
			tmpvalue+=((Player)allplayers.getDefenders().get(i)).getValue();
			}

		val=request.getParameter("df3");
		i= Integer.parseInt(val);
		newteamtmpvalues.add(i);
		if(i==-1){
			user.setErrorMessage("Select All 15 Players");
			check=1;Player p=new Player();
	        newteamtmp.add(p);		}else{
				newteamtmp.add((Player)allplayers.getGoalkeepers().get(i));
			newteam.add((Player)allplayers.getDefenders().get(i));
			tmpvalue+=((Player)allplayers.getDefenders().get(i)).getValue();
			}
		val=request.getParameter("df4");
		i= Integer.parseInt(val);
		newteamtmpvalues.add(i);
		if(i==-1){
			user.setErrorMessage("Select All 15 Players");
			check=1;
			Player p=new Player();
	        newteamtmp.add(p);}else{
				newteamtmp.add((Player)allplayers.getGoalkeepers().get(i));
			newteam.add((Player)allplayers.getDefenders().get(i));
			tmpvalue+=((Player)allplayers.getDefenders().get(i)).getValue();
			}
		val=request.getParameter("df5");
		i= Integer.parseInt(val);
		newteamtmpvalues.add(i);
		if(i==-1){
			user.setErrorMessage("Select All 15 Players");
			check=1;Player p=new Player();
	        newteamtmp.add(p);		}else{
				newteamtmp.add((Player)allplayers.getGoalkeepers().get(i));
			newteam.add((Player)allplayers.getDefenders().get(i));
			tmpvalue+=((Player)allplayers.getDefenders().get(i)).getValue();
			}
		val=request.getParameter("mf1");
		i= Integer.parseInt(val);
		newteamtmpvalues.add(i);
		if(i==-1){
			user.setErrorMessage("Select All 15 Players");
			check=1;Player p=new Player();
	        newteamtmp.add(p);		}else{
				newteamtmp.add((Player)allplayers.getGoalkeepers().get(i));
			newteam.add((Player)allplayers.getMidfielders().get(i));
			tmpvalue+=((Player)allplayers.getMidfielders().get(i)).getValue();
			}
		val=request.getParameter("mf2");
		i= Integer.parseInt(val);
		newteamtmpvalues.add(i);
		if(i==-1){
			user.setErrorMessage("Select All 15 Players");
			check=1;Player p=new Player();
	        newteamtmp.add(p);		}else{
				newteamtmp.add((Player)allplayers.getGoalkeepers().get(i));
			newteam.add((Player)allplayers.getMidfielders().get(i));
			tmpvalue+=((Player)allplayers.getMidfielders().get(i)).getValue();
			}

		val=request.getParameter("mf3");
		i= Integer.parseInt(val);
		newteamtmpvalues.add(i);
		if(i==-1){
			user.setErrorMessage("Select All 15 Players");
			check=1;Player p=new Player();
	        newteamtmp.add(p);		}else{
				newteamtmp.add((Player)allplayers.getGoalkeepers().get(i));
			newteam.add((Player)allplayers.getMidfielders().get(i));
			tmpvalue+=((Player)allplayers.getMidfielders().get(i)).getValue();
			}
		val=request.getParameter("mf4");
		i= Integer.parseInt(val);
		newteamtmpvalues.add(i);
		if(i==-1){
			user.setErrorMessage("Select All 15 Players");
			check=1;Player p=new Player();
	        newteamtmp.add(p);		}else{
				newteamtmp.add((Player)allplayers.getGoalkeepers().get(i));
			newteam.add((Player)allplayers.getMidfielders().get(i));
			tmpvalue+=((Player)allplayers.getMidfielders().get(i)).getValue();
			}
		val=request.getParameter("mf5");
		i= Integer.parseInt(val);
		newteamtmpvalues.add(i);
		if(i==-1){
			user.setErrorMessage("Select All 15 Players");
			check=1;Player p=new Player();
	        newteamtmp.add(p);		}else{
				newteamtmp.add((Player)allplayers.getGoalkeepers().get(i));
			newteam.add((Player)allplayers.getMidfielders().get(i));
			tmpvalue+=((Player)allplayers.getMidfielders().get(i)).getValue();
			}
		val=request.getParameter("ff1");
		i= Integer.parseInt(val);
		newteamtmpvalues.add(i);
		if(i==-1){
			user.setErrorMessage("Select All 15 Players");
			check=1;Player p=new Player();
	        newteamtmp.add(p);		}else{
				newteamtmp.add((Player)allplayers.getGoalkeepers().get(i));
			newteam.add((Player)allplayers.getForwards().get(i));
			tmpvalue+=((Player)allplayers.getForwards().get(i)).getValue();
			}
		val=request.getParameter("ff2");
		i= Integer.parseInt(val);
		newteamtmpvalues.add(i);
		if(i==-1){
			user.setErrorMessage("Select All 15 Players");
			check=1;Player p=new Player();
	        newteamtmp.add(p);		}else{
				newteamtmp.add((Player)allplayers.getGoalkeepers().get(i));
			newteam.add((Player)allplayers.getForwards().get(i));
			tmpvalue+=((Player)allplayers.getForwards().get(i)).getValue();
			}
		val=request.getParameter("ff3");
		i= Integer.parseInt(val);
		newteamtmpvalues.add(i);
		if(i==-1){
			user.setErrorMessage("Select All 15 Players");
	        check=1;Player p=new Player();
	        newteamtmp.add(p);
		}else{
			newteamtmp.add((Player)allplayers.getGoalkeepers().get(i));
			newteam.add((Player)allplayers.getForwards().get(i));
			tmpvalue+=((Player)allplayers.getForwards().get(i)).getValue();
		}
		user.setTmpnewteamvalues(newteamtmpvalues);
		user.setTmpnewplayers(newteamtmp);
		user.setTmpvalue(tmpvalue);
		}
        if(check==0)
        {	
        	user.setNewplayers(newteam);
		user.setAction("MakeTeam");
        response.sendRedirect("Controller");
        }
        else if(check==1)
        	response.sendRedirect("SelectTeam.jsp");
        %>
        
     </body>
</html>
 