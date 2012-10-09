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
                
                	<h1>New Password</h1>
                	<%if(!user.getPassword().equals("")){ %>
		<p>Your New Password is: <b><%=user.getPassword() %></b></p>
		<p>We suggest you to change your password immediately.</p>
		<%} 
		
	if(user.getErrorMessage().equals("CPpaswdEmpty"))
		out.println("<P><font color=\"red\">Enter a password.</font></P>");
	else if(user.getErrorMessage().equals("CPcpaswdEmpty"))
		out.println("<P><font color=\"red\">Confirm your password.</font></P>");
	else if(user.getErrorMessage().equals("CPpaswdUnequal"))
		out.println("<P><font color=\"red\">Passwords do not match.</font></P>");
		%>
		<table>
        <form method="get" id="forgotpasswordform" action="checkChangePwd.jsp" class="box">
		<tr><td><p><font color="#006AC3" size="4.5">Password: </font></p></td>
            <td><input type="password" name="password" id="password" value="" class="input-txt" /></p></td>
		</tr>
		<tr><td><p><font color="#006AC3" size="4.5">Confirm Password: </font></p></td>
            <td><input type="password" name="cpassword" id="cpassword" value="" class="input-txt" /></p></td>
		</tr>	
        <tr><td>
         <p><input id="submit" value="Change Password" type="submit" class="submit" /></p></td>
       	</tr>	</form>
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
