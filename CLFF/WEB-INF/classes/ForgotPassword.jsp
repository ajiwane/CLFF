<jsp:useBean id="user" class="package1.UserBean" scope="session"/>
<jsp:setProperty name="user" property="*"/>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">

   <head>
      <title></title>
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
                <li><a href="Login.jsp">Home</a></li>
                	<li><a href="Stats.jsp">Statistics</a></li>
                    
                                        <li><a href="Rules.jsp">Rules</a></li>
                    <li><a href="Help.jsp">Help</a></li>

                    </ul></div>
            <img src="images/business_eyecatcher.jpg" alt="Business picture" />
	    </div>

            <div id="container-content">

		<div id="content">
                
                	<h1>Forgot Password</h1>
		<%
	if(user.getErrorMessage().equals("FPloginEmpty"))
		out.println("<P><font color=\"red\">Enter a username.</font></P>");
	else if(user.getErrorMessage().equals("FPloginIncorrect"))
		out.println("<P><font color=\"red\">No such user exists.</font></P>");
	%>
        <form method="get" id="forgotpasswordform" action="checkFPassword.jsp" class="box">
			<p><font color="#006AC3" size="4.5">Username: </font>
            <input type="text" name="login" id="login" value="<%=user.getLogin()%>" class="input-txt" /></p>

            <p><input id="submit" value="Submit" type="submit" class="submit" /></p>
       		</form>
			
			
		</div> <!-- CONTENT END -->


	    </div>

            <div id="container-footer">
                 <div id="footer">
                    <div id="footer-copyright"></div></div>
            </div>

        </div> <!-- ENDE container -->
   </body>
</html>
