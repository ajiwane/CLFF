package package1;
import java.util.*;
public class UserBean {
	String login="";
	String password="";
	String cpassword="";
	String teamname="";
	String fname="";
	String lname="";
	String club="Chelsea";
	String question="What is your date of birth?";
	String answer="";
	String action;
	String errorMessage="none";
	Vector leagues=new Vector();
	Vector players=new Vector();
	int score;
	int score_today;
	int overall_rank;
	float value;
	String from_change;
	String to_change;
	String createLeagueName="";
	String createLeagueID="";
	String createLeaguecID="";
	String joinLeagueName="";
	String joinLeagueID="";
	String joinLeaguecID="";
	String viewLeagueNo;
	String matchday="";
	String clubview="";
	Vector newplayers = new Vector();
	Vector tmpnewplayers=new Vector();
	Vector tmpnewteamvalues=new Vector();
	float tmpvalue;
	String selectionAllowed="";
	String deadline="";
	public String getDeadline() {
		return deadline;
	}
	public void setDeadline(String deadline) {
		this.deadline = deadline;
	}
	public String getSelectionAllowed() {
		return selectionAllowed;
	}
	public void setSelectionAllowed(String selectionAllowed) {
		this.selectionAllowed = selectionAllowed;
	}
	public Vector getNewplayers() {
		return newplayers;
	}
	public void setNewplayers(Vector newplayers) {
		this.newplayers = newplayers;
	}
	public String getMatchday() {
		return matchday;
	}
	public void setMatchday(String matchday) {
		this.matchday = matchday;
	}
	public String getViewLeagueNo() {
		return viewLeagueNo;
	}
	public void setViewLeagueNo(String viewLeagueNo) {
		this.viewLeagueNo = viewLeagueNo;
	}
	public String getCreateLeaguecID() {
		return createLeaguecID;
	}
	public void setCreateLeaguecID(String createLeaguecID) {
		this.createLeaguecID = createLeaguecID;
	}
	public String getCreateLeagueID() {
		return createLeagueID;
	}
	public void setCreateLeagueID(String createLeagueID) {
		this.createLeagueID = createLeagueID;
	}
	public String getCreateLeagueName() {
		return createLeagueName;
	}
	public void setCreateLeagueName(String createLeagueName) {
		this.createLeagueName = createLeagueName;
	}
	public String getFrom_change() {
		return from_change;
	}
	public void setFrom_change(String from_change) {
		this.from_change = from_change;
	}
	public String getTo_change() {
		return to_change;
	}
	public void setTo_change(String to_change) {
		this.to_change = to_change;
	}
	public float getValue() {
		return value;
	}
	public void setValue(float value) {
		this.value = value;
	}
	public int getOverall_rank() {
		return overall_rank;
	}
	public void setOverall_rank(int overall_rank) {
		this.overall_rank = overall_rank;
	}
	public int getScore() {
		return score;
	}
	public void setScore(int score) {
		this.score = score;
	}
	public int getScore_today() {
		return score_today;
	}
	public void setScore_today(int score_today) {
		this.score_today = score_today;
	}
	public String getErrorMessage() {
		return errorMessage;
	}
	public void setErrorMessage(String errorMessage) {
		this.errorMessage = errorMessage;
	}
	//AddressBook book;
	public String getAction() {
		return action;
	}
	public void setAction(String action) {
		this.action = action;
	}
	public String getCpassword() {
		return cpassword;
	}
	public void setCpassword(String cpassword) {
		this.cpassword = cpassword;
	}
	public String getLogin() {
		return login;
	}
	public void setLogin(String login) {
		this.login = login;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getAnswer() {
		return answer;
	}
	public void setAnswer(String answer) {
		this.answer = answer;
	}
	public String getClub() {
		return club;
	}
	public void setClub(String club) {
		this.club = club;
	}
	public String getQuestion() {
		return question;
	}
	public void setQuestion(String question) {
		this.question = question;
	}
	public String getFname() {
		return fname;
	}
	public void setFname(String fname) {
		this.fname = fname;
	}
	public String getLname() {
		return lname;
	}
	public void setLname(String lname) {
		this.lname = lname;
	}
	public String getTeamname() {
		return teamname;
	}
	public void setTeamname(String teamname) {
		this.teamname = teamname;
	}
	public Vector getLeagues() {
		return leagues;
	}
	public void setLeagues(Vector leagues) {
		this.leagues = leagues;
	}
	public Vector getPlayers() {
		return players;
	}
	public void setPlayers(Vector players) {
		this.players = players;
	}
	public String getJoinLeaguecID() {
		return joinLeaguecID;
	}
	public void setJoinLeaguecID(String joinLeaguecID) {
		this.joinLeaguecID = joinLeaguecID;
	}
	public String getJoinLeagueID() {
		return joinLeagueID;
	}
	public void setJoinLeagueID(String joinLeagueID) {
		this.joinLeagueID = joinLeagueID;
	}
	public String getJoinLeagueName() {
		return joinLeagueName;
	}
	public void setJoinLeagueName(String joinLeagueName) {
		this.joinLeagueName = joinLeagueName;
	}
	public String getClubview() {
		return clubview;
	}
	public void setClubview(String clubview) {
		this.clubview = clubview;
	}
	public Vector getTmpnewplayers() {
		return tmpnewplayers;
	}
	public void setTmpnewplayers(Vector tmpnewplayers) {
		this.tmpnewplayers = tmpnewplayers;
	}
	public float getTmpvalue() {
		return tmpvalue;
	}
	public void setTmpvalue(float tmpvalue) {
		this.tmpvalue = tmpvalue;
	}
	public Vector getTmpnewteamvalues() {
		return tmpnewteamvalues;
	}
	public void setTmpnewteamvalues(Vector tmpnewteamvalues) {
		this.tmpnewteamvalues = tmpnewteamvalues;
	}
	
}
