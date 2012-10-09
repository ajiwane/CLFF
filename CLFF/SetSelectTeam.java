import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.*;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.*;

import package1.*;
public abstract class SetSelectTeam {

	public static void checkSetSelectTeam(HttpSession session,HttpServletResponse response) throws IOException
	   {
		UserBean user=(UserBean)session.getAttribute("user");
		String message = user.getSelectionAllowed();
		if(message.equals("NoSelectTeam")){
			response.sendRedirect("SelectTeam.jsp");
		}
		else if(message.equals("AllowSelectTeam")){
			PrintWriter out = response.getWriter();
			//out.print("here");
			Connection dbConn = null;
	        Statement query = null;
	        Statement query1 = null;
		    ResultSet results = null;
		    ResultSet results1 = null;
		    Statement querycheck = null;
		    ResultSet resultscheck = null;
		    AllPlayers allplayers = new AllPlayers();
		    Vector goalkeepers=new Vector();
			Vector defenders=new Vector();
			Vector midfielders=new Vector();
			Vector forwards=new Vector();
			Vector tmpoldteam=user.getTmpnewplayers();
			//Vector tmpoldteamvalues=user.getTmpnewteamvalues();
			Vector tmpnewteam=new Vector();
			Vector tmpnewteamvalues=new Vector();
		    String sortby=(String)session.getAttribute("sortby");
		    dbConn = DBConn.getConn();
		    		
			String team_name=user.getTeamname();
			try{
				
				query = dbConn.createStatement();
				querycheck = dbConn.createStatement();
				query1 = dbConn.createStatement();
				int check=0;
				
				if(sortby.equals("Name")){
					
					results=query.executeQuery("select player_name,A.club_name,A.jersey_no," +
							"position,value,total_score from player as A" +
							" INNER JOIN score as B " +
							"ON A.club_name=B.club_name and A.jersey_no=B.jersey_no " +
							"order by player_name,total_score DESC,value DESC,club_name");
					}
					else if(sortby.equals("Club")){
						results=query.executeQuery("select player_name,A.club_name,A.jersey_no," +
								"position,value,total_score from player as A" +
								" INNER JOIN score as B " +
								"ON A.club_name=B.club_name and A.jersey_no=B.jersey_no " +
						"order by club_name,total_score DESC,value DESC,player_name");
					}
					else if(sortby.equals("Val")){
						
						results=query.executeQuery("select player_name,A.club_name,A.jersey_no," +
								"position,value,total_score from player as A" +
								" INNER JOIN score as B " +
								"ON A.club_name=B.club_name and A.jersey_no=B.jersey_no " +
								"order by value DESC,total_score DESC,player_name,club_name");
					}
					else if(sortby.equals("Pts")){
						
						results=query.executeQuery("select player_name,A.club_name,A.jersey_no," +
								"position,value,total_score from player as A" +
								" INNER JOIN score as B " +
								"ON A.club_name=B.club_name and A.jersey_no=B.jersey_no " +
								"order by total_score DESC,value DESC,player_name,club_name");
					}
				allplayers.setDefenders(defenders);
				allplayers.setForwards(forwards);
				allplayers.setGoalkeepers(goalkeepers);
				allplayers.setMidfielders(midfielders);
				//if(((String)session.getAttribute("selectionprocess")).equals("setselectteam1"))
				//{
				//	session.setAttribute("selectionprocess","none");
				//	response.sendRedirect("confirmSelectTeam.jsp");
				//}
				while(results.next()){
					Player p=new Player();
					String pos = new String();
					if(check==0){
					p.setPlayer_name(results.getString(1));
					String club_name=results.getString(2);
					p.setClub_name(club_name);
					int jersey_no= results.getInt(3);
					p.setJersey_no(jersey_no);
					pos=results.getString(4);
					p.setPosition(pos);
					p.setValue(results.getFloat(5));
					p.setTotal_score(results.getInt(6));
					
					if(pos.equals("Goalkeeper")){
						goalkeepers.add(p);
					}
					else if(pos.equals("Defender")){
						defenders.add(p);
					}
					else if(pos.equals("Midfielder")){
						midfielders.add(p);
					}
					else if(pos.equals("Forward")){
						forwards.add(p);
					}				
				}}
				int checkval=0;
				for(int k=0;k<goalkeepers.size();++k)
				{
					if(((Player)tmpoldteam.elementAt(0)).equal((Player)goalkeepers.elementAt(k)))
					{
						//out.println("correct match "+((Player)tmpoldteam.elementAt(0)).getClub_name());
						tmpnewteam.add((Player)goalkeepers.elementAt(k));
						tmpnewteamvalues.add(k);
						checkval=1;
					}
				}
				if(checkval==0)
					{
					Player p= new Player();
					tmpnewteam.add(p);
					tmpnewteamvalues.add(-1);
					}
				if(checkval==1)
					checkval=0;
				
				for(int k=0;k<goalkeepers.size();++k)
				{
					if(((Player)tmpoldteam.elementAt(1)).equal((Player)goalkeepers.elementAt(k)))
					{
						tmpnewteam.add((Player)goalkeepers.elementAt(k));
						tmpnewteamvalues.add(k);
						checkval=1;
					}
				}
				if(checkval==0)
				{
				Player p= new Player();
				tmpnewteam.add(p);
				tmpnewteamvalues.add(-1);
				}
				if(checkval==1)
					checkval=0;
				
				int countval=0;
				for(int k=0;k<defenders.size();++k)
				{
					if(((Player)tmpoldteam.elementAt(2)).equal((Player)defenders.elementAt(k)))
					{
						tmpnewteam.add((Player)defenders.elementAt(k));
						tmpnewteamvalues.add(k);
						checkval=1;
						++countval;
					}else if(((Player)tmpoldteam.elementAt(3)).equal((Player)defenders.elementAt(k)))
					{
						tmpnewteam.add((Player)defenders.elementAt(k));
						tmpnewteamvalues.add(k);
						checkval=1;
						++countval;
					}else if(((Player)tmpoldteam.elementAt(4)).equal((Player)defenders.elementAt(k)))
					{
						tmpnewteam.add((Player)defenders.elementAt(k));
						tmpnewteamvalues.add(k);
						checkval=1;
						++countval;
					}else if(((Player)tmpoldteam.elementAt(5)).equal((Player)defenders.elementAt(k)))
					{
						tmpnewteam.add((Player)defenders.elementAt(k));
						tmpnewteamvalues.add(k);
						checkval=1;
						++countval;
					}
				}
				for(int i=countval;i<4;++i)
					{
					Player p= new Player();
					tmpnewteam.add(p);
					tmpnewteamvalues.add(-1);
					}
				if(checkval==1)
					checkval=0;
				countval=0;
				for(int k=0;k<defenders.size();++k)
				{
					if(((Player)tmpoldteam.elementAt(6)).equal((Player)defenders.elementAt(k)))
					{
						tmpnewteam.add((Player)defenders.elementAt(k));
						tmpnewteamvalues.add(k);
						checkval=1;
					}
				}
				if(checkval==0)
				{
				Player p= new Player();
				tmpnewteam.add(p);
				tmpnewteamvalues.add(-1);
				}
				if(checkval==1)
					checkval=0;
				for(int k=0;k<midfielders.size();++k)
				{
					if(((Player)tmpoldteam.elementAt(7)).equal((Player)midfielders.elementAt(k)))
					{
						tmpnewteam.add((Player)midfielders.elementAt(k));
						tmpnewteamvalues.add(k);
						checkval=1;
					}else if(((Player)tmpoldteam.elementAt(8)).equal((Player)midfielders.elementAt(k)))
					{
						tmpnewteam.add((Player)midfielders.elementAt(k));
						tmpnewteamvalues.add(k);
						checkval=1;
					}else if(((Player)tmpoldteam.elementAt(9)).equal((Player)midfielders.elementAt(k)))
					{
						tmpnewteam.add((Player)midfielders.elementAt(k));
						tmpnewteamvalues.add(k);
						checkval=1;
					}else if(((Player)tmpoldteam.elementAt(10)).equal((Player)midfielders.elementAt(k)))
					{
						tmpnewteam.add((Player)midfielders.elementAt(k));
						tmpnewteamvalues.add(k);
						checkval=1;
					}
				}
				for(int i=countval;i<4;++i)
				{
					Player p= new Player();
					tmpnewteam.add(p);
					tmpnewteamvalues.add(-1);
					}
				if(checkval==1)
					checkval=0;
				countval=0;
				for(int k=0;k<midfielders.size();++k)
				{
					if(((Player)tmpoldteam.elementAt(11)).equal((Player)midfielders.elementAt(k)))
					{
						tmpnewteam.add((Player)midfielders.elementAt(k));
						tmpnewteamvalues.add(k);
						checkval=1;
					}
				}
				if(checkval==0)
				{
				Player p= new Player();
				tmpnewteam.add(p);
				tmpnewteamvalues.add(-1);
				}
				if(checkval==1)
					checkval=0;
				for(int k=0;k<forwards.size();++k)
				{
					if(((Player)tmpoldteam.elementAt(12)).equal((Player)forwards.elementAt(k)))
					{
						tmpnewteam.add((Player)forwards.elementAt(k));
						tmpnewteamvalues.add(k);
						checkval=1;
					}else if(((Player)tmpoldteam.elementAt(13)).equal((Player)forwards.elementAt(k)))
					{
						tmpnewteam.add((Player)forwards.elementAt(k));
						tmpnewteamvalues.add(k);
						checkval=1;
					}
				}
				for(int i=countval;i<4;++i)
				{
					Player p= new Player();
					tmpnewteam.add(p);
					tmpnewteamvalues.add(-1);
					}
				if(checkval==1)
					checkval=0;
				countval=0;
				for(int k=0;k<forwards.size();++k)
				{
					if(((Player)tmpoldteam.elementAt(14)).equal((Player)forwards.elementAt(k)))
					{
						tmpnewteam.add((Player)forwards.elementAt(k));
						tmpnewteamvalues.add(k);
						checkval=1;
					}
				}
				if(checkval==0)
				{
				Player p= new Player();
				tmpnewteam.add(p);
				tmpnewteamvalues.add(-1);
				}
				if(checkval==1)
					checkval=0;
				
				user.setTmpnewplayers(tmpnewteam);
				user.setTmpnewteamvalues(tmpnewteamvalues);
				session.setAttribute("allplayers", allplayers);
				response.sendRedirect("SelectTeam.jsp");					
			}catch (SQLException e)
		      {
				out.print(e);
				try
		      	{dbConn.close();
		         }catch (SQLException x) {
		        	 
		         }
		      }
		}
}
}