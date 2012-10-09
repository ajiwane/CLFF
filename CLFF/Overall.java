import java.io.IOException;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.*;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


import package1.*;
public abstract class Overall {

	public static void checkOverall(HttpSession session,HttpServletResponse response) throws IOException
	   {
		
		Connection dbConn = null;
        Statement query = null;
	    ResultSet results = null;
	    
	    Vector teams= new Vector();
	    dbConn = DBConn.getConn();
		try{
			query = dbConn.createStatement();
			results = query.executeQuery("select A.team_name,A.score,B.league_rank,C.user_id from userteam A,belongsto B,owns C "+
					"where A.team_name = B.team_name and B.team_name = C.team_name"+
					" and B.league_name='Overall' order by league_rank");
			while(results.next()){
				LeagueEntry entry = new LeagueEntry();
				entry.setTeam_name(results.getString(1));
				entry.setScore(results.getInt(2));
				entry.setLeague_rank(results.getInt(3));
				entry.setUser_id(results.getString(4));
				
				teams.add(entry);
			}
			LeagueStandings overall = new LeagueStandings();
			overall.setEntries(teams);
			session.setAttribute("overall",overall);
			response.sendRedirect("ShowOverall.jsp");				
					
		}catch (SQLException e)
	      {
			
			try
	      	{dbConn.close();
	         }catch (SQLException x) {
	        	 
	         }
	      }
	
	   }
}

