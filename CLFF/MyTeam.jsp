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
                
                	<h1>My Team</h1>

<table cellspacing="10">
<tr>

<td><font color="#006AC3" size="2.5">Name</td>
<td><font color="#006AC3" size="2.5">Club Name</td>
<td><font color="#006AC3" size="2.5">Position</td>
<td><font color="#006AC3" size="2.5">Today Played</td>
<td><font color="#006AC3" size="2.5">Today Score</td>
<td><font color="#006AC3" size="2.5">Total Score</td>

</tr>
<%for(int i=0;i<15;i++){%>
<tr>

<td><%=((package1.Player)(user.getPlayers().get(i))).getPlayer_name()%></td>
<td><%=((package1.Player)(user.getPlayers().get(i))).getClub_name()%></td>
<td><%=((package1.Player)(user.getPlayers().get(i))).getPosition()%></td>
<td><%=((package1.Player)(user.getPlayers().get(i))).getToday_played()%></td>
<td><%=((package1.Player)(user.getPlayers().get(i))).getToday_score()%></td>
<td><%=((package1.Player)(user.getPlayers().get(i))).getTotal_score()%></td>
</tr>
<%}%>


</table>
<hr />
<br>
<%if(user.getSelectionAllowed().equals("NoTeam")){ %>
<p>You are not allowed to make any changes now to your team.</p>
<%}else if(user.getSelectionAllowed().equals("AllowTeam")){%>
<table>
<tr>
<td>
<form method="POST" id="captainform" action="Change.jsp" class="box">
<font color="#006AC3">Change Captain:</font></td>
<td>
<select name="cap" id="cap" >
								<%for(int i=1;i<11;i++){
								String val = Integer.toString(i);

							%>
							<option value =<%=val%>>
							<%=((package1.Player)(user.getPlayers().get(i))).getPlayer_name()%></option>
								<%}%>
				</select>
</td>				
<td>
<input id="confirmcaptain" name="Submit" value="Change Captain" type="submit" class="submit" />
</td>
</form>
</td>
</tr>
<br>
<tr>
<form method="POST" id="loginform" action="Change.jsp" class="box">
<td>
<font color="#006AC3">Change S1:</font></td>
<td><select name="s1" id="s1" >
								<%
								if((((package1.Player)(user.getPlayers().get(11))).getPosition()).equals("Goalkeeper")){
								for(int i=1;i<11;i++){
								String val = Integer.toString(i);
								if((((package1.Player)(user.getPlayers().get(i))).getPosition()).equals("Goalkeeper")){
								%>
								<option selected value =<%=val%>>
								<%=((package1.Player)(user.getPlayers().get(i))).getPlayer_name()%>
								</option>
								<%}
								}}else{%>
								<%for(int i=1;i<11;i++){
								String val = Integer.toString(i);
								if(!(((package1.Player)(user.getPlayers().get(i))).getPosition()).equals("Goalkeeper")){
								%>
								
							<option value =<%=val%>>
							<%=((package1.Player)(user.getPlayers().get(i))).getPlayer_name()%></option>
								<%}}%>
								
								<%}%>
				</select>
</td><td>				
<input id="confirmcaptain" name="Submit" value="Change S1" type="submit" class="submit" /></td>
</form>
</tr>
<tr>
<form method="POST" id="loginform" action="Change.jsp" class="box">
<td><font color="#006AC3">Change S2:</font>
</td>
<td><select name="s2" id="s2" >
								<%
								if((((package1.Player)(user.getPlayers().get(12))).getPosition()).equals("Goalkeeper")){
								for(int i=1;i<11;i++){
								String val = Integer.toString(i);
								if((((package1.Player)(user.getPlayers().get(i))).getPosition()).equals("Goalkeeper")){
								%>
								<option selected value =<%=val%>>
								<%=((package1.Player)(user.getPlayers().get(i))).getPlayer_name()%>
								</option>
								<%}
								}}else{%>
								<%for(int i=1;i<11;i++){
								String val = Integer.toString(i);
								if(!(((package1.Player)(user.getPlayers().get(i))).getPosition()).equals("Goalkeeper")){
							%>
							<option value =<%=val%>>
							<%=((package1.Player)(user.getPlayers().get(i))).getPlayer_name()%></option>
								<%}}%>
								
								<%}%>
				</select>
</td><td>				
<input id="confirmcaptain" name="Submit" value="Change S2" type="submit" class="submit" />
</td>
</form>
</tr>
<tr>
<form method="POST" id="loginform" action="Change.jsp" class="box">

<td><font color="#006AC3">Change S3:</font></td>
<td><select name="s3" id="s3" >
								<%
								if((((package1.Player)(user.getPlayers().get(13))).getPosition()).equals("Goalkeeper")){
								for(int i=1;i<11;i++){
								String val = Integer.toString(i);
								if((((package1.Player)(user.getPlayers().get(i))).getPosition()).equals("Goalkeeper")){
								%>
								<option selected value =<%=val%>>
								<%=((package1.Player)(user.getPlayers().get(i))).getPlayer_name()%>
								</option>
								<%}
								}}else{%>
								<%for(int i=1;i<11;i++){
								String val = Integer.toString(i);
								if(!(((package1.Player)(user.getPlayers().get(i))).getPosition()).equals("Goalkeeper")){
							%>
							<option value =<%=val%>>
							<%=((package1.Player)(user.getPlayers().get(i))).getPlayer_name()%></option>
								<%}}%>
								
								<%}%>
				</select>
</td><td>				
<input id="confirmcaptain" name="Submit" value="Change S3" type="submit" class="submit" />
</form>
</td>
</tr>
<tr><td>
<form method="POST" id="loginform" action="Change.jsp" class="box">
<font color="#006AC3">Change S4:</font></td><td>
<select name="s4" id="s4" >
								<%
								if((((package1.Player)(user.getPlayers().get(14))).getPosition()).equals("Goalkeeper")){
								for(int i=1;i<11;i++){
								String val = Integer.toString(i);
								if((((package1.Player)(user.getPlayers().get(i))).getPosition()).equals("Goalkeeper")){
								%>
								<option selected value =<%=val%>>
								<%=((package1.Player)(user.getPlayers().get(i))).getPlayer_name()%>
								</option>
								<%}
								}}else{%>
								<%for(int i=1;i<11;i++){
								String val = Integer.toString(i);
								if(!(((package1.Player)(user.getPlayers().get(i))).getPosition()).equals("Goalkeeper")){
						%>	
							<option value =<%=val%>>
							<%=((package1.Player)(user.getPlayers().get(i))).getPlayer_name()%></option>
								<%}}%>
								
								<%}%>
				</select>
				</td><td>
<input id="confirmcaptain" name="Submit" value="Change S4" type="submit" class="submit" /></td>
</form>	
			</tr>
			</table>
			<p> Note: You cannot swap a substitute with the captain.</p>
			
			<%} %>
			
			
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
