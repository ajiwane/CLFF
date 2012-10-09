import java.io.IOException;
import java.sql.Connection;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import package1.Player;
import package1.UserBean;
import java.util.*
;public abstract class FPassword {

	public static void checkFP(HttpSession session,HttpServletResponse response) throws IOException
	   {
		UserBean user=(UserBean)session.getAttribute("user");		
		String login=user.getLogin();
		
		Connection dbConn = null;
        Statement query = null;       
	    ResultSet results = null;
	    
	    if(login==null||login.equals("")){
			((UserBean)session.getAttribute("user")).setErrorMessage("FPloginEmpty");
			response.sendRedirect("ForgotPassword.jsp");
		}
		else{
			dbConn = DBConn.getConn();
			try{
				query = dbConn.createStatement();
				results = query.executeQuery("select question from user_table where user_id = '"+login+"'");
				int check=0;
				while(results.next()){	
						check=1;
						((UserBean)session.getAttribute("user")).setErrorMessage("none");
							((UserBean)session.getAttribute("user")).setQuestion(results.getString(1));
							((UserBean)session.getAttribute("user")).setLogin("");
							response.sendRedirect("SecretQuestion.jsp");
						
										
				}
				if(check==0){
					((UserBean)session.getAttribute("user")).setErrorMessage("FPloginIncorrect");
					((UserBean)session.getAttribute("user")).setLogin("");
					response.sendRedirect("ForgotPassword.jsp");
				}
				
			}catch (SQLException e)
		      {try
		      	{dbConn.close();
		         }catch (SQLException x) {}
		      }
		}
	 
	   }
	
}

