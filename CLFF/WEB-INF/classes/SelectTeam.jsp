<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<jsp:useBean id="user" class="package1.UserBean" scope="session"/>
<jsp:useBean id="allplayers" class="package1.AllPlayers" scope="session"/>
<jsp:setProperty name="user" property="*"/>
<%@ page import="java.util.Vector,package1.*"%>
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
                
                	<h1>Select Team</h1>
                	<%if(user.getSelectionAllowed().equals("NoSelectTeam")){ %>
                	<p>You are not allowed to select team now.</p>
                	<%}else if(user.getSelectionAllowed().equals("AllowSelectTeam")){ %>

<p> 			<font color="#006AC3" size="4.0" align="left"> Budget:</font> 
<font size="4.0"> <%=user.getTmpvalue()%>m$</font></p>
<%
	if(user.getErrorMessage().equals("Select All Different Players"))
		out.println("<P><font color=\"red\">Select All Different Players.</font></P>");
	else if(user.getErrorMessage().equals("Total Value must be less than 100m$"))
		out.println("<P><font color=\"red\">Total Value must be less than 100m$.</font></P>");
	else if(user.getErrorMessage().equals("Select All 15 Players"))
		out.println("<P><font color=\"red\">Select All 15 Players</font></P>");
user.setErrorMessage("none");
%>	
 <form method="POST" id="loginform" action="confirmSelectTeam.jsp" class="box">
<p>  		<font color="#006AC3" size="4.0"> Goalkeepers:</font></p>               	
                
           <% Vector gk=allplayers.getGoalkeepers();
           Vector teamplayers=user.getPlayers();
           Vector tmpteamplayers=user.getTmpnewteamvalues();
  			int gk1=0;
  			String tmpplayer=new String();
  			int j;
  			String val1;
  			%>	
<p>	<select name="gk1" id="gk1" >
<%
if(tmpteamplayers.size()==0){
j=-1; 
val1 = Integer.toString(j);%>
<option value = <%=val1%> selected>Choose 1st Goalkeeper(Cap)</option>
<%}else{
	 j=((Integer)tmpteamplayers.elementAt(0)).intValue();
	 val1 = Integer.toString(j);
	if(j==-1){
	%>
	<option value = <%=val1%> selected>Choose 1st Goalkeeper(Cap)</option>
	<%}else{
		%>
<option value = <%=val1%> selected><%=((Player)gk.get(j)).getPlayer_name() %>(Cap)</option>
	<%}}
	for(int i=0;i<gk.size();++i){
           String val = Integer.toString(i);
           String playername=((Player)gk.get(i)).getPlayer_name();
            %>
          	<option value = <%=val%> ><%=playername%></option>
			<%}%>				

</select></p>
			<p>	<select name="gk2" id="gk2" >
<%
if(tmpteamplayers.size()==0){
j=-1; 
val1 = Integer.toString(j);%>
<option value = <%=val1%> selected>Choose 2nd Goalkeeper(Sub)</option>
<%}else{
	 j=((Integer)tmpteamplayers.elementAt(1)).intValue();
	 val1 = Integer.toString(j);
	if(j==-1){
	%>
	<option value = <%=val1%> selected>Choose 2nd Goalkeeper(Sub)</option>
	<%}else{
		%>
<option value = <%=val1%> selected><%=((Player)gk.get(j)).getPlayer_name() %>(Sub)</option>
	<%}}
	for(int i=0;i<gk.size();++i){
           String val = Integer.toString(i);
           String playername=((Player)gk.get(i)).getPlayer_name();
            %>
          	<option value = <%=val%> ><%=playername%></option>
			<%}%>				
			</select></p>
				
<p>  		<font color="#006AC3" size="4.0" align="left"> Defenders:</font></p>               	
                	<% Vector df=allplayers.getDefenders();
                	int df1=0;int df2=0;int df3=0;int df4=0;
                	%>	
                	
<p>	<select name="df1" id="df1" >
<%
if(tmpteamplayers.size()==0){
j=-1; 
val1 = Integer.toString(j);%>
<option value = <%=val1%> selected>Choose 1st Defender</option>
<%}else{
	 j=((Integer)tmpteamplayers.elementAt(2)).intValue();
	 val1 = Integer.toString(j);
	if(j==-1){
	%>
	<option value = <%=val1%> selected>Choose 1st Defender</option>
	<%}else{
		%>
<option value = <%=val1%> selected><%=((Player)df.get(j)).getPlayer_name() %></option>
	<%}}
	for(int i=0;i<df.size();++i){
           String val = Integer.toString(i);
           String playername=((Player)df.get(i)).getPlayer_name();
            %>
          	<option value = <%=val%> ><%=playername%></option>
			<%}%>				
			</select></p>	

<p>	<select name="df2" id="df2" >
<%
if(tmpteamplayers.size()==0){
j=-1; 
val1 = Integer.toString(j);%>
<option value = <%=val1%> selected>Choose 2nd Defender</option>
<%}else{
	 j=((Integer)tmpteamplayers.elementAt(3)).intValue();
	 val1 = Integer.toString(j);
	if(j==-1){
	%>
	<option value = <%=val1%> selected>Choose 2nd Defender</option>
	<%}else{
		%>
<option value = <%=val1%> selected><%=((Player)df.get(j)).getPlayer_name() %></option>
	<%}}
	for(int i=0;i<df.size();++i){
           String val = Integer.toString(i);
           String playername=((Player)df.get(i)).getPlayer_name();
            %>
          	<option value = <%=val%> ><%=playername%></option>
			<%}%>				
			</select></p>

<p>	<select name="df3" id="df3" >
<%
if(tmpteamplayers.size()==0){
j=-1; 
val1 = Integer.toString(j);%>
<option value = <%=val1%> selected>Choose 3rd Defender</option>
<%}else{
	 j=((Integer)tmpteamplayers.elementAt(4)).intValue();
	 val1 = Integer.toString(j);
	if(j==-1){
	%>
	<option value = <%=val1%> selected>Choose 3rd Defender</option>
	<%}else{
		%>
<option value = <%=val1%> selected><%=((Player)df.get(j)).getPlayer_name() %></option>
	<%}}
	for(int i=0;i<df.size();++i){
           String val = Integer.toString(i);
           String playername=((Player)df.get(i)).getPlayer_name();
            %>
          	<option value = <%=val%> ><%=playername%></option>
			<%}%>				
			</select></p>

<p>	<select name="df4" id="df4" >
<%
if(tmpteamplayers.size()==0){
j=-1; 
val1 = Integer.toString(j);%>
<option value = <%=val1%> selected>Choose 4th Defender</option>
<%}else{
	 j=((Integer)tmpteamplayers.elementAt(5)).intValue();
	 val1 = Integer.toString(j);
	if(j==-1){
	%>
	<option value = <%=val1%> selected>Choose 4th Defender</option>
	<%}else{
		%>
<option value = <%=val1%> selected><%=((Player)df.get(j)).getPlayer_name() %></option>
	<%}}
	for(int i=0;i<df.size();++i){
           String val = Integer.toString(i);
           String playername=((Player)df.get(i)).getPlayer_name();
            %>
          	<option value = <%=val%> ><%=playername%></option>
			<%}%>				
			</select></p>

<p>	<select name="df5" id="df5" >
<%
if(tmpteamplayers.size()==0){
j=-1; 
val1 = Integer.toString(j);%>
<option value = <%=val1%> selected>Choose 5th Defender(Sub)</option>
<%}else{
	 j=((Integer)tmpteamplayers.elementAt(6)).intValue();
	 val1 = Integer.toString(j);
	if(j==-1){
	%>
	<option value = <%=val1%> selected>Choose 5th Defender(Sub)</option>
	<%}else{
		%>
<option value = <%=val1%> selected><%=((Player)df.get(j)).getPlayer_name() %>(Sub)</option>
	<%}}
	for(int i=0;i<df.size();++i){
           String val = Integer.toString(i);
           String playername=((Player)df.get(i)).getPlayer_name();
            %>
          	<option value = <%=val%> ><%=playername%></option>
			<%}%>				
			</select></p>
			
<p><font color="#006AC3" size="4.0" align="left"> MidFielders:</font></p>               	

                       <% Vector mf=allplayers.getMidfielders();
                	int mf1=0;int mf2=0;int mf3=0;int mf4=0;
                	%>	
<p>	<select name="mf1" id="mf1" >
<%
if(tmpteamplayers.size()==0){
j=-1; 
val1 = Integer.toString(j);%>
<option value = <%=val1%> selected>Choose 1st MidFielder</option>
<%}else{
	 j=((Integer)tmpteamplayers.elementAt(7)).intValue();
	 val1 = Integer.toString(j);
	if(j==-1){
	%>
	<option value = <%=val1%> selected>Choose 1st MidFielder</option>
	<%}else{
		%>
<option value = <%=val1%> selected><%=((Player)mf.get(j)).getPlayer_name() %></option>
	<%}}
	for(int i=0;i<mf.size();++i){
           String val = Integer.toString(i);
           String playername=((Player)mf.get(i)).getPlayer_name();
            %>
          	<option value = <%=val%> ><%=playername%></option>
			<%}%>				
			</select></p>
			
	<p>	<select name="mf2" id="mf2" >
<%
if(tmpteamplayers.size()==0){
j=-1; 
val1 = Integer.toString(j);%>
<option value = <%=val1%> selected>Choose 2nd MidFielder</option>
<%}else{
	 j=((Integer)tmpteamplayers.elementAt(8)).intValue();
	 val1 = Integer.toString(j);
	if(j==-1){
	%>
	<option value = <%=val1%> selected>Choose 2nd MidFielder</option>
	<%}else{
		%>
<option value = <%=val1%> selected><%=((Player)mf.get(j)).getPlayer_name() %></option>
	<%}}
	for(int i=0;i<mf.size();++i){
           String val = Integer.toString(i);
           String playername=((Player)mf.get(i)).getPlayer_name();
            %>
          	<option value = <%=val%> ><%=playername%></option>
			<%}%>				
			</select></p>
			
<p>	<select name="mf3" id="mf3" >
<%
if(tmpteamplayers.size()==0){
j=-1; 
val1 = Integer.toString(j);%>
<option value = <%=val1%> selected>Choose 3rd MidFielder</option>
<%}else{
	 j=((Integer)tmpteamplayers.elementAt(9)).intValue();
	 val1 = Integer.toString(j);
	if(j==-1){
	%>
	<option value = <%=val1%> selected>Choose 3rd MidFielder</option>
	<%}else{
		%>
<option value = <%=val1%> selected><%=((Player)mf.get(j)).getPlayer_name() %></option>
	<%}}
	for(int i=0;i<mf.size();++i){
           String val = Integer.toString(i);
           String playername=((Player)mf.get(i)).getPlayer_name();
            %>
          	<option value = <%=val%> ><%=playername%></option>
			<%}%>				
			</select></p>

<p>	<select name="mf4" id="mf4" >
<%
if(tmpteamplayers.size()==0){
j=-1; 
val1 = Integer.toString(j);%>
<option value = <%=val1%> selected>Choose 4th MidFielder</option>
<%}else{
	 j=((Integer)tmpteamplayers.elementAt(10)).intValue();
	 val1 = Integer.toString(j);
	if(j==-1){
	%>
	<option value = <%=val1%> selected>Choose 4th MidFielder</option>
	<%}else{
		%>
<option value = <%=val1%> selected><%=((Player)mf.get(j)).getPlayer_name() %></option>
	<%}}
	for(int i=0;i<mf.size();++i){
           String val = Integer.toString(i);
           String playername=((Player)mf.get(i)).getPlayer_name();
            %>
          	<option value = <%=val%> ><%=playername%></option>
			<%}%>				
			</select></p>

<p>	<select name="mf5" id="mf5" >
<%
if(tmpteamplayers.size()==0){
j=-1; 
val1 = Integer.toString(j);%>
<option value = <%=val1%> selected>Choose 5th MidFielder(Sub)</option>
<%}else{
	 j=((Integer)tmpteamplayers.elementAt(11)).intValue();
	 val1 = Integer.toString(j);
	if(j==-1){
	%>
	<option value = <%=val1%> selected>Choose 5th MidFielder(Sub)</option>
	<%}else{
		%>
<option value = <%=val1%> selected><%=((Player)mf.get(j)).getPlayer_name() %>(Sub)</option>
	<%}}
	for(int i=0;i<mf.size();++i){
           String val = Integer.toString(i);
           String playername=((Player)mf.get(i)).getPlayer_name();
            %>
          	<option value = <%=val%> ><%=playername%></option>
			<%}%>				
			</select></p>

<p>  		<font color="#006AC3" size="4.0" align="left"> Forwards:</font></p>               	
                       <% Vector ff=allplayers.getForwards();
                       int ff1=0;int ff2=0;%>	    	
	<p>	<select name="ff1" id="ff1" >
<%
if(tmpteamplayers.size()==0){
j=-1; 
val1 = Integer.toString(j);%>
<option value = <%=val1%> selected>Choose 1st Forward</option>
<%}else{
	 j=((Integer)tmpteamplayers.elementAt(12)).intValue();
	 val1 = Integer.toString(j);
	if(j==-1){
	%>
	<option value = <%=val1%> selected>Choose 1st Forward</option>
	<%}else{
		%>
<option value = <%=val1%> selected><%=((Player)ff.get(j)).getPlayer_name() %></option>
	<%}}
	for(int i=0;i<ff.size();++i){
           String val = Integer.toString(i);
           String playername=((Player)ff.get(i)).getPlayer_name();
            %>
          	<option value = <%=val%> ><%=playername%></option>
			<%}%>				
			</select></p>
			
<p>	<select name="ff2" id="ff2" >
<%
if(tmpteamplayers.size()==0){
j=-1; 
val1 = Integer.toString(j);%>
<option value = <%=val1%> selected>Choose 2nd Forward</option>
<%}else{
	 j=((Integer)tmpteamplayers.elementAt(13)).intValue();
	 val1 = Integer.toString(j);
	if(j==-1){
	%>
	<option value = <%=val1%> selected>Choose 2nd Forward</option>
	<%}else{
		%>
<option value = <%=val1%> selected><%=((Player)ff.get(j)).getPlayer_name() %></option>
	<%}}
	for(int i=0;i<ff.size();++i){
           String val = Integer.toString(i);
           String playername=((Player)ff.get(i)).getPlayer_name();
            %>
          	<option value = <%=val%> ><%=playername%></option>
			<%}%>				
			</select></p>

<p>	<select name="ff3" id="ff3" >
<%
if(tmpteamplayers.size()==0){
j=-1; 
val1 = Integer.toString(j);%>
<option value = <%=val1%> selected>Choose 3rd Forward(Sub)</option>
<%}else{
	 j=((Integer)tmpteamplayers.elementAt(14)).intValue();
	 val1 = Integer.toString(j);
	if(j==-1){
	%>
	<option value = <%=val1%> selected>Choose 3rd Forward(Sub)</option>
	<%}else{
		%>
<option value = <%=val1%> selected><%=((Player)ff.get(j)).getPlayer_name() %>(Sub)</option>
	<%}}
	for(int i=0;i<ff.size();++i){
           String val = Integer.toString(i);
           String playername=((Player)ff.get(i)).getPlayer_name();
            %>
          	<option value = <%=val%> ><%=playername%></option>
			<%}%>				
			</select></p>
				
				

            <p><input id="loginsubmit" value="Confirm" name="Submit" type="submit" class="submit" /></p>
				        </form>
				
			<%} %>
		</div> <!-- CONTENT END -->

		<div id="border">
			<p><font color="#006AC3" size="2.5">Team name:</font><font size="3.0"> <%=user.getTeamname()%></font></p>

	

			<form id="view" method="post" action="ModifySelectTeamView.jsp">
<input id="GK" value="GK" name="Submit" type="submit" class="submitmerge1"/>
<input id="DF" value="DF" name="Submit" type="submit" class="submitmerge1"/>&nbsp
<input id="MF" value="MF" name="Submit" type="submit" class="submitmerge1"/>&nbsp
<input id="FF" value="FF" name="Submit" type="submit" class="submitmerge1"/>&nbsp
			</form>

			<hr />
<font size="1.5">
			<form id="view" method="post" action="SetSelectTeam1.jsp">
			<table cellspacing="5"  width="">
			<tr>
            <td><input id="Name" value="Name" name="Submit" type="submit" class="submitmerge1"/></td>
            <td><input id="Club" value="Club" name="Submit" type="submit" class="submitmerge1"/></td>
	    <td><input id="Val" value="Val" name="Submit" type="submit" class="submitmerge1"/></td>
		<td><input id="Pts" value="Pts" name="Submit" type="submit" class="submitmerge1"/></td>
		</form>
<%

String currentview=(String)session.getAttribute("currentpositionview");
int currentindex=(Integer)session.getAttribute("currentindex");
int check=0;
Vector v= new Vector();
if(currentview.equals("Goalkeepers"))
{
v=allplayers.getGoalkeepers();
}
else if(currentview.equals("Defenders"))
{
v=allplayers.getDefenders();
}
else if(currentview.equals("Midfielders"))
{
v=allplayers.getMidfielders();
}
else if(currentview.equals("Forwards"))
{
v=allplayers.getForwards();
}
for(int i=0;i<10;i++){
		if(currentindex+i < v.size()){  
		check=0; 
         Player p = (Player)v.get(currentindex+i);
%>
</tr>
<tr>
        <td><%= p.getPlayer_name()%></td>
            <td><%= p.getClub_name()%></td>
	    <td><%= p.getValue()%></td>
		<td><%= p.getTotal_score()%></td>            
</tr>
<%}
else{check=1;}
}%>       
 
<tr>
<form id="view" method="post" action="ModifySelectTeamView.jsp">
<td>
<% if(currentindex!=0){ %>
<input id="prev" value="<<Prev" name="Submit" type="submit" class="submitmerge"/>
<%}%>
</td>
<td> </td>
<td> </td>
<td>
<%if(check!=1){%>
<input id="next" value="Next>>" name="Submit" type="submit" class="submitmerge"/>
<%}%>
</td>

</form>
</tr>
</table>
    
</font>
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
