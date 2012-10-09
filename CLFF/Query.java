import java.io.*;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;


import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class Query extends HttpServlet {

	private static final long serialVersionUID = 1L;	

	public void doGet(HttpServletRequest request, HttpServletResponse response)
	throws ServletException, IOException {
		// Stream to read file
		FileInputStream fin;		

		try
		{
		    // Open an input stream
			String filename= new String();
			filename="D:\\Player.csv";
		    
			fin = new FileInputStream (filename);

		    // Read a line of text
			
			
			String finalquery="";
			for(int i=0;i<816;++i)
			{
				String query="update Player set ";
				String s=new DataInputStream(fin).readLine();
				int comma=s.indexOf(",", 0);
				String club=s.substring(0, comma);
				int nextcomma=s.indexOf(",", comma+1);
				int jersey_no=Integer.parseInt(s.substring(comma+1, nextcomma));
				nextcomma=s.indexOf(",", nextcomma+1);
				nextcomma=s.indexOf(",", nextcomma+1);
				nextcomma=s.indexOf(",", nextcomma+1);
				comma=nextcomma;
				nextcomma=s.indexOf(",", nextcomma+1);
				query+="today_played_game = "+s.substring(comma+1, nextcomma)+",";
				comma=nextcomma;
				nextcomma=s.indexOf(",", nextcomma+1);
				query+="today_played_60_min = "+s.substring(comma+1, nextcomma)+",";
				comma=nextcomma;
				nextcomma=s.indexOf(",", nextcomma+1);
				query+="today_goal_scored = "+s.substring(comma+1, nextcomma)+",";
				comma=nextcomma;
				nextcomma=s.indexOf(",", nextcomma+1);
				query+="today_goal_assist = "+s.substring(comma+1, nextcomma)+",";
				comma=nextcomma;
				nextcomma=s.indexOf(",", nextcomma+1);
				query+="today_no_conceed = "+s.substring(comma+1, nextcomma)+",";
				
				comma=nextcomma;
				nextcomma=s.indexOf(",", nextcomma+1);
				query+="today_penalty_saved = "+s.substring(comma+1, nextcomma)+",";
				comma=nextcomma;
				nextcomma=s.indexOf(",", nextcomma+1);
				query+="today_penalty_created = "+s.substring(comma+1, nextcomma)+",";
				comma=nextcomma;
				nextcomma=s.indexOf(",", nextcomma+1);
				query+="today_penalty_missed = "+s.substring(comma+1, nextcomma)+",";
				comma=nextcomma;
				nextcomma=s.indexOf(",", nextcomma+1);
				query+="today_2_goal_conceed = "+s.substring(comma+1, nextcomma)+",";
				comma=nextcomma;
				nextcomma=s.indexOf(",", nextcomma+1);
				query+="today_yellow_card = "+s.substring(comma+1, nextcomma)+",";
				comma=nextcomma;
				nextcomma=s.indexOf(",", nextcomma+1);
				query+="today_red_card = "+s.substring(comma+1, nextcomma)+",";
				comma=nextcomma;
				nextcomma=s.indexOf(",", nextcomma+1);
				query+="today_3_saves = "+s.substring(comma+1, nextcomma)+",";
				query+="today_score = "+s.substring(nextcomma+1);
				query+=" where club_name = '"+club+"' and jersey_no = "+jersey_no+";";
				finalquery+=query;
				
		    //System.out.print( query );
			}
		    // Close our input stream
		    fin.close();
		   /* FileOutputStream fout;		

			try
			{
			    // Open an output stream
				String outputfile="D:\\Player.sql";
			    fout = new FileOutputStream (outputfile);

			    // Print a line of text
			    new PrintStream(fout).println (finalquery);

			    // Close our output stream
			    fout.close();		
			}
			// Catches any error conditions
			catch (IOException e)
			{
				System.err.println ("Unable to write to file");
				System.exit(-1);
			}*/
		   // new AddSubScore(finalquery);
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
				query.executeUpdate(finalquery);
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
		// Catches any error conditions
		catch (IOException e)
		{
			System.err.println ("Unable to read from file");
			System.exit(-1);
		}
	}	
	public void doPost(HttpServletRequest request, HttpServletResponse response)
	throws ServletException, IOException {
		doGet(request,response);
	}
}