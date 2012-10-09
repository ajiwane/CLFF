import java.io.IOException;
import java.sql.Connection;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public  class AddSubScore {

	 AddSubScore(String S){
		Connection dbConn = null;
        Statement query = null;
	    ResultSet results = null;
	    Statement query2 = null;
	    ResultSet results2 = null;
	    Statement query3 = null;
	    ResultSet results3 = null;
	    Statement query4 = null;
	    dbConn = DBConn.getConn();
		try{
			query = dbConn.createStatement();
			query2 = dbConn.createStatement();
			String teamname;
			query.executeUpdate(S);
			results2=query2.executeQuery("select * from userteam");
			while(results2.next()){
				teamname=results2.getString(1);
				int totplayed=0;
				results = query.executeQuery("(select count(*) from userteam u,captainof c,player p"
						+" where u.team_name='"+teamname+"' u.team_name=c.team_name and c.club_name=p.club_name and c.jersey_no=p.jersey_no"
						+" and p.today_played_game=1) + "
						+"(select count(*) from userteam u,playing c,player p"
						+" where u.team_name='"+teamname+"' u.team_name=c.team_name and c.club_name=p.club_name and c.jersey_no=p.jersey_no"
						+" and p.today_played_game=1)");
				while(results.next()){
					totplayed=results.getInt(1);
				}
				if(totplayed < 11){
					int score=0;
					results3=query3.executeQuery("select c.today_score from substitute s,player p,score c "
							+"where s.team_name='"+teamname+"' and s.jersey_no=p.jersey_no and s.jersey_no=c.jersey_no"
							+" and s.club_name=p.club_name and s.club_name=c.club_name and p.today_played_game=1");
					while(results3.next() && totplayed<11){
						score=results3.getInt(1);
						query4.executeUpdate("update userteam set score_today=score_today+"+score+
								" ,score=score+"+score+" where team_name='"+teamname+"'");
						totplayed++;
					}
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
