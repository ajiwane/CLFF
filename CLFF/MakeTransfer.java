
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
public abstract class MakeTransfer {

	public static void checkMakeTransfer(HttpSession session,HttpServletResponse response) throws IOException
	   {
		PrintWriter out = response.getWriter();
	    
	    UserBean user=(UserBean)session.getAttribute("user");
	    String team_name=user.getTeamname();
	    Vector oldteam=user.getPlayers();
	    Vector newteam=user.getNewplayers();
	    Vector oldteaminorderofnewteam= new Vector();
	    int check=0;
	    for(int i=0;i<15;++i)
	    {
	    	if(((Player)oldteam.get(i)).getPosition().equals("Goalkeeper"))
	    	{
	    		oldteaminorderofnewteam.add(oldteam.get(i));
	    	}
	    }
	    for(int i=0;i<15;++i)
	    {
	    	if(((Player)oldteam.get(i)).getPosition().equals("Defender"))
	    	{
	    		oldteaminorderofnewteam.add(oldteam.get(i));
	    	}
	    }
	    for(int i=0;i<15;++i)
	    {
	    	if(((Player)oldteam.get(i)).getPosition().equals("Midfielder"))
	    	{
	    		oldteaminorderofnewteam.add(oldteam.get(i));
	    	}
	    }
	    for(int i=0;i<15;++i)
	    {
	    	if(((Player)oldteam.get(i)).getPosition().equals("Forward"))
	    	{
	    		oldteaminorderofnewteam.add(oldteam.get(i));
	    	}
	    }
	    
	    for(int i=0;i<15;++i)
	    {
	    	for(int j=0;j<15;++j)
	    	{
	    		if(i!=j)
	    		if(((Player)newteam.get(i)).getClub_name().equals(((Player)newteam.get(j)).getClub_name())
	    				&& ((Player)newteam.get(i)).getJersey_no()==((Player)newteam.get(j)).getJersey_no())
	    		{
	    			check=1;
	    		}
	    	}
	    }
	    
	    
		Connection dbConn = null;
        Statement query = null;
	    ResultSet results = null;
	    
			dbConn = DBConn.getConn();
			try{
				query = dbConn.createStatement();
		int value=0;
				for(int i=0;i<15;++i){
					results=query.executeQuery("select value from Player where club_name='"+
							((Player)newteam.get(i)).getClub_name()+"' and jersey_no="+
							((Player)newteam.get(i)).getJersey_no());
					while(results.next())
					{
						value+=results.getInt(1);
					}
				}
				if(value>100)
				{
					check=2;
				}
				if(check==1)
				{
					user.setErrorMessage("Select All Different Players");
					response.sendRedirect("Transfer.jsp");
				}
				else if(check==2)
				{
					user.setErrorMessage("Total Value must be less than 100m$");
					response.sendRedirect("Transfer.jsp");
				}
				else {
					//out.println("no error");
					Vector changes=new Vector();
					for(int i=0;i<15;++i)
					{
						if(((Player)oldteaminorderofnewteam.get(i)).getClub_name().equals(((Player)newteam.get(i)).getClub_name())
			    				&& ((Player)oldteaminorderofnewteam.get(i)).getJersey_no()==((Player)newteam.get(i)).getJersey_no())
			    		{}
						else{
							Integer tmpi=new Integer(i);
							changes.add(tmpi);
						}
					}
					if(changes.isEmpty())
					{
						//out.println("no changes");
						response.sendRedirect("checkTimeTeam.jsp");
					}
					else
					{
					for(int k=0;k<changes.size();++k)
					{
						int i= ((Integer)changes.get(k)).intValue();
						if(((Player)oldteaminorderofnewteam.get(i)).getPlayer_name().contains("(C)"))
						{
							query.executeUpdate("delete from captainof where team_name='"+team_name+"'");
							query.executeUpdate("update userteam set value=value-"+((Player)oldteaminorderofnewteam.get(i)).getValue()+
									" where team_name='"+team_name+"'");
							query.executeUpdate("insert into captainof values ('"
									+team_name+"','"+((Player)newteam.get(i)).getClub_name()
									+"',"+((Player)newteam.get(i)).getJersey_no()+")");
						}
						else if(((Player)oldteaminorderofnewteam.get(i)).getPlayer_name().contains("(S1)")
								|| ((Player)oldteaminorderofnewteam.get(i)).getPlayer_name().contains("(S2)")
								|| ((Player)oldteaminorderofnewteam.get(i)).getPlayer_name().contains("(S3)")
								|| ((Player)oldteaminorderofnewteam.get(i)).getPlayer_name().contains("(S4)"))
						{
							
							query.executeUpdate("delete from substitute where team_name='"+team_name+"'" +
						" and club_name='"+((Player)oldteaminorderofnewteam.get(i)).getClub_name()
						+"' and jersey_no="+((Player)oldteaminorderofnewteam.get(i)).getJersey_no());
							
							query.executeUpdate("update userteam set value=value-"+((Player)oldteaminorderofnewteam.get(i)).getValue()+
									" where team_name='"+team_name+"'");
							query.executeUpdate("insert into substitute values ('"
									+team_name+"','"+((Player)newteam.get(i)).getClub_name()
									+"',"+((Player)newteam.get(i)).getJersey_no()+")");
						}
						else{
							query.executeUpdate("delete from playing where team_name='"+team_name+"'" +
									" and club_name='"+((Player)oldteaminorderofnewteam.get(i)).getClub_name()
									+"' and jersey_no="+((Player)oldteaminorderofnewteam.get(i)).getJersey_no());
										
										query.executeUpdate("update userteam set value=value-"+((Player)oldteaminorderofnewteam.get(i)).getValue()+
												" where team_name='"+team_name+"'");
										query.executeUpdate("insert into playing values ('"
												+team_name+"','"+((Player)newteam.get(i)).getClub_name()
												+"',"+((Player)newteam.get(i)).getJersey_no()+")");
							}
						
					}
					results=query.executeQuery("select value from userteam where team_name='"+team_name+"'");
					while(results.next())
					{
						user.setValue(results.getFloat(1));
					}
					response.sendRedirect("checkTimeTeam.jsp");
					}
				}
					
			}catch (SQLException e)
		      {try
		      	{dbConn.close();
		         }catch (SQLException x) {}
		      }
	   }
}