import java.io.IOException;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.*;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


import package1.*;
public abstract class ShowPlayers {

	public static void checkPlayers(HttpSession session,HttpServletResponse response) throws IOException
	   {
		String club = ((UserBean)session.getAttribute("user")).getClubview();
		
		Connection dbConn = null;
        Statement query = null;
	    ResultSet results = null;
	    Vector players =new Vector();
	    dbConn = DBConn.getConn();
		try{
			query = dbConn.createStatement();
			results = query.executeQuery("select * from player_total_stats where club_name='"+club+"'");
			while(results.next()){
				Player entry = new Player();
				entry.setPlayer_name(results.getString(3));
				entry.setPosition(results.getString(4).substring(0,1));
				entry.setTotal_played_game(results.getInt(6));
				entry.setTotal_played_60_min(results.getInt(7));
				entry.setTotal_goal_scored(results.getInt(8));
				entry.setTotal_goal_assist(results.getInt(9));
				entry.setTotal_no_conceed(results.getInt(10));
				entry.setTotal_penalty_saved(results.getInt(11));
				entry.setTotal_penalty_created(results.getInt(12));
				entry.setTotal_penalty_missed(results.getInt(13));
				entry.setTotal_2_goal_conceed(results.getInt(14));
				entry.setTotal_yellow_card(results.getInt(15));
				entry.setTotal_red_card(results.getInt(16));
				entry.setTotal_3_saves(results.getInt(17));
				entry.setTotal_score(results.getInt(18));
				players.add(entry);
			}
			LeagueStandings allplayers = new LeagueStandings();
			allplayers.setEntries(players);
			session.setAttribute("players",allplayers);
			response.sendRedirect("PlayerStats.jsp");			
					
		}catch (SQLException e)
	      {
			
			try
	      	{dbConn.close();
	         }catch (SQLException x) {
	        	 
	         }
	      }
	
	   }
}

