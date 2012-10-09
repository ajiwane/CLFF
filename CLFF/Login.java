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
;public abstract class Login {

	public static void checkLogin(HttpSession session,HttpServletResponse response) throws IOException
	   {
		UserBean user=(UserBean)session.getAttribute("user");		
		String login=user.getLogin();
		String paswd=user.getPassword();
		
		Connection dbConn = null;
        Statement query = null;
       
	    ResultSet results = null;
	    
	    if(login==null||login.equals("")){
			((UserBean)session.getAttribute("user")).setErrorMessage("loginEmpty");
			((UserBean)session.getAttribute("user")).setLogin("");
			response.sendRedirect("Login.jsp");
		}
		else if(paswd==null||paswd.equals("")){
			((UserBean)session.getAttribute("user")).setErrorMessage("paswdEmpty");
			((UserBean)session.getAttribute("user")).setLogin("");
			response.sendRedirect("Login.jsp");
		}
		else{
			dbConn = DBConn.getConn();
			try{
				query = dbConn.createStatement();
				results = query.executeQuery("select password from user_table where user_id = '"+login+"'");
				int check=0;
				while(results.next()){	
						check=1;
						if(!MD5.toMD5(login+paswd).equals(results.getString(1))){
							((UserBean)session.getAttribute("user")).setErrorMessage("paswdIncorrect");
							((UserBean)session.getAttribute("user")).setLogin("");
							response.sendRedirect("Login.jsp");
						}
						else{
							session.setAttribute("user",makeUser(dbConn,login));
							((UserBean)session.getAttribute("user")).setErrorMessage("none");
							response.sendRedirect("Home.jsp");
						}					
				}
				if(check==0){
					((UserBean)session.getAttribute("user")).setErrorMessage("loginIncorrect");
					((UserBean)session.getAttribute("user")).setLogin("");
					response.sendRedirect("Login.jsp");
				}
				
			}catch (SQLException e)
		      {try
		      	{dbConn.close();
		         }catch (SQLException x) {}
		      }
		}
	 
	   }
	public static UserBean makeUser(Connection dbConn, String login){
		UserBean user=new UserBean();
		user.setAction("Login");
		
		try{
			Statement query = dbConn.createStatement();
			Statement query1 = dbConn.createStatement();
		    Statement query2 = dbConn.createStatement();
			ResultSet results1 = null;
		    ResultSet results2 = null;
		    int check=0;
			Vector players= new Vector();		    
		    ResultSet results = query.executeQuery("select * from user_table where user_id='"+login+"'");
			while(results.next()){
				user.setLogin(results.getString(1));
				user.setPassword(results.getString(2));
				user.setCpassword(results.getString(2));
				user.setFname(results.getString(3));
				user.setLname(results.getString(4));
				user.setQuestion(results.getString(5));
				user.setAnswer(results.getString(6));
			}
			
			results = query.executeQuery("select * from favourite where user_id='"+login+"'");
			String club="";
			while(results.next()){
				club = results.getString(2);
				user.setClub(club);				
			}
			
			results = query.executeQuery("select * from owns where user_id='"+login+"'");
			String teamname="";
			while(results.next()){
				teamname = results.getString(2);
				user.setTeamname(teamname);
			}
			
			results = query.executeQuery("select * from belongsto where team_name='"+teamname
					+"' and league_name not in('Overall','Today','"+club+"')");
			Vector leagues=new Vector();
			while(results.next()){
				leagues.addElement(results.getString(2));
			}
			user.setLeagues(leagues);
			
			results = query.executeQuery("select * from userteam where team_name='"+teamname+"'");
			while(results.next()){
				user.setScore(results.getInt(2));
				user.setValue(results.getFloat(3));
				user.setScore_today(results.getInt(4));
			}
			
			results = query.executeQuery("select league_rank from belongsto where team_name='"+teamname
					+"' and league_name = 'Overall'");
			while(results.next()){
				user.setOverall_rank(results.getInt(1));				
			}
			
			results = query.executeQuery("select club_name,jersey_no from captainof where team_name = '"
					+teamname+"'");
			
			while(results.next()){
				
				check=1;
				String club_name=results.getString(1);
				
				int jersey_no=results.getInt(2);
				
				results1 = query1.executeQuery("select * from player where jersey_no = '"
						+jersey_no+"' and club_name='"+club_name+"'");
				
				Player captain= new Player();
				
				while(results1.next()){
					String tmpclub_name=results1.getString(1);
					captain.setClub_name(tmpclub_name);
					int tmpjersey_no=results1.getInt(2);
					captain.setJersey_no(tmpjersey_no);
					
					captain.setPlayer_name(results1.getString(3)+"(C)");
					
					captain.setPosition(results1.getString(4));
					
					captain.setValue(results1.getFloat(5));
					
					if(results1.getInt(6)==1)
					{
						captain.setToday_played("YES");
						results2 = query2.executeQuery("select today_score,total_score from score where jersey_no = '"
								+tmpjersey_no+"' and club_name='"+tmpclub_name+"'");
						while(results2.next())
						{
							captain.setToday_score(2*(results2.getInt(1)));
							captain.setTotal_score(results2.getInt(2));
						}
					}
					else
					{
						captain.setToday_played("NO");
						captain.setToday_score(0);
					}
				}
				players.add(captain);
			}
			
			
			if(check==1)
			{
				results = query.executeQuery("select club_name,jersey_no from playing where team_name = '"
						+teamname+"'");
				while(results.next())
				{
					String club_name=results.getString(1);
					int jersey_no=results.getInt(2);
					results1 = query1.executeQuery("select * from player where jersey_no = '"
							+jersey_no+"' and club_name='"+club_name+"'");
					Player player= new Player();
					while(results1.next()){
						String tmpclub_name=results1.getString(1);
						player.setClub_name(tmpclub_name);
						int tmpjersey_no=results1.getInt(2);
						player.setJersey_no(tmpjersey_no);
						player.setPlayer_name(results1.getString(3));
						player.setPosition(results1.getString(4));
						player.setValue(results1.getFloat(5));
						if(results1.getInt(6)==1)
						{
							player.setToday_played("YES");
							results2 = query2.executeQuery("select today_score,total_score from score where jersey_no = '"
									+tmpjersey_no+"' and club_name='"+tmpclub_name+"'");
							while(results2.next())
							{
								player.setToday_score(results2.getInt(1));
								player.setTotal_score(results2.getInt(2));
							}
							//player.setToday_score();
						}
						else
						{
							player.setToday_played("NO");
							player.setToday_score(0);
						}
					}
					players.add(player);					
				}
				
				results = query.executeQuery("select club_name,jersey_no from substitute where team_name = '"
						+teamname+"'");
				int c=0;
				while(results.next())
				{
					String club_name=results.getString(1);
					int jersey_no=results.getInt(2);
					results1 = query1.executeQuery("select * from player where jersey_no = '"
							+jersey_no+"' and club_name='"+club_name+"'");
					Player sub= new Player();
					
					while(results1.next()){
						++c;
						String tmpclub_name=results1.getString(1);
						sub.setClub_name(tmpclub_name);
						int tmpjersey_no=results1.getInt(2);
						sub.setJersey_no(tmpjersey_no);
						sub.setPlayer_name(results1.getString(3)+"(S"+Integer.toString(c)+")");
						sub.setPosition(results1.getString(4));
						sub.setValue(results1.getFloat(5));
						if(results1.getInt(6)==1)
						{
							sub.setToday_played("YES");
							results2 = query2.executeQuery("select today_score,total_score from score where jersey_no = '"
									+tmpjersey_no+"' and club_name='"+tmpclub_name+"'");
							while(results2.next())
							{
								sub.setToday_score(results2.getInt(1));
								sub.setTotal_score(results2.getInt(2));
							}
						}
						else
						{
							sub.setToday_played("NO");
							sub.setToday_score(0);
						}
					}
					players.add(sub);					
				}
				user.setPlayers(players);

			}
			
			results=query.executeQuery("select a.deadline_close from deadlines a where a.deadline_close > current_timestamp "+
					"and a.deadline_close <= all (select b.deadline_close from deadlines b where b.deadline_close > current_timestamp)");
			
			if(results.next()){
				user.setDeadline(results.getTimestamp(1).toString().substring(0, 19));
			}
			
				
		}catch (SQLException e)
	      {try
	      	{dbConn.close();
	         }catch (SQLException x) {}
	      }
		return user;
	}

}

