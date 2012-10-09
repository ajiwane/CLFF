<jsp:useBean id="user" class="package1.UserBean" scope="session"/>
<jsp:setProperty name="user" property="*"/>
<jsp:useBean id="players" class="package1.LeagueStandings" scope="session"/>
<jsp:setProperty name="players" property="*"/>
<jsp:useBean id="clubs" class="package1.LeagueStandings" scope="session"/>
<jsp:setProperty name="clubs" property="*"/>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">

   <head>
      <title>Champions League Fantasy Football | Home</title>
	<meta http-equiv="Content-Language" content="English" />
	<meta http-equiv="content-type" content="text/html; charset=iso-8859-1" />
	<meta name="author" content="Christian Pansch (www.christian-pansch.de)" />
	<meta name="description" content="Design by christian-pansch.de" />
	<meta name="keywords" content="xhtml,css,template,webdesign" />	
	<meta name="Robots" content="index,follow" />
      <link href="bluebusiness.css" rel="stylesheet" type="text/css" />

   </head>

   <body>
        <div id="container">

            <div id="container-header">
                <div id="container-name">Champions League Fantasy Football</div>
            </div>
            
	    <div id="container-eyecatcher">
                <div id="container-navigation">
                <ul id="navigation">
                <%if(user.getLogin().equals("")){%>
                <li><a href="Login.jsp">Home</a></li>
                <%}else{%>
                <li><a href="Home.jsp">Home</a></li>
                <li><a href="checkTimeTeam.jsp">MyTeam</a></li>
                <li><a href="checkTimeTransfer.jsp">Transfers</a></li>
                <%}%>
                	<li><a href="Stats.jsp">Statistics</a></li>
                    <%if(!user.getLogin().equals("")){%>
                    <li><a href="ShowResults.jsp">Fixtures & Results</a></li>
                    <%}%>
                                        <li><a href="Rules.jsp">Rules</a></li>
                    <li><a href="Help.jsp">Help</a></li>
<%if(!user.getLogin().equals("")){%>
                 <li><a href="Logout.jsp">Logout</a></li>
                <%}%>
                    </ul></div>
            <img src="images/business_eyecatcher.jpg" alt="Business picture" />
	    </div>

            <div id="container-content">

		<div id="content">
                
                	<h1>Player Statistics</h1>
                	
                	<table><tr><td>
	<form method="POST" id="playerviewform" action="checkPlayers.jsp" class="box">
	<select name="clubview" id="clubview" >
	
	<%for(int i=0;i<clubs.getEntries().size();i++){%>
	<option value =<%=((package1.ClubStats)(clubs.getEntries().get(i))).getClub()%>>
	<%=((package1.ClubStats)(clubs.getEntries().get(i))).getClub()%>
	</option>
	<%}%>
	</select>
	</td><td><input id="viewplayers" name="View" value="View" type="submit" class="submit" ></td>
	</form></table>
	<br>
<%if(!user.getClubview().equals("")){%>
<table cellspacing="6.5">
<tr><b><%=user.getClubview()%></b></tr>
<tr>
<td><font color="#006AC3" size="2.5">Name</td>
<td><font color="#006AC3" size="2.5">P</td>
<td><font color="#006AC3" size="2.5">PG</td>
<td><font color="#006AC3" size="2.5">PG60</td>
<td><font color="#006AC3" size="2.5">GS</td>
<td><font color="#006AC3" size="2.5">GA</td>
<td><font color="#006AC3" size="2.5">NC</td>
<td><font color="#006AC3" size="2.5">PS</td>
<td><font color="#006AC3" size="2.5">PC</td>
<td><font color="#006AC3" size="2.5">PM</td>
<td><font color="#006AC3" size="2.5">GC2</td>
<td><font color="#006AC3" size="2.5">YC</td>
<td><font color="#006AC3" size="2.5">RC</td>
<td><font color="#006AC3" size="2.5">3S</td>
<td><font color="#006AC3" size="2.5">TS</td>
</tr>
<%for(int i=0;i<players.getEntries().size();i++){%>
<tr>
<td><%=((package1.Player)(players.getEntries().get(i))).getPlayer_name()%></td>
<td><%=((package1.Player)(players.getEntries().get(i))).getPosition()%></td>
<td><%=((package1.Player)(players.getEntries().get(i))).getTotal_played_game()%></td>
<td><%=((package1.Player)(players.getEntries().get(i))).getTotal_played_60_min()%></td>
<td><%=((package1.Player)(players.getEntries().get(i))).getTotal_goal_scored()%></td>
<td><%=((package1.Player)(players.getEntries().get(i))).getTotal_goal_assist()%></td>
<td><%=((package1.Player)(players.getEntries().get(i))).getTotal_no_conceed()%></td>
<td><%=((package1.Player)(players.getEntries().get(i))).getTotal_penalty_saved()%></td>
<td><%=((package1.Player)(players.getEntries().get(i))).getTotal_penalty_created()%></td>
<td><%=((package1.Player)(players.getEntries().get(i))).getTotal_penalty_missed()%></td>
<td><%=((package1.Player)(players.getEntries().get(i))).getTotal_2_goal_conceed()%></td>
<td><%=((package1.Player)(players.getEntries().get(i))).getTotal_yellow_card()%></td>
<td><%=((package1.Player)(players.getEntries().get(i))).getTotal_red_card()%></td>
<td><%=((package1.Player)(players.getEntries().get(i))).getTotal_3_saves()%></td>
<td><%=((package1.Player)(players.getEntries().get(i))).getTotal_score()%></td>
</tr>
<%}%>

</table>
<br>
<p>
* P=Position PG=Games Played PG60=Games Played for at least 60 min 
</p><p>
GS=Goals scored GA=Goal assists NC=No Conceeds 
</p><p>
PS=Penalties Saved PC=Penalties conceeded PM=Penalties missed 
</p><p>
GC2=2 Goals Conceeded YC=Yellow Cards RC=Red Cards
</p><p>
 3S=3 Saves TS=Total Score
 </p>
<%
user.setClubview("");
}%>           


			
		</div> <!-- CONTENT END -->

		<div id="border">
		
		<%if(!user.getLogin().equals("")){ %>
<p><font color="#006AC3" size="2.5">Welcome</font><font color="grey" size="3.0"> <%=user.getFname()%> <%=user.getLname()%></font></p>

	

			<p><font color="#006AC3" size="2.5">Team name:</font><font color="grey" size="3.0"> <%=user.getTeamname()%></font></p>
			<p><font color="#006AC3" size="2.5">Score Today:</font><font color="grey" size="3.0"> <%=user.getScore_today()%></font></p>
			<p><font color="#006AC3" size="2.5">Total Score:</font><font color="grey" size="3.0"> <%=user.getScore()%></font></p>
			<p><font color="#006AC3" size="2.5">Overall Rank:</font><font color="grey" size="3.0"> <%=user.getOverall_rank()%></font></p>
			
			Tables

			<hr />

<p><font color="#006AC3" size="2.5"><a href="Overall.jsp">Overall</a></font></p>
<p><font color="#006AC3" size="2.5"><a href="Today.jsp">Today</a></font></p>
<p><font color="#006AC3" size="2.5"><a href="Club.jsp"><%=user.getClub()%> Fans</a></font></p>

	Leagues
	<hr />
	<%if(user.getLeagues().size()!=0){ %>
	<table><tr><td>
	<form method="POST" id="leagueviewform" action="checkLeague.jsp" class="box">
	<select name="leagueno" id="leagueno" >
	
	<%for(int i=0;i<user.getLeagues().size();i++){%>
	<option value =<%=Integer.toString(i)%>>
	<%=user.getLeagues().get(i)%>
	</option>
	<%}%>
	</select>
	</td><td><input id="viewleague" name="View" value="View" type="submit" class="submit" />
	</form></table>
	<%} %>
<p><font color="#006AC3" size="2.5"><a href="CreateLeague.jsp">Create a League</a></font></p>
<p><font color="#006AC3" size="2.5"><a href="JoinLeague.jsp">Join a League</a></font></p>
		
		<hr />
		<%} %>
<%if(!user.getDeadline().equals("")){ %>
			<h4>Next Deadline Open:</h4>
			<%=user.getDeadline() %>
			<hr />
			<%} %>
			<h4>Developers:</h4>
			<p>Ashwin Jiwane<br />				
				Avijit Satoskar<br />
				Shashank Samant<br />
				Sumedh Ambokar<br />
			</p>

		</div>

	    </div>

            <div id="container-footer">
                 <div id="footer">
                    <div id="footer-copyright"></div></div>
            </div>

        </div> <!-- ENDE container -->
   </body>
</html>
