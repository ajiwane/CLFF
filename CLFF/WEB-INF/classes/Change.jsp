<jsp:useBean id="user" class="package1.UserBean" scope="session"/>
<jsp:setProperty name="user" property="*"/> 
<html>
   <head>
        <title>  Login  </title>
    </head>
     <body >
        <%
        String submit=request.getParameter("Submit");
        String val=new String();
        val=null;
        if(submit.equals("Change Captain"))
        {
		val=request.getParameter("cap");
		user.setFrom_change("0");
		user.setTo_change(val);
        }
        else if(submit.equals("Change S1"))
        {
		val=request.getParameter("s1");
		user.setFrom_change("11");
		user.setTo_change(val);
        }
		else if(submit.equals("Change S2"))
        {
		val=request.getParameter("s2");
		user.setFrom_change("12");
		user.setTo_change(val);
        }
        else if(submit.equals("Change S3"))
        {
		val=request.getParameter("s3");
		user.setFrom_change("13");
		user.setTo_change(val);
        }
        else if(submit.equals("Change S4"))
        {
		val=request.getParameter("s4");
		user.setFrom_change("14");
		user.setTo_change(val);
        }
		if(val!=null)
		{
		user.setAction("Change");
        response.sendRedirect("Controller");
        }
        else{
                response.sendRedirect("checkTimeTeam.jsp");
        }
        %>
        <p></p>
     </body>
</html>
 