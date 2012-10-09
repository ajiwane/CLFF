<jsp:useBean id="user" class="package1.UserBean" scope="session"/>
<jsp:setProperty name="user" property="*"/>
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
                                <li><a href="Home.jsp">Home</a></li>
<li><a href="checkTimeTeam.jsp">MyTeam</a></li>
<li><a href="checkTimeTransfer.jsp">Transfers</a></li>


                	<li><a href="Stats.jsp">Statistics</a></li>              
                    <li><a href="ShowResults.jsp">Fixtures & Results</a></li>                   
<li><a href="Rules.jsp">Rules</a></li>
                    <li><a href="Help.jsp">Help</a></li>
                    <li><a href="Logout.jsp">Logout</a></li>
                    </ul></div>
            <img src="images/business_eyecatcher.jpg" alt="Business picture" />
	    </div>

            <div id="container-content">

		<div id="content">
                
                	<h1>Join A League</h1>

                	<p>Join a league and compete with your friends!! Enter the name and ID of the league created by your friend.</p>

			<%
	if(user.getErrorMessage().equals("joinLeagueNameEmpty"))
		out.println("<P><font color=\"red\">Enter a league name.</font></P>");
	else if(user.getErrorMessage().equals("leagueNotExists"))
		out.println("<P><font color=\"red\">League name does not exist.</font></P>");
	else if(user.getErrorMessage().equals("joinLeagueIDEmpty"))
		out.println("<P><font color=\"red\">Enter a league ID.</font></P>");
	else if(user.getErrorMessage().equals("joinLeaguecIDEmpty"))
		out.println("<P><font color=\"red\">Confirm league ID.</font></P>");
	else if(user.getErrorMessage().equals("joinLeagueIDUnequal"))
		out.println("<P><font color=\"red\">League IDs do not match.</font></P>");
	else if(user.getErrorMessage().equals("joinLeagueIDIncorrect"))
		out.println("<P><font color=\"red\">Incorrect League ID.</font></P>");
	%>
			<table cellspacing="10">
			<form id="joinLeagueForm" action="checkJoinLeague.jsp" method="POST" class="box">
			<tr>
            <td><font color="#006AC3" size="4.5">League Name</font></td>
            <td>&nbsp;&nbsp;&nbsp;&nbsp;
            <input type="text" name="joinLeagueName" id="joinLeagueName" value="<%=user.getJoinLeagueName()%>" class="input-txt" /></td>
			<tr>
            <td><font color="#006AC3" size="4.5">League ID</font></td>
            <td>&nbsp;&nbsp;&nbsp;&nbsp;
            <input type="password" name="joinLeagueID" id="joinLeagueID" value="" class="input-txt" /></td>
            <tr>
            <td>&nbsp;&nbsp;&nbsp;&nbsp;
            <input id="jLeaguesubmit" value="Join League" type="submit" class="submit" /></p>
       		</form>
            </table>
                	
			
			
		</div> <!-- CONTENT END -->

		<div id="border">
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
