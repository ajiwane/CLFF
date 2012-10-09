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
public abstract class Change {

	public static void checkChange(HttpSession session,HttpServletResponse response) throws IOException
	   {
		PrintWriter out = response.getWriter();
		Connection dbConn = null;
        Statement query = null;
	    ResultSet results = null;
	    UserBean user=(UserBean)session.getAttribute("user");		
		int from= Integer.parseInt(user.getFrom_change());
		int to= Integer.parseInt(user.getTo_change());
	    Vector players= user.getPlayers();
	    String team_name=user.getTeamname();
	    
	    
	    String from_club=((Player)players.get(from)).getClub_name();
	    int from_jersey=((Player)players.get(from)).getJersey_no();
	    String to_club=((Player)players.get(to)).getClub_name();
	    int to_jersey=((Player)players.get(to)).getJersey_no();
	    float from_value=((Player)players.get(from)).getValue();
	    float to_value=((Player)players.get(to)).getValue();
	    dbConn = DBConn.getConn();
		try{
			
			query = dbConn.createStatement();
			
			if(from==0)
			{
				query.executeUpdate("delete from captainof where team_name='"+team_name+"'");
				query.executeUpdate("update userteam set value=value-"+(from_value+to_value)+" where team_name='"+team_name+"'");
				query.executeUpdate("delete from playing where team_name='"
						+team_name+"' and club_name='"+to_club+"' and jersey_no="+to_jersey);
				query.executeUpdate("insert into captainof values ('"
						+team_name+"','"+to_club+"',"+to_jersey+")");
				query.executeUpdate("insert into playing values ('"+team_name+"','"+from_club+"',"+from_jersey+")");
			}
			else{
				query.executeUpdate("delete from substitute where team_name='"+team_name+"'" +
						" and club_name='"+from_club+"' and jersey_no="+from_jersey);
				query.executeUpdate("update userteam set value=value-"+(from_value+to_value)+" where team_name='"+team_name+"'");
				query.executeUpdate("delete from playing where team_name='"
						+team_name+"' and club_name='"+to_club+"' and jersey_no="+to_jersey);
				query.executeUpdate("insert into substitute values ('"+team_name+"','"+to_club+"',"+to_jersey+")");
				query.executeUpdate("insert into playing values ('"+team_name+"','"+from_club+"',"+from_jersey+")");
			}
			
			response.sendRedirect("checkMyTeam.jsp");				
					
		}catch (SQLException e)
	      {
			out.println(e);
			try
	      	{dbConn.close();
	         }catch (SQLException x) {
	        	 
	         }
	      }
	
	   }
}

