import java.io.IOException;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.*;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


import package1.*;
public abstract class Results {

	public static void checkResults(HttpSession session,HttpServletResponse response) throws IOException
	   {
		
		
		Connection dbConn = null;
        Statement query = null;
	    ResultSet results = null;
	    
	    UserBean user=(UserBean)session.getAttribute("user");	
	    String matchday = user.getMatchday();
	    Vector matchday_results = new Vector();
	    dbConn = DBConn.getConn();
		try{
			query = dbConn.createStatement();
			results = query.executeQuery("select * from results where matchday='"+matchday+"'");
			while(results.next()){
				ResultEntry entry = new ResultEntry();
				entry.setHometeam(results.getString(2));
				entry.setScore(results.getString(4));
				entry.setAwayteam(results.getString(3));
				matchday_results.add(entry);
			}
			LeagueStandings allresults = new LeagueStandings();
			allresults.setEntries(matchday_results);
			session.setAttribute("allresults",allresults);
			response.sendRedirect("ShowResults.jsp");		
					
		}catch (SQLException e)
	      {
			
			try
	      	{dbConn.close();
	         }catch (SQLException x) {
	        	 
	         }
	      }
	
	   }
}

