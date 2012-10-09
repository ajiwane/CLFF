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
                
                	<h1>Transfers</h1>
                	<%if(user.getSelectionAllowed().equals("NoTransfer")){ %>
                	<p>You are not allowed to make transfers now.</p>
                	<%}else if(user.getSelectionAllowed().equals("AllowTransfer")){ %>

<p> 			<font color="#006AC3" size="4.0" align="left"> Budget:</font> 
<font size="4.0"> <%=user.getValue()%>m$</font></p>
<%
	if(user.getErrorMessage().equals("Select All Different Players"))
		out.println("<P><font color=\"red\">Select All Different Players.</font></P>");
	else if(user.getErrorMessage().equals("Total Value must be less than 100m$"))
		out.println("<P><font color=\"red\">Total Value must be less than 100m$.</font></P>");
	user.setErrorMessage("none");
%>	
 <form method="POST" id="loginform" action="ModifyTransfer.jsp" class="box">
<p>  		<font color="#006AC3" size="4.0"> Goalkeepers:</font></p>               	
                
           <% Vector gk=allplayers.getGoalkeepers();
           Vector teamplayers=user.getPlayers();
  			int gk1=0;
  			String tmpplayer=new String();
  			%>	
<p>	<select name="gk1" id="gk1" >
	<%
	int gkcheck1=0;
	
	for(int j=0;j<15;++j)
	{
	if((((Player)teamplayers.get(j)).getPosition()).equals("Goalkeeper"))
	{
		tmpplayer=((Player)teamplayers.get(j)).getPlayer_name();
	gk1=j;break;
	}}
	
	for(int i=0;i<gk.size();++i){
           String val = Integer.toString(i);
           String playername=((Player)gk.get(i)).getPlayer_name();
           if(tmpplayer.equals(playername) ||  tmpplayer.equals(playername+"(C)") || tmpplayer.equals(playername+"(S1)") || tmpplayer.equals(playername+"(S2)") || tmpplayer.equals(playername+"(S3)") || tmpplayer.equals(playername+"(S4)"))
           {
           gkcheck1=1;
           }
           if(gkcheck1==1)
           {gkcheck1=2;%>
           <option value = <%=val%> selected><%=tmpplayer%></option>
	       <%}
			else{%>
			<option value = <%=val%> ><%=playername%></option>
			<%}}
			
			%>				
			</select></p>

<p><select name="gk2" id="gk2" >
	<%
	int gkcheck2=0;
	for(int j=gk1+1;j<15;++j)
	{
	if((((Player)teamplayers.get(j)).getPosition()).equals("Goalkeeper"))
	{
		tmpplayer=((Player)teamplayers.get(j)).getPlayer_name();
		break;
	}}
	for(int i=0;i<gk.size();++i){
String val = Integer.toString(i);
           String playername=((Player)gk.get(i)).getPlayer_name();
           if(tmpplayer.equals(playername) ||  tmpplayer.equals(playername+"(C)") || tmpplayer.equals(playername+"(S1)") || tmpplayer.equals(playername+"(S2)") || tmpplayer.equals(playername+"(S3)") || tmpplayer.equals(playername+"(S4)"))
           {
           gkcheck2=1;
           }
           if(gkcheck2==1)
           {gkcheck2=2;%>
           <option value = <%=val%> selected><%=tmpplayer%></option>
	       <%}
			else{%>
			<option value = <%=val%> ><%=playername%></option>
			<%}}
			
			%>		
				</select></p>
				
<p>  		<font color="#006AC3" size="4.0" align="left"> Defenders:</font></p>               	
                	<% Vector df=allplayers.getDefenders();
                	int df1=0;int df2=0;int df3=0;int df4=0;
                	%>	
                	
	<p>	<select name="df1" id="df1" >
						<%
	int dfcheck1=0;
	for(int j=0;j<15;++j)
	{
	if((((Player)teamplayers.get(j)).getPosition()).equals("Defender"))
	{
		tmpplayer=((Player)teamplayers.get(j)).getPlayer_name();
	df1=j;break;
	}}
	for(int i=0;i<df.size();++i){
           String val = Integer.toString(i);
           String playername=((Player)df.get(i)).getPlayer_name();
		   if(tmpplayer.equals(playername) ||  tmpplayer.equals(playername+"(C)") || tmpplayer.equals(playername+"(S1)") || tmpplayer.equals(playername+"(S2)") || tmpplayer.equals(playername+"(S3)") || tmpplayer.equals(playername+"(S4)"))
           {
           dfcheck1=1;
		   }
           if(dfcheck1==1)
           {dfcheck1=2;%>
           <option value = <%=val%> selected><%=tmpplayer%></option>
	       <%}
			else{%>
			<option value = <%=val%> ><%=playername%></option>
			<%}}%>	
			</select></p>
		
<p><select name="df2" id="df2" >
								<%
	int dfcheck2=0;
	for(int j=df1+1;j<15;++j)
	{
	if((((Player)teamplayers.get(j)).getPosition()).equals("Defender"))
	{
		tmpplayer=((Player)teamplayers.get(j)).getPlayer_name();
	df2=j;break;
	}}
	for(int i=0;i<df.size();++i){
           String val = Integer.toString(i);
           String playername=((Player)df.get(i)).getPlayer_name();
		   if(tmpplayer.equals(playername) ||  tmpplayer.equals(playername+"(C)") || tmpplayer.equals(playername+"(S1)") || tmpplayer.equals(playername+"(S2)") || tmpplayer.equals(playername+"(S3)") || tmpplayer.equals(playername+"(S4)"))
           {
           dfcheck2=1;
		   }
           if(dfcheck2==1)
           {dfcheck2=2;%>
           <option value = <%=val%> selected><%=tmpplayer%></option>
	       <%}
			else{%>
			<option value = <%=val%> ><%=playername%></option>
			<%}}%>		
				</select></p>

<p><select name="df3" id="df3" >
								<%
	int dfcheck3=0;
	for(int j=df2+1;j<15;++j)
	{
	if((((Player)teamplayers.get(j)).getPosition()).equals("Defender"))
	{
		tmpplayer=((Player)teamplayers.get(j)).getPlayer_name();
	df3=j;break;
	}}
	for(int i=0;i<df.size();++i){
           String val = Integer.toString(i);
           String playername=((Player)df.get(i)).getPlayer_name();
		   if(tmpplayer.equals(playername) ||  tmpplayer.equals(playername+"(C)") || tmpplayer.equals(playername+"(S1)") || tmpplayer.equals(playername+"(S2)") || tmpplayer.equals(playername+"(S3)") || tmpplayer.equals(playername+"(S4)"))
           {
           dfcheck3=1;
		   }
           if(dfcheck3==1)
           {dfcheck3=2;%>
           <option value = <%=val%> selected><%=tmpplayer%></option>
	       <%}
			else{%>
			<option value = <%=val%> ><%=playername%></option>
			<%}}%>			
				</select></p>

<p><select name="df4" id="df4" >
								<%
	int dfcheck4=0;
	for(int j=df3+1;j<15;++j)
	{
	if((((Player)teamplayers.get(j)).getPosition()).equals("Defender"))
	{
		tmpplayer=((Player)teamplayers.get(j)).getPlayer_name();
	df4=j;break;
	}}
	for(int i=0;i<df.size();++i){
           String val = Integer.toString(i);
           String playername=((Player)df.get(i)).getPlayer_name();
		   if(tmpplayer.equals(playername) ||  tmpplayer.equals(playername+"(C)") || tmpplayer.equals(playername+"(S1)") || tmpplayer.equals(playername+"(S2)") || tmpplayer.equals(playername+"(S3)") || tmpplayer.equals(playername+"(S4)"))
           {
           dfcheck4=1;
		   }
           if(dfcheck4==1)
           {dfcheck4=2;%>
           <option value = <%=val%> selected><%=tmpplayer%></option>
	       <%}
			else{%>
			<option value = <%=val%> ><%=playername%></option>
			<%}}%>		
				</select></p>

<p><select name="df5" id="df5" >
								<%
	int dfcheck5=0;
	for(int j=df4+1;j<15;++j)
	{
	if((((Player)teamplayers.get(j)).getPosition()).equals("Defender"))
	{
		tmpplayer=((Player)teamplayers.get(j)).getPlayer_name();
		break;
	}}
	for(int i=0;i<df.size();++i){
           String val = Integer.toString(i);
           String playername=((Player)df.get(i)).getPlayer_name();
		   if(tmpplayer.equals(playername) ||  tmpplayer.equals(playername+"(C)") || tmpplayer.equals(playername+"(S1)") || tmpplayer.equals(playername+"(S2)") || tmpplayer.equals(playername+"(S3)") || tmpplayer.equals(playername+"(S4)"))
           {
           dfcheck5=1;
		   }
           if(dfcheck5==1)
           {dfcheck5=2;%>
           <option value = <%=val%> selected><%=tmpplayer%></option>
	       <%}
			else{%>
			<option value = <%=val%> ><%=playername%></option>
			<%}}%>		
				</select></p>
<p><font color="#006AC3" size="4.0" align="left"> MidFielders:</font></p>               	

                       <% Vector mf=allplayers.getMidfielders();
                	int mf1=0;int mf2=0;int mf3=0;int mf4=0;
                	%>	
	<p>	<select name="mf1" id="mf1" >
						<%
	int mfcheck1=0;
	for(int j=0;j<15;++j)
	{
	if((((Player)teamplayers.get(j)).getPosition()).equals("Midfielder"))
	{
		tmpplayer=((Player)teamplayers.get(j)).getPlayer_name();
	mf1=j;break;
	}}
	for(int i=0;i<mf.size();++i){
           String val = Integer.toString(i);
           String playername=((Player)mf.get(i)).getPlayer_name();
		   if(tmpplayer.equals(playername) ||  tmpplayer.equals(playername+"(C)") || tmpplayer.equals(playername+"(S1)") || tmpplayer.equals(playername+"(S2)") || tmpplayer.equals(playername+"(S3)") || tmpplayer.equals(playername+"(S4)"))
           {
           mfcheck1=1;
		   }
           if(mfcheck1==1)
           {mfcheck1=2;%>
           <option value = <%=val%> selected><%=tmpplayer%></option>
	       <%}
			else{%>
			<option value = <%=val%> ><%=playername%></option>
			<%}}%>	
				</select></p>
<p><select name="mf2" id="mf2" >
															<%
	int mfcheck2=0;
	for(int j=mf1+1;j<15;++j)
	{
	if((((Player)teamplayers.get(j)).getPosition()).equals("Midfielder"))
	{
		tmpplayer=((Player)teamplayers.get(j)).getPlayer_name();
	mf2=j;break;
	}}
	for(int i=0;i<mf.size();++i){
           String val = Integer.toString(i);
           String playername=((Player)mf.get(i)).getPlayer_name();
		   if(tmpplayer.equals(playername) ||  tmpplayer.equals(playername+"(C)") || tmpplayer.equals(playername+"(S1)") || tmpplayer.equals(playername+"(S2)") || tmpplayer.equals(playername+"(S3)") || tmpplayer.equals(playername+"(S4)"))
           {
           mfcheck2=1;
		   }
           if(mfcheck2==1)
           {mfcheck2=2;%>
           <option value = <%=val%> selected><%=tmpplayer%></option>
	       <%}
			else{%>
			<option value = <%=val%> ><%=playername%></option>
			<%}}%>
				</select></p>

<p><select name="mf3" id="mf3" >
<%
	int mfcheck3=0;
	for(int j=mf2+1;j<15;++j)
	{
	if((((Player)teamplayers.get(j)).getPosition()).equals("Midfielder"))
	{
		tmpplayer=((Player)teamplayers.get(j)).getPlayer_name();
	mf3=j;break;
	}}
	for(int i=0;i<mf.size();++i){
           String val = Integer.toString(i);
           String playername=((Player)mf.get(i)).getPlayer_name();
		   if(tmpplayer.equals(playername) ||  tmpplayer.equals(playername+"(C)") || tmpplayer.equals(playername+"(S1)") || tmpplayer.equals(playername+"(S2)") || tmpplayer.equals(playername+"(S3)") || tmpplayer.equals(playername+"(S4)"))
           {
           mfcheck3=1;
		   }
           if(mfcheck3==1)
           {mfcheck3=2;%>
           <option value = <%=val%> selected><%=tmpplayer%></option>
	       <%}
			else{%>
			<option value = <%=val%> ><%=playername%></option>
			<%}}%>
				</select></p>

<p><select name="mf4" id="mf4" >
								<%
	int mfcheck4=0;
	for(int j=mf3+1;j<15;++j)
	{
	if((((Player)teamplayers.get(j)).getPosition()).equals("Midfielder"))
	{
		tmpplayer=((Player)teamplayers.get(j)).getPlayer_name();
	mf4=j;break;
	}}
	for(int i=0;i<mf.size();++i){
           String val = Integer.toString(i);
           String playername=((Player)mf.get(i)).getPlayer_name();
		   if(tmpplayer.equals(playername) ||  tmpplayer.equals(playername+"(C)") || tmpplayer.equals(playername+"(S1)") || tmpplayer.equals(playername+"(S2)") || tmpplayer.equals(playername+"(S3)") || tmpplayer.equals(playername+"(S4)"))
           {
           mfcheck4=1;
		   }
           if(mfcheck4==1)
           {mfcheck4=2;%>
           <option value = <%=val%> selected><%=tmpplayer%></option>
	       <%}
			else{%>
			<option value = <%=val%> ><%=playername%></option>
			<%}}%>	
				</select></p>

<p><select name="mf5" id="mf5" >
								<%
	int mfcheck5=0;
	for(int j=mf4+1;j<15;++j)
	{
	if((((Player)teamplayers.get(j)).getPosition()).equals("Midfielder"))
	{
		tmpplayer=((Player)teamplayers.get(j)).getPlayer_name();
		break;
	}}
	for(int i=0;i<mf.size();++i){
           String val = Integer.toString(i);
           String playername=((Player)mf.get(i)).getPlayer_name();
		   if(tmpplayer.equals(playername) ||  tmpplayer.equals(playername+"(C)") || tmpplayer.equals(playername+"(S1)") || tmpplayer.equals(playername+"(S2)") || tmpplayer.equals(playername+"(S3)") || tmpplayer.equals(playername+"(S4)"))
           {
           mfcheck4=1;
		   }
           if(mfcheck4==1)
           {mfcheck4=2;%>
           <option value = <%=val%> selected><%=tmpplayer%></option>
	       <%}
			else{%>
			<option value = <%=val%> ><%=playername%></option>
			<%}}%>	
				</select></p>

<p>  		<font color="#006AC3" size="4.0" align="left"> Forwards:</font></p>               	
                       <% Vector ff=allplayers.getForwards();
                       int ff1=0;int ff2=0;%>	    	
	<p>	<select name="ff1" id="ff1" >
						<%
	int ffcheck1=0;
	for(int j=0;j<15;++j)
	{
	if((((Player)teamplayers.get(j)).getPosition()).equals("Forward"))
	{
		tmpplayer=((Player)teamplayers.get(j)).getPlayer_name();
	ff1=j;break;
	}}
	for(int i=0;i<ff.size();++i){
           String val = Integer.toString(i);
           String playername=((Player)ff.get(i)).getPlayer_name();
		   if(tmpplayer.equals(playername) ||  tmpplayer.equals(playername+"(C)") || tmpplayer.equals(playername+"(S1)") || tmpplayer.equals(playername+"(S2)") || tmpplayer.equals(playername+"(S3)") || tmpplayer.equals(playername+"(S4)"))
           {
           ffcheck1=1;
		   }
           if(ffcheck1==1)
           {ffcheck1=2;%>
           <option value = <%=val%> selected><%=tmpplayer%></option>
	       <%}
			else{%>
			<option value = <%=val%> ><%=playername%></option>
			<%}}%>	
				</select></p>
<p><select name="ff2" id="ff2" >
									<%	int ffcheck2=0;
	for(int j=ff1+1;j<15;++j)
	{
	if((((Player)teamplayers.get(j)).getPosition()).equals("Forward"))
	{
		tmpplayer=((Player)teamplayers.get(j)).getPlayer_name();
	ff2=j;break;
	}}
	for(int i=0;i<ff.size();++i){
           String val = Integer.toString(i);
           String playername=((Player)ff.get(i)).getPlayer_name();
		   if(tmpplayer.equals(playername) ||  tmpplayer.equals(playername+"(C)") || tmpplayer.equals(playername+"(S1)") || tmpplayer.equals(playername+"(S2)") || tmpplayer.equals(playername+"(S3)") || tmpplayer.equals(playername+"(S4)"))
           {
           ffcheck2=1;
		   }
           if(ffcheck2==1)
           {ffcheck2=2;%>
           <option value = <%=val%> selected><%=tmpplayer%></option>
	       <%}
			else{%>
			<option value = <%=val%> ><%=playername%></option>
			<%}}%>	
				</select></p>

<p><select name="ff3" id="ff3" >
													<%
	int ffcheck3=0;
	for(int j=ff2+1;j<15;++j)
	{
	if((((Player)teamplayers.get(j)).getPosition()).equals("Forward"))
	{
		tmpplayer=((Player)teamplayers.get(j)).getPlayer_name();
	break;
	}}
	for(int i=0;i<ff.size();++i){
           String val = Integer.toString(i);
           String playername=((Player)ff.get(i)).getPlayer_name();
		   if(tmpplayer.equals(playername) ||  tmpplayer.equals(playername+"(C)") || tmpplayer.equals(playername+"(S1)") || tmpplayer.equals(playername+"(S2)") || tmpplayer.equals(playername+"(S3)") || tmpplayer.equals(playername+"(S4)"))
           {
           ffcheck3=1;
		   }
           if(ffcheck3==1)
           {ffcheck3=2;%>
           <option value = <%=val%> selected><%=tmpplayer%></option>
	       <%}
			else{%>
			<option value = <%=val%> ><%=playername%></option>
			<%}}%>	
				</select></p>
				
				<p>

            <p><input id="loginsubmit" value="Make Transfers" name="Submit" type="submit" class="submit" /></p>
				        </form>
				
			<%} %>
		</div> <!-- CONTENT END -->

		<div id="border">
			<p><font color="#006AC3" size="2.5">Team name:</font><font size="3.0"> <%=user.getTeamname()%></font></p>

	

			<form id="view" method="post" action="ModifyTransferView.jsp">
<input id="GK" value="GK" name="Submit" type="submit" class="submitmerge1"/>
<input id="DF" value="DF" name="Submit" type="submit" class="submitmerge1"/>&nbsp
<input id="MF" value="MF" name="Submit" type="submit" class="submitmerge1"/>&nbsp
<input id="FF" value="FF" name="Submit" type="submit" class="submitmerge1"/>&nbsp
			</form>

			<hr />
<font size="1.5">
			<form id="view" method="post" action="SetTransfer1.jsp">
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
<form id="view" method="post" action="ModifyTransferView.jsp">
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
