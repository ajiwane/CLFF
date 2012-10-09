import java.io.IOException;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.*;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


import package1.*;
public abstract class ViewClub {

	public static void checkClub(HttpSession session,HttpServletResponse response) throws IOException
	   {
		String club = ((UserBean)session.getAttribute("user")).getClubview();
		
		Connection dbConn = null;
        Statement query = null;
	    ResultSet results = null;
	    Vector result =new Vector();
	    dbConn = DBConn.getConn();
		try{
			query = dbConn.createStatement();
			results = query.executeQuery("select * from results where hometeam='"+club+"' or awayteam='"+club+"'");
			while(results.next()){
				ResultEntry entry = new ResultEntry();
				entry.setMatchday(results.getString(1));
				entry.setHometeam(results.getString(2));
				entry.setScore(results.getString(4));
				entry.setAwayteam(results.getString(3));
				
				result.add(entry);
			}
			LeagueStandings allresults = new LeagueStandings();
			allresults.setEntries(result);
			session.setAttribute("results",allresults);
			response.sendRedirect("ClubStats.jsp");			
					
		}catch (SQLException e)
	      {
			
			try
	      	{dbConn.close();
	         }catch (SQLException x) {
	        	 
	         }
	      }
	
	   }
}

