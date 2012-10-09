
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
public abstract class MakeTeam {

	public static void checkMakeTeam(HttpSession session,HttpServletResponse response) throws IOException
	   {
		PrintWriter out = response.getWriter();
	    
	    UserBean user=(UserBean)session.getAttribute("user");
	    String team_name=user.getTeamname();
	    Vector newteam=user.getNewplayers();
	    int check=0;
	    
	    
	    for(int i=0;i<15;++i)
	    {
	    	for(int j=0;j<15;++j)
	    	{
	    		if(i!=j)
	    		if(((Player)newteam.get(i)).getClub_name().equals(((Player)newteam.get(j)).getClub_name())
	    				&& ((Player)newteam.get(i)).getJersey_no()==((Player)newteam.get(j)).getJersey_no())
	    		{
	    			check=1;
	    		}
	    	}
	    }
	    
	    
		Connection dbConn = null;
        Statement query = null;
	    ResultSet results = null;
	    
			dbConn = DBConn.getConn();
			try{
				query = dbConn.createStatement();
		int value=0;
				for(int i=0;i<15;++i){
					results=query.executeQuery("select value from Player where club_name='"+
							((Player)newteam.get(i)).getClub_name()+"' and jersey_no="+
							((Player)newteam.get(i)).getJersey_no());
					while(results.next())
					{
						value+=results.getInt(1);
					}
				}
				if(value>100)
				{
					check=2;
				}
				if(check==1)
				{
					user.setErrorMessage("Select All Different Players");
					response.sendRedirect("SelectTeam.jsp");
				}
				else if(check==2)
				{
					user.setErrorMessage("Total Value must be less than 100m$");
					response.sendRedirect("SelectTeam.jsp");
				}
				else {
					query.executeUpdate("insert into captainof values ('"
							+team_name+"','"+((Player)newteam.get(0)).getClub_name()
							+"',"+((Player)newteam.get(0)).getJersey_no()+")");
					query.executeUpdate("insert into substitute values ('"
							+team_name+"','"+((Player)newteam.get(1)).getClub_name()
							+"',"+((Player)newteam.get(1)).getJersey_no()+")");
					
					for(int k=2;k<6;++k)
					{
							query.executeUpdate("insert into playing values ('"
									+team_name+"','"+((Player)newteam.get(k)).getClub_name()
									+"',"+((Player)newteam.get(k)).getJersey_no()+")");
					}
					query.executeUpdate("insert into substitute values ('"
							+team_name+"','"+((Player)newteam.get(6)).getClub_name()
							+"',"+((Player)newteam.get(6)).getJersey_no()+")");
					for(int k=7;k<11;++k)
					{
							query.executeUpdate("insert into playing values ('"
									+team_name+"','"+((Player)newteam.get(k)).getClub_name()
									+"',"+((Player)newteam.get(k)).getJersey_no()+")");
					}
					query.executeUpdate("insert into substitute values ('"
							+team_name+"','"+((Player)newteam.get(11)).getClub_name()
							+"',"+((Player)newteam.get(11)).getJersey_no()+")");
					for(int k=12;k<14;++k)
					{
							query.executeUpdate("insert into playing values ('"
									+team_name+"','"+((Player)newteam.get(k)).getClub_name()
									+"',"+((Player)newteam.get(k)).getJersey_no()+")");
					}
					query.executeUpdate("insert into substitute values ('"
							+team_name+"','"+((Player)newteam.get(14)).getClub_name()
							+"',"+((Player)newteam.get(14)).getJersey_no()+")");
					
					results=query.executeQuery("select value from userteam where team_name='"+team_name+"'");
					while(results.next())
					{
						user.setValue(results.getFloat(1));
					}
					response.sendRedirect("checkTimeTeam.jsp");
					}
				
					
			}catch (SQLException e)
		      {try
		      	{dbConn.close();
		         }catch (SQLException x) {}
		      }
	   }
}