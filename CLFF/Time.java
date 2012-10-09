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
public abstract class Time {

	public static void checkTime(HttpSession session,HttpServletResponse response) throws IOException
	   {
		
		Connection dbConn = null;
        Statement query = null;
	    ResultSet results = null;
	    
	    UserBean user=(UserBean)session.getAttribute("user");
	    String action=user.getAction();
	    
	    dbConn = DBConn.getConn();
		try{
			query = dbConn.createStatement();
			results = query.executeQuery("select * from deadlines where current_timestamp >= deadline_close"+
					" and current_timestamp <= deadline_open");
			int check = 0;
			while(results.next()){
				check = 1;
				if(action.equals("checkTimeTransfer")){
					((UserBean)session.getAttribute("user")).setSelectionAllowed("NoTransfer");
					response.sendRedirect("SetTransfer.jsp");
				}
				else if(action.equals("checkTimeTeam")){
					((UserBean)session.getAttribute("user")).setSelectionAllowed("NoTeam");
					response.sendRedirect("checkMyTeam.jsp");
				}
				else if(action.equals("checkTimeSelectTeam")){
					((UserBean)session.getAttribute("user")).setSelectionAllowed("NoSelectTeam");
					response.sendRedirect("SetSelectTeam.jsp");
				}
					
			}
			if(check==0){
				if(action.equals("checkTimeTransfer")){
					((UserBean)session.getAttribute("user")).setSelectionAllowed("AllowTransfer");
					response.sendRedirect("SetTransfer.jsp");
				}
				else if(action.equals("checkTimeTeam")){
					((UserBean)session.getAttribute("user")).setSelectionAllowed("AllowTeam");
					response.sendRedirect("checkMyTeam.jsp");
				}
				else if(action.equals("checkTimeSelectTeam")){
					((UserBean)session.getAttribute("user")).setSelectionAllowed("AllowSelectTeam");
					response.sendRedirect("SetSelectTeam.jsp");
				}
			}
		}catch (SQLException e)
	      {
			
			try
	      	{dbConn.close();
	         }catch (SQLException x) {
	        	 
	         }
	      }
	
	   }
}

