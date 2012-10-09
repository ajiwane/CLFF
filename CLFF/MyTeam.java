
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.*;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import package1.*;
public abstract class MyTeam {

	public static void checkMyTeam(HttpSession session,HttpServletResponse response) throws IOException
	   {
		PrintWriter out = response.getWriter();
		Connection dbConn = null;
        Statement query = null;
        Statement query1 = null;
        Statement query2 = null;
	    ResultSet results = null;
	    ResultSet results1 = null;
	    ResultSet results2 = null;
	    UserBean user=(UserBean)session.getAttribute("user");		
		String team_name=user.getTeamname();
	    
		Vector players= new Vector();
	    dbConn = DBConn.getConn();
		try{
			int check=0;
			
				query = dbConn.createStatement();
				query1 = dbConn.createStatement();
				query2 = dbConn.createStatement();
			results = query.executeQuery("select club_name,jersey_no from captainof where team_name = '"
					+team_name+"'");
			
			while(results.next()){
			
				check=1;
				String club_name=results.getString(1);
				
				int jersey_no=results.getInt(2);
				
				results1 = query1.executeQuery("select * from player where jersey_no = '"
						+jersey_no+"' and club_name='"+club_name+"'");
				
				Player captain= new Player();
				
				while(results1.next()){
					String tmpclub_name=results1.getString(1);
					captain.setClub_name(tmpclub_name);
					int tmpjersey_no=results1.getInt(2);
					captain.setJersey_no(tmpjersey_no);
					
					captain.setPlayer_name(results1.getString(3)+"(C)");
					
					captain.setPosition(results1.getString(4));
					
					captain.setValue(results1.getFloat(5));
					
					if(results1.getInt(6)==1)
					{
						captain.setToday_played("YES");
						results2 = query2.executeQuery("select today_score,total_score from score where jersey_no = '"
								+tmpjersey_no+"' and club_name='"+tmpclub_name+"'");
						while(results2.next())
						{
							captain.setToday_score(2*(results2.getInt(1)));
							captain.setTotal_score(results2.getInt(2));
						}
					}
					else
					{
						captain.setToday_played("NO");
						captain.setToday_score(0);
					}
				}
				players.add(captain);
			}
			
			
			if(check==1)
			{
				results = query.executeQuery("select club_name,jersey_no from playing where team_name = '"
						+team_name+"'");
				while(results.next())
				{
					String club_name=results.getString(1);
					int jersey_no=results.getInt(2);
					results1 = query1.executeQuery("select * from player where jersey_no = '"
							+jersey_no+"' and club_name='"+club_name+"'");
					Player player= new Player();
					while(results1.next()){
						String tmpclub_name=results1.getString(1);
						player.setClub_name(tmpclub_name);
						int tmpjersey_no=results1.getInt(2);
						player.setJersey_no(tmpjersey_no);
						player.setPlayer_name(results1.getString(3));
						player.setPosition(results1.getString(4));
						player.setValue(results1.getFloat(5));
						if(results1.getInt(6)==1)
						{
							player.setToday_played("YES");
							results2 = query2.executeQuery("select today_score,total_score from score where jersey_no = '"
									+tmpjersey_no+"' and club_name='"+tmpclub_name+"'");
							while(results2.next())
							{
								player.setToday_score(results2.getInt(1));
								player.setTotal_score(results2.getInt(2));
							}
							//player.setToday_score();
						}
						else
						{
							player.setToday_played("NO");
							player.setToday_score(0);
						}
					}
					players.add(player);					
				}
				
				results = query.executeQuery("select club_name,jersey_no from substitute where team_name = '"
						+team_name+"'");
				int c=0;
				while(results.next())
				{
					String club_name=results.getString(1);
					int jersey_no=results.getInt(2);
					results1 = query1.executeQuery("select * from player where jersey_no = '"
							+jersey_no+"' and club_name='"+club_name+"'");
					Player sub= new Player();
					
					while(results1.next()){
						++c;
						String tmpclub_name=results1.getString(1);
						sub.setClub_name(tmpclub_name);
						int tmpjersey_no=results1.getInt(2);
						sub.setJersey_no(tmpjersey_no);
						sub.setPlayer_name(results1.getString(3)+"(S"+Integer.toString(c)+")");
						sub.setPosition(results1.getString(4));
						sub.setValue(results1.getFloat(5));
						if(results1.getInt(6)==1)
						{
							sub.setToday_played("YES");
							results2 = query2.executeQuery("select today_score,total_score from score where jersey_no = '"
									+tmpjersey_no+"' and club_name='"+tmpclub_name+"'");
							while(results2.next())
							{
								sub.setToday_score(results2.getInt(1));
								sub.setTotal_score(results2.getInt(2));
							}
						}
						else
						{
							sub.setToday_played("NO");
							sub.setToday_score(0);
						}
					}
					players.add(sub);					
				}
				user.setPlayers(players);
				response.sendRedirect("MyTeam.jsp");
			}
			if(check==0){
				response.sendRedirect("checkTimeSelectTeam.jsp");		
			}	
		}catch (SQLException e)
	      {
			try
	      	{dbConn.close();
	         }catch (SQLException x) {}
	      }
	
	   }
}

