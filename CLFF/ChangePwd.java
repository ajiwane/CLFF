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
;public abstract class ChangePwd {

	public static void checkCP(HttpSession session,HttpServletResponse response) throws IOException
	   {
		UserBean user=(UserBean)session.getAttribute("user");		
		String login=user.getLogin();
		String passwd = user.getPassword();
		String cpaswd = user.getCpassword();
		
		Connection dbConn = null;
        Statement query = null;       
	    ResultSet results = null;
	    
	    if(passwd==null||passwd.equals("")){
			((UserBean)session.getAttribute("user")).setErrorMessage("CPpaswdEmpty");
			((UserBean)session.getAttribute("user")).setLogin("");
			response.sendRedirect("NewPassword.jsp");
		}
	    else if(cpaswd==null||cpaswd.equals("")){
			
			((UserBean)session.getAttribute("user")).setErrorMessage("CPcpaswdEmpty");
			((UserBean)session.getAttribute("user")).setLogin("");
			response.sendRedirect("NewPassword.jsp");
		}
		else if(!passwd.equals(cpaswd)){
			
			((UserBean)session.getAttribute("user")).setErrorMessage("CPpaswdUnequal");
			((UserBean)session.getAttribute("user")).setLogin("");
			response.sendRedirect("NewPassword.jsp");
		}
		else{
			dbConn = DBConn.getConn();
			try{
				query = dbConn.createStatement();
				query.executeUpdate("update user_table set password = '"+
						MD5.toMD5(login+passwd)+"' where user_id = '"+login+"'");
				
							((UserBean)session.getAttribute("user")).setErrorMessage("pwdchanged");
							((UserBean)session.getAttribute("user")).setLogin("");
							response.sendRedirect("Login.jsp");
						
				
			}catch (SQLException e)
		      {try
		      	{dbConn.close();
		         }catch (SQLException x) {}
		      }
		}
	 
	   }
	
}

