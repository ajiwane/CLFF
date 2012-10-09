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
public abstract class SetTransfer {

	public static void checkSetTransfer(HttpSession session,HttpServletResponse response) throws IOException
	   {
		UserBean user=(UserBean)session.getAttribute("user");
		String message = user.getSelectionAllowed();
		if(message.equals("NoTransfer")){
			response.sendRedirect("Transfer.jsp");
		}
		else if(message.equals("AllowTransfer")){
			PrintWriter out = response.getWriter();
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
		    String sortby=(String)session.getAttribute("sortby");
		    dbConn = DBConn.getConn();
		    		
			String team_name=user.getTeamname();
			try{
				
				query = dbConn.createStatement();
				querycheck = dbConn.createStatement();
				query1 = dbConn.createStatement();
				
				int checkteam=0;
				
				resultscheck = querycheck.executeQuery("select club_name,jersey_no from captainof where team_name = '"
						+team_name+"'");
				while(resultscheck.next())
				{
				checkteam=1;	
				
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
					out.print("reaches111");
					results=query.executeQuery("select player_name,A.club_name,A.jersey_no," +
							"position,value,total_score from player as A" +
							" INNER JOIN score as B " +
							"ON A.club_name=B.club_name and A.jersey_no=B.jersey_no " +
							"order by value DESC,total_score DESC,player_name,club_name");
				}
				else if(sortby.equals("Pts")){
					out.print("reaches");
					results=query.executeQuery("select player_name,A.club_name,A.jersey_no," +
							"position,value,total_score from player as A" +
							" INNER JOIN score as B " +
							"ON A.club_name=B.club_name and A.jersey_no=B.jersey_no " +
							"order by total_score DESC,value DESC,player_name,club_name");
				}
				
				while(results.next()){
					Player p=new Player();
					String pos = new String();
					
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
				}
				allplayers.setDefenders(defenders);
				allplayers.setForwards(forwards);
				allplayers.setGoalkeepers(goalkeepers);
				allplayers.setMidfielders(midfielders);
				session.setAttribute("allplayers", allplayers);
				response.sendRedirect("Transfer.jsp");					
			}
				if(checkteam==0)
				{
					response.sendRedirect("checkTimeSelectTeam.jsp");
				}
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

