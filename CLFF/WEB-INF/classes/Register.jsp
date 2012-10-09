<jsp:useBean id="user" class="package1.UserBean" scope="session"/>
<jsp:setProperty name="user" property="*"/> 
<jsp:useBean id="clubs" class="package1.LeagueStandings" scope="session"/>
<jsp:setProperty name="clubs" property="*"/>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">

   <head>
      <title>Champions League Fantasy Football | Register</title>
	<meta http-equiv="Content-Language" content="English" />
	<meta http-equiv="content-type" content="text/html; charset=iso-8859-1" />
	<meta name="author" content="Christian Pansch (www.christian-pansch.de)" />
	<meta name="description" content="Design by christian-pansch.de" />
	<meta name="keywords" content="xhtml,css,template,webdesign" />	
	<meta name="Robots" content="index,follow" />
      <link href="bluebusiness.css" rel="stylesheet" type="text/css" />

   </head>

   <body>
   <%user.setPassword("");
       user.setCpassword("");%>
       
        <div id="container">

            <div id="container-header">
                <div id="container-name">Champions League Fantasy Football</div>
            </div>
            
	    <div id="container-eyecatcher">
                <div id="container-navigation">
                <ul id="navigation"><li><a href="Login.jsp">Home</a></li>
                	<li><a href="Stats.jsp">Statistics</a></li>
                    
                                       <li><a href="Rules.jsp">Rules</a></li>
                    <li><a href="Help.jsp">Help</a></li>

                    </ul></div>
            <img src="images/business_eyecatcher.jpg" alt="Business picture" />
	    </div>

            <div id="container-content">

		<div id="content">
                
                	<h1>Register</h1>

                	<p>Register and Play the 2007/08 Champions League Fantasy Football game.</p>
                    <%
	if(user.getErrorMessage().equals("regloginEmpty"))
		out.println("<P><font color=\"red\">Enter a username.</font></P>");
	else if(user.getErrorMessage().equals("userExists"))
		out.println("<P><font color=\"red\">Username already taken.</font></P>");
	else if(user.getErrorMessage().equals("regpaswdEmpty"))
		out.println("<P><font color=\"red\">Enter a password.</font></P>");
	else if(user.getErrorMessage().equals("cpaswdEmpty"))
		out.println("<P><font color=\"red\">Confirm password.</font></P>");
	else if(user.getErrorMessage().equals("paswdUnequal"))
		out.println("<P><font color=\"red\">Passwords do not match.</font></P>");
	else if(user.getErrorMessage().equals("teamEmpty"))
		out.println("<P><font color=\"red\">Enter a team name.</font></P>");
	else if(user.getErrorMessage().equals("teamExists"))
		out.println("<P><font color=\"red\">Team name already taken.</font></P>");
	else if(user.getErrorMessage().equals("fnameEmpty"))
		out.println("<P><font color=\"red\">Enter a first name.</font></P>");
	else if(user.getErrorMessage().equals("lnameEmpty"))
		out.println("<P><font color=\"red\">Enter a last name.</font></P>");
	else if(user.getErrorMessage().equals("clubEmpty"))
		out.println("<P><font color=\"red\">Selet your favourite Club.</font></P>");
	else if(user.getErrorMessage().equals("questionEmpty"))
		out.println("<P><font color=\"red\">Select a security question.</font></P>");
	else if(user.getErrorMessage().equals("answerEmpty"))
		out.println("<P><font color=\"red\">Write an answer for the security question.</font></P>");
	%>
			<table cellspacing="10">
			<form id="registerform" action="checkRegister.jsp" method="POST" class="box">
			<tr>
            <td><font color="#006AC3" size="4.5">Desired Username</font></td>
            <td>&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" name="login" id="login" value="<%=user.getLogin()%>" class="input-txt" /></td>
			<tr>
            <td><font color="#006AC3" size="4.5">Password</font></td>
            <td>&nbsp;&nbsp;&nbsp;&nbsp;<input type="password" name="password" id="password" value="" class="input-txt" /></td>
            <tr>
            <td><font color="#006AC3" size="4.5">Confirm Password</font></td>
            <td>&nbsp;&nbsp;&nbsp;&nbsp;<input type="password" name="cpassword" id="cpassword" value="" class="input-txt" /></td>
            <tr>
            <td><font color="#006AC3" size="4.5">Team Name</font></td>
            <td>&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" name="teamname" id="teamname" value="<%=user.getTeamname()%>" class="input-txt" /></td>
	    <tr>
            <td><font color="#006AC3" size="4.5">First Name</font></td>
            <td>&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" name="fname" id="fname" value="<%=user.getFname()%>" class="input-txt" /></td>
            <tr>
            <td><font color="#006AC3" size="4.5">Last Name</font></td>
            <td>&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" name="lname" id="lname" value="<%=user.getLname()%>" class="input-txt" /></td>            
	    <tr>
            <td><font color="#006AC3" size="4.5">Favourite Club</font>
            <td>&nbsp;&nbsp;&nbsp;&nbsp;<select name="club" id="club" value ="<%=((package1.ClubStats)(clubs.getEntries().get(0))).getClub()%>">
            <%for(int i=0;i<clubs.getEntries().size();i++){ %>
								<option value ="<%=((package1.ClubStats)(clubs.getEntries().get(i))).getClub()%>">
								<%=((package1.ClubStats)(clubs.getEntries().get(i))).getClub()%></option>
								<%} %>
				</select></p>
            <tr>
            <td><font color="#006AC3" size="4.5">Security Question</font>
            <td>&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" name="question" id="question" value="<%=user.getQuestion()%>" class="input-txt" /></p>
            <tr>
            <td><font color="#006AC3" size="4.5">Answer</font>
            <td>&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" name="answer" id="answer" value="" class="input-txt" /></p>
            <tr>
            <td>&nbsp;&nbsp;&nbsp;&nbsp;<input id="regsubmit" value="Register" type="submit" class="submit" /></p>
       		</form>
            </table>
			
               
                	
			
			
		</div> <!-- CONTENT END -->

		

	    </div>

            <div id="container-footer">
                 <div id="footer">
                    <div id="footer-copyright"></div></div>
            </div>

        </div> <!-- ENDE container -->
   </body>
</html>
