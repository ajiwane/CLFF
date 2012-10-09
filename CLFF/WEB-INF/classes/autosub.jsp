<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<jsp:useBean id="user" class="package1.UserBean" scope="session"/>
<jsp:setProperty name="user" property="*"/>
   <head>
      <title>Champions League Fantasy Football | Home</title>
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
                <ul id="navigation"><%if(user.getLogin().equals("")){%>
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
		    <div align="center"></div>
		  </div>
                	<div>
                	  <div> 
       	                <h1>Help - Substitutions</h1>
       	                <p> Once a Matchday has started you can choose to make your own manager  substitutions or do nothing and allow automatic substitutions to take  place at the end of the Matchday. </p>
       	                <p> <strong>Manager substitutions</strong><br />
       	                  Between the end of Tuesday's  matches and the start of Wednesday's matches, you can replace any  player who hasn't played or has played less than 60 minutes and wasn't  sent off with one from your bench who is yet to play. </p>
       	                <p> If you replace a player who has already played, they will score no points for your team that Matchday. </p>
       	                <p>You can make an unlimited number of manager substitutions and  captain changes between Tuesday's and Wednesday's matches, but once  used, no automatic substitutions will take place for that Matchday. </p>
       	                <p> <strong>Automatic substitutions</strong><br />
       	                  If your goalkeeper plays no  part in the Matchday, then the computer will substitute the player for  your replacement goalkeeper, if they played in the Matchday. </p>
       	                <p>If any of your outfield players play no part in the Matchday, then  the computer will try to substitute the inactive player for one of your  replacements. This is done by replacing them with your highest priority  substitute who actually played in the Matchday. You can change your  substitution priorities on the My Team page. </p>
       	                <p> Automatic substitutions are applied at the end of the Matchday, when all matches have been played. </p>
       	                <p>&nbsp;</p>
   	        </div>
       	    </div>
                	<p>&nbsp;</p>
                	<p>&nbsp;</p>
           	  </div> <!-- CONTENT END -->

		<div id="border">
        <form method="POST" id="loginform" action="../checkLogin.jsp" class="box">
		  <p><a href="hottopics.jsp">Hot Topics</a></p>
		  <p><a href="formations.jsp">Formations</a></p>
		  <p><a href="captains.jsp">Captains</a></p>
		  <p><a href="autosub.jsp">Automatic Substitutions</a></p>
		  <p><a href="transfers.jsp">Transfers</a></p>
		  <p><a href="deadlines.jsp">Deadlines</a></p>
		  <p><a href="assists.jsp">Assists</a></p>
		  <p><a href="leagueadmin.jsp">League Administration</a></p>
		  <p>&nbsp;</p>
        </form>
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
