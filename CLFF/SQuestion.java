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
;public abstract class SQuestion {

	public static void checkSQ(HttpSession session,HttpServletResponse response) throws IOException
	   {
		UserBean user=(UserBean)session.getAttribute("user");		
		String login=user.getLogin();
		String question = user.getQuestion();
		String answer = user.getAnswer();
		Connection dbConn = null;
        Statement query = null;       
	    ResultSet results = null;
	    
	    if(answer==null||answer.equals("")){
			((UserBean)session.getAttribute("user")).setErrorMessage("SQanswerEmpty");
			response.sendRedirect("SecretQuestion.jsp");
		}
		else{
			dbConn = DBConn.getConn();
			try{
				query = dbConn.createStatement();
				results = query.executeQuery("select password from user_table where user_id = '"+login+"'"+
						" and answer='"+MD5.toMD5(question+answer)+"'");
				int check=0;
				while(results.next()){
						check=1;
						
							String npassword = RandomString.randomstring();//make this random
							Statement query2 = dbConn.createStatement();
							query2.executeUpdate("update user_table set password = '"+
									MD5.toMD5(login+npassword)+"' where user_id = '"+login+"'");
							
							((UserBean)session.getAttribute("user")).setErrorMessage("none");
							((UserBean)session.getAttribute("user")).setPassword(npassword);
							response.sendRedirect("NewPassword.jsp");
						
										
				}
				if(check==0){
					((UserBean)session.getAttribute("user")).setErrorMessage("SQanswerIncorrect");
					response.sendRedirect("SecretQuestion.jsp");
				}
				
			}catch (SQLException e)
		      {try
		      	{dbConn.close();
		         }catch (SQLException x) {}
		      }
		}
	 
	   }
	
}

