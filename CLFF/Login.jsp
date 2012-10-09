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
   <%user.setPassword("");%>
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
                
                	<h1>Fantasy Football</h1>

                	<p>Play the 2007/08 Champions League Fantasy Football game, brought to you by CSE, IIT Bombay. Pick your team based on the players in the competition and test your knowledge and management skills!
</p>

			<h2>Statistics</h2>
			
                	<p><img src="images/upper.jpg" alt="This is an example for an image" class="alignleft" />
                    View the performance of all the players playing in any team in the Champions League.                    </p>
          <p align="right"><a href="Stats.jsp">More >></a></p>
                    
          
                	
			
			
		</div> <!-- CONTENT END -->

		<div id="border">
        <%
	if(user.getErrorMessage().equals("loginEmpty"))
		out.println("<P><font color=\"red\">Enter a username.</font></P>");
	else if(user.getErrorMessage().equals("paswdEmpty"))
		out.println("<P><font color=\"red\">Enter a password.</font></P>");
	else if(user.getErrorMessage().equals("loginIncorrect"))
		out.println("<P><font color=\"red\">Login ID incorrect.</font></P>");
	else if(user.getErrorMessage().equals("paswdIncorrect"))
		out.println("<P><font color=\"red\">Password Incorrect.</font></P>");
	if(user.getErrorMessage().equals("registered"))
		out.println("<P><font color=\"red\">Registration Successful.</font></P>");
	if(user.getErrorMessage().equals("pwdchanged"))
		out.println("<P><font color=\"red\">Password Changed.</font></P>");
	%>
        <form method="POST" id="loginform" action="checkLogin.jsp" class="box">
			<p><font color="#006AC3" size="4.5">Username</font>
            <input type="text" name="login" id="login" value="<%=user.getLogin()%>" class="input-txt" /></p>
			<p><font color="#006AC3" size="4.5">Password</font>
            <input type="password" name="password" id="password" value="" class="input-txt" /></p>
            <p><input id="loginsubmit" value="Login" type="submit" class="submit" /></p>
       		</form>
            <p><a href="checkRegClub.jsp">Register</a> | <a href="ForgotPassword.jsp">Forgot Password?</a></p>
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

