
import java.io.IOException;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.*;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import package1.*;
public abstract class CreateLeague {

	public static void checkCreate(HttpSession session,HttpServletResponse response) throws IOException
	   {
	    
	    UserBean user=(UserBean)session.getAttribute("user");
	    String userid=user.getLogin();
	    String teamname = user.getTeamname();
		String lname=user.getCreateLeagueName();
		String lid = user.getCreateLeagueID();
		String lcid = user.getCreateLeaguecID();
		
		Connection dbConn = null;
        Statement query = null;
	    ResultSet results = null;
		int check1 = 0;
		if(lname==null||lname.equals("")){
			check1 = 1;
			((UserBean)session.getAttribute("user")).setErrorMessage("createLeagueNameEmpty");
			response.sendRedirect("CreateLeague.jsp");
		}
		else {
			dbConn = DBConn.getConn();
			try{
				query = dbConn.createStatement();
				results = query.executeQuery("select * from league where league_name = '"
						+lname+"'");
				while(results.next()){
					check1 = 1;
						((UserBean)session.getAttribute("user")).setErrorMessage("leagueExists");
						response.sendRedirect("CreateLeague.jsp");
				}
			}catch (SQLException e)
		      {try
		      	{dbConn.close();
		         }catch (SQLException x) {}
		      }

		}
		if(check1 == 0){
			
		if(lid==null||lid.equals("")){
			
			((UserBean)session.getAttribute("user")).setErrorMessage("createLeagueIDEmpty");
			response.sendRedirect("CreateLeague.jsp");
		}
		else if(lcid==null||lcid.equals("")){
			
			((UserBean)session.getAttribute("user")).setErrorMessage("createLeaguecIDEmpty");
			response.sendRedirect("CreateLeague.jsp");
		}
		else if(!lid.equals(lcid)){
			
			((UserBean)session.getAttribute("user")).setErrorMessage("createLeagueIDUnequal");
			response.sendRedirect("CreateLeague.jsp");
		}
		else{
			dbConn = DBConn.getConn();
			try{
				query = dbConn.createStatement();
				query.executeUpdate("insert into league values ('"+lname+"')");				
				query.executeUpdate("insert into private values ('"+lname+"','"+lid+"')");
				
				query.executeUpdate("insert into creates values ('"+lname+"','"+userid+"')");
				query.executeUpdate("insert into belongsto values ('"+teamname+"','"+lname+"',1)");
				
				Vector leagues = user.getLeagues();
				leagues.add(lname);
				user.setLeagues(leagues);
				session.setAttribute("user", user);
				((UserBean)session.getAttribute("user")).setErrorMessage("LeagueCreated");
				response.sendRedirect("Home.jsp");
			}catch (SQLException e)
		      {try
		         {dbConn.close();
		         }catch (SQLException x) {}
		      }
		}
		
		}
	  
	   }
}



