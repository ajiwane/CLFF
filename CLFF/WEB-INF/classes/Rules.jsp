<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<jsp:useBean id="user" class="package1.UserBean" scope="session"/>
<jsp:setProperty name="user" property="*"/>
   <head>
      <title>Champions League Fantasy Football | Rules</title>
	<meta http-equiv="Content-Language" content="English" />
	<meta http-equiv="content-type" content="text/html; charset=iso-8859-1" />
	<meta name="author" content="Christian Pansch (www.christian-pansch.de)" />
	<meta name="description" content="Design by christian-pansch.de" />
	<meta name="keywords" content="xhtml,css,template,webdesign" />	
	<meta name="Robots" content="index,follow" />
      <link href="bluebusiness.css" rel="stylesheet" type="text/css" />
      <style type="text/css">
<!--
.style2 {font-size: 24px}
.style3 {
	font-size: 30px;
	font-weight: bold;
	color: #84BDFF;
}
-->
      </style>
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
		  <div class="style2">
		    <div align="center" class="style3">Rules of the Game </div>
		  </div>
                	<h1>Squad selection</h1>
                	<p> Each player may enter one fantasy football squad .Squads must consist of: </p>
                	<ul>
                      <li>2 Goalkeepers</li>
                	  <li>5 Defenders</li>
                	  <li>5 Midfielders</li>
                	  <li>3 Forwards</li>
              	  </ul>
       	            <p> Each player has been given a value. The initial value of your group  stage squad must not exceed 100 million Euros..</p>
       	            <p>Once the group stage has finished the team budget will be increased 110  million Euros. Any team who is over this limit will need to keep to  this limit when making their next transfers. Teams whose value is below  this will receive extra money to allow them to spend the full budget  limit. </p>
       	            <h1>Formations</h1>
                	<p>From your squad you select eleven players to form your team each  Matchday. Your team can play in any formation, providing one, and only  one, goalkeeper is selected.</p>
                	<p>To change your formation simply select your chosen eleven players on  the My Team page. The computer will automatically chose your formation  based on the players you have selected. </p>
                	<p> Only players in your starting eleven will score points. See the following section for details of how your starting eleven can be changed during a Matchday. </p>
                	<p> Players can only play in their designated position. For example, you can't play a defender as an attacker. </p>
                	<h1>Substitutions</h1>
                	<p>Once a Matchday has started you can choose to make your own manager  substitutions or do nothing and allow automatic substitutions to take  place at the end of the Matchday. </p>
                	<p> <strong>Manager substitutions</strong><br />
                	  Between the end of Tuesday's  matches and the start of Wednesday's matches, you can replace any  player who hasn't played or has played less than 60 minutes and wasn't  sent off with one from your bench who is yet to play. </p>
                	<p> If you replace a player who has already played, they will score no points for your team that Matchday. </p>
                	<p>You can make an unlimited number of manager substitutions and  captain changes between Tuesday's and Wednesday's matches, but once  used, no automatic substitutions will take place for that Matchday. </p>
                	<p> <strong>Automatic substitutions</strong><br />
                	  If your goalkeeper plays no  part in the Matchday, then the computer will substitute the player for  your replacement goalkeeper, if they played in the Matchday. </p>
                	<p>If any of your outfield players play no part in the Matchday, then  the computer will try to substitute the inactive player for one of your  replacements. This is done by replacing them with your highest priority  substitute who actually played in the Matchday. You can change your  substitution priorities on the My Team page. </p>
                	<p> Automatic substitutions are applied at the end of the Matchday, when all matches have been played. </p>
                	<h1>Captains</h1>
                	<p>You must nominate a member of your team to be captain. This player  will score double the number of points they would usually have been  awarded that Matchday. </p>
                	<p>Between the end of Tuesday's matches and the start of Wednesday's  matches, you can change your captain . </p>
                	<p> If your captain does not play then the bonus will be lost. Another player will not take over the captaincy in their place. </p>
                	<h1>Scoring</h1>
                	<p> During the tournament, the fantasy football players will be allocated a  point score after each game, based on their performances in the  matches. Actions occurring in extra time count but penalty shoot-outs  do not. Points are awarded as detailed in the table below:</p>
                	<table width="429" border="1">
                      <tr>
                        <td width="383"> <div align="center"><strong>Action</strong></div></td>
                        <td width="30"><strong>Points</strong></td>
                      </tr>
                      <tr>
                        <td>For playing in a game</td>
                        <td>1</td>
                      </tr>
                      <tr>
                        <td>For playing at least 60 minutes in a game (includes playing points mentioned above)</td>
                        <td>2</td>
                      </tr>
                      <tr>
                        <td>For each goal scored by your goalkeeper or defenders</td>
                        <td>6</td>
                      </tr>
                      <tr>
                        <td>For each goal scored by your midfielders</td>
                        <td>5</td>
                      </tr>
                      <tr>
                        <td>For each goal scored by your forwards </td>
                        <td>4</td>
                      </tr>
                      <tr>
                        <td>For each goal assist</td>
                        <td>3</td>
                      </tr>
                      <tr>
                        <td>For your goalkeeper conceding 0 goals (must also play at least 60 minutes)</td>
                        <td>4</td>
                      </tr>
                      <tr>
                        <td>For your defender conceding 0 goals (must also play at least 60 minutes)</td>
                        <td>4</td>
                      </tr>
                      <tr>
                        <td>For your midfielder conceding 0 goals (must also play at least 60 minutes)</td>
                        <td>2</td>
                      </tr>
                      <tr>
                        <td>For every penalty save</td>
                        <td>5</td>
                      </tr>
                      <tr>
                        <td>For every penalty save</td>
                        <td>-2</td>
                      </tr>
                      <tr>
                        <td>For every 2 goals conceded by your goalkeeper or defenders</td>
                        <td>-1</td>
                      </tr>
                      <tr>
                        <td>For every yellow card</td>
                        <td>-1</td>
                      </tr>
                      <tr>
                        <td>For every red card (includes any yellow card points)</td>
                        <td>-3</td>
                      </tr>
                      <tr>
                        <td>For every 3 saves</td>
                        <td>1</td>
                      </tr>
                      <tr>
                        <td>For earning a penalty after the referee adjudges that the player had been fouled</td>
                        <td>1</td>
                      </tr>
                      <tr>
                        <td>For  conceding a penalty after the referee adjudges that an infringement  takes place in the penalty area that results in a kick from the penalty  mark</td>
                        <td>-1</td>
                      </tr>
                    </table>
                	<p>The Points will be calculated using data provided to us on behalf of  UEFA. Neither we nor UEFA will enter into any correspondence relating  to the allocation of points to players. We accept no responsibility for  the accuracy of this data. </p>
                	<h1>Assists</h1>
                	<p>An assist is awarded when the goal scorer receives the ball directly  from a team mate and scores. If the assist pass takes a small  deflection which doesn't change the direction of the pass, it will  still be given. No assists are awarded for own goals or penalties. Live  assists are provisional and will be reviewed within twenty four hours  of the match. </p>
                	<h1>Player values</h1>
                	<p>Player prices are fixed and predetermined at the start of the season depending on his quality and past performances.  </p>
                	<h1>Leagues</h1>
                	<p> Your team does not play matches against other teams. Instead, each team competes in a number of leagues. These are: </p>
                	<ul>
                      <li>The overall league involving all registered players.</li>
                	  <li>A league for supporters of your favourite team  </li>
                	  <li>Private leagues with your friends and colleagues (optional)</li>
               	  </ul>
                	<p>&nbsp;</p>
                	<div></div>
       	  <div></div>
                	<p>&nbsp;</p>
                	<p>&nbsp;</p>
           	  </div> <!-- CONTENT END -->

		<div id="border">
        
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
