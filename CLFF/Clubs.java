import java.io.IOException;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.*;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.PrintWriter;

import package1.*;
public abstract class Clubs {

	public static void checkClubs(HttpSession session,HttpServletResponse response) throws IOException
	   {
		
		PrintWriter out = response.getWriter();
		Connection dbConn = null;
        Statement query = null;
	    ResultSet results = null;
	    Vector clubs =new Vector();
	    dbConn = DBConn.getConn();
		try{
			query = dbConn.createStatement();
			results = query.executeQuery("select * from club");
			while(results.next()){
				ClubStats entry = new ClubStats();
				entry.setClub(results.getString(1));
				out.println(results.getString(1));
				entry.setLink(results.getString(2));
				clubs.add(entry);
			}
			LeagueStandings allclubs = new LeagueStandings();
			allclubs.setEntries(clubs);
			session.setAttribute("clubs",allclubs);
			UserBean user=(UserBean)session.getAttribute("user");		
			String action=user.getAction();
			if(action.equals("showClubs1"))
				response.sendRedirect("ClubStats.jsp");
			else if(action.equals("showClubs2"))
				response.sendRedirect("PlayerStats.jsp");
			else if(action.equals("showClubs3Register"))
				response.sendRedirect("Register.jsp");
					
		}catch (SQLException e)
	      {
			
			try
	      	{dbConn.close();
	         }catch (SQLException x) {
	        	 
	         }
	      }
	
	   }
}

