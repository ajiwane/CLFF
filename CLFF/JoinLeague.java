
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
public abstract class JoinLeague {

	public static void checkJoin(HttpSession session,HttpServletResponse response) throws IOException
	   {
		PrintWriter out = response.getWriter();
	    
	    UserBean user=(UserBean)session.getAttribute("user");
	    String teamname = user.getTeamname();
		String lname=user.getJoinLeagueName();
		String lid = user.getJoinLeagueID();
		
		Connection dbConn = null;
        Statement query = null;
	    ResultSet results = null;
		int check1 = 0;
		if(lname==null||lname.equals("")){
			check1 = 1;
			((UserBean)session.getAttribute("user")).setErrorMessage("joinLeagueNameEmpty");
			response.sendRedirect("JoinLeague.jsp");
		}
		else {
			dbConn = DBConn.getConn();
			try{
				query = dbConn.createStatement();
				int flag = 0;
				results = query.executeQuery("select * from private where league_name = '"
						+lname+"'");
				while(results.next()){
					flag = 1;
				}
				if(flag==0){
					check1 = 1;
					((UserBean)session.getAttribute("user")).setErrorMessage("leagueNotExists");
					response.sendRedirect("JoinLeague.jsp");
				}
			}catch (SQLException e)
		      {try
		      	{dbConn.close();
		         }catch (SQLException x) {}
		      }

		}
		if(check1 == 0){
			
		if(lid==null||lid.equals("")){
			
			((UserBean)session.getAttribute("user")).setErrorMessage("joinLeagueIDEmpty");
			response.sendRedirect("JoinLeague.jsp");
		}
		else{
			dbConn = DBConn.getConn();
			try{
				query = dbConn.createStatement();				
				results = query.executeQuery("select league_id from private where league_name = '"
						+lname+"'");
				int flag = 0;
				while(results.next()){
					if(!lid.equals(results.getString(1))){
						flag = 1;
						((UserBean)session.getAttribute("user")).setErrorMessage("joinLeagueIDIncorrect");
						response.sendRedirect("JoinLeague.jsp");
					}
				}
				if(flag==0){
					query.executeUpdate("insert into belongsto values ('"+teamname+"','"+lname+"',1)");
					
					Vector leagues = user.getLeagues();
					leagues.add(lname);
					user.setLeagues(leagues);
					session.setAttribute("user", user);
					((UserBean)session.getAttribute("user")).setErrorMessage("LeagueJoined");
					response.sendRedirect("Home.jsp");
				}
				
			}catch (SQLException e)
		      {try
		         {dbConn.close();
		         }catch (SQLException x) {}
		      }
		}
		
		}
	  
	   }
}



