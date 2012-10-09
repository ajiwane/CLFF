import java.io.IOException;
import java.sql.Connection;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import package1.UserBean;

public abstract class Register {

	public static void checkRegister(HttpSession session,HttpServletResponse response) throws IOException
	   {
		UserBean user=(UserBean)session.getAttribute("user");		
		String login=user.getLogin();
		String paswd=user.getPassword();
		String cpaswd=user.getCpassword();
		String club=user.getClub();
		String question=user.getQuestion();
		String answer=user.getAnswer();
		String fname=user.getFname();
		String lname=user.getLname();
		String teamname=user.getTeamname();
		
		Connection dbConn = null;
        Statement query = null;
	    ResultSet results = null;
		int check1 = 0;
		if(login==null||login.equals("")){
			check1 = 1;
			((UserBean)session.getAttribute("user")).setErrorMessage("regloginEmpty");
			response.sendRedirect("Register.jsp");
		}
		else {
			dbConn = DBConn.getConn();
			try{
				query = dbConn.createStatement();
				results = query.executeQuery("select * from user_table where user_id = '"+login+"'");
				while(results.next()){
					check1 = 1;
						((UserBean)session.getAttribute("user")).setErrorMessage("userExists");
						((UserBean)session.getAttribute("user")).setLogin("");
						response.sendRedirect("Register.jsp");
				}
			}catch (SQLException e)
		      {try
		      	{dbConn.close();
		         }catch (SQLException x) {}
		      }

		}
		if(check1 == 0){
			int check2 = 0;
		if(paswd==null||paswd.equals("")){
			check2 = 1;
			((UserBean)session.getAttribute("user")).setErrorMessage("regpaswdEmpty");
			((UserBean)session.getAttribute("user")).setLogin("");
			response.sendRedirect("Register.jsp");
		}
		else if(cpaswd==null||cpaswd.equals("")){
			check2 = 1;
			((UserBean)session.getAttribute("user")).setErrorMessage("cpaswdEmpty");
			((UserBean)session.getAttribute("user")).setLogin("");
			response.sendRedirect("Register.jsp");
		}
		else if(!paswd.equals(cpaswd)){
			check2 = 1;
			((UserBean)session.getAttribute("user")).setErrorMessage("paswdUnequal");
			((UserBean)session.getAttribute("user")).setLogin("");
			response.sendRedirect("Register.jsp");
		}
		else if(teamname==null||teamname.equals("")){
			check2 = 1;
			((UserBean)session.getAttribute("user")).setErrorMessage("teamEmpty");
			((UserBean)session.getAttribute("user")).setLogin("");
			response.sendRedirect("Register.jsp");
		}
		else{
			dbConn = DBConn.getConn();
			try{
				query = dbConn.createStatement();
				results = query.executeQuery("select * from userteam where team_name = '"+teamname+"'");
				while(results.next()){
					check2 = 1;
						((UserBean)session.getAttribute("user")).setErrorMessage("teamExists");
						((UserBean)session.getAttribute("user")).setLogin("");
						response.sendRedirect("Register.jsp");
				}
			}catch (SQLException e)
		      {try
		      	{dbConn.close();
		         }catch (SQLException x) {}
		      }
		}
		if(check2==0){
		if(fname==null||fname.equals("")){
			((UserBean)session.getAttribute("user")).setErrorMessage("fnameEmpty");
			((UserBean)session.getAttribute("user")).setLogin("");
			response.sendRedirect("Register.jsp");
		}
		else if(lname==null||lname.equals("")){
			((UserBean)session.getAttribute("user")).setErrorMessage("lnameEmpty");
			((UserBean)session.getAttribute("user")).setLogin("");
			response.sendRedirect("Register.jsp");
		}
		else if(club==null||club.equals("")){
			((UserBean)session.getAttribute("user")).setErrorMessage("clubEmpty");
			((UserBean)session.getAttribute("user")).setLogin("");
			response.sendRedirect("Register.jsp");
		}
		else if(question==null||question.equals("")){
			((UserBean)session.getAttribute("user")).setErrorMessage("questionEmpty");
			((UserBean)session.getAttribute("user")).setLogin("");
			response.sendRedirect("Register.jsp");
		}
		else if(answer==null||answer.equals("")){
			((UserBean)session.getAttribute("user")).setErrorMessage("answerEmpty");
			((UserBean)session.getAttribute("user")).setLogin("");
			response.sendRedirect("Register.jsp");
		}
		else{
			dbConn = DBConn.getConn();
			try{
				query = dbConn.createStatement();
				query.executeUpdate("insert into user_table values ('"+login+"','"+MD5.toMD5(login+paswd)+"','"
						+fname+"','"+lname+"','"+question+"','"+MD5.toMD5(question+answer)+"')");
				
				query.executeUpdate("insert into userteam values ('"+teamname+"',0,0)");
				query.executeUpdate("insert into owns values ('"+login+"','"+teamname+"')");
				query.executeUpdate("insert into favourite values ('"+login+"','"+club+"')");
			
				((UserBean)session.getAttribute("user")).setErrorMessage("registered");
				((UserBean)session.getAttribute("user")).setLogin("");
				response.sendRedirect("Login.jsp");
			}catch (SQLException e)
		      {
				try
		         {dbConn.close();
		         }catch (SQLException x) {}
		      }
		}
		}
		}
	  
	   }
}

