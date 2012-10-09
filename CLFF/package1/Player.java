package package1;

public class Player {
String player_name;
String club_name="";
int jersey_no=-1;
String position;
float value;
String today_played;
int today_score;
int total_score;
int total_played_game;
int total_played_60_min;
int total_goal_scored;
int total_goal_assist;
int total_no_conceed;
int total_penalty_saved;
int total_penalty_created;
int total_penalty_missed;
int total_2_goal_conceed;
int total_yellow_card;
int total_red_card;
int total_3_saves;
public int getTotal_2_goal_conceed() {
	return total_2_goal_conceed;
}
public void setTotal_2_goal_conceed(int total_2_goal_conceed) {
	this.total_2_goal_conceed = total_2_goal_conceed;
}
public int getTotal_3_saves() {
	return total_3_saves;
}
public void setTotal_3_saves(int total_3_saves) {
	this.total_3_saves = total_3_saves;
}
public int getTotal_goal_assist() {
	return total_goal_assist;
}
public void setTotal_goal_assist(int total_goal_assist) {
	this.total_goal_assist = total_goal_assist;
}
public int getTotal_goal_scored() {
	return total_goal_scored;
}
public void setTotal_goal_scored(int total_goal_scored) {
	this.total_goal_scored = total_goal_scored;
}
public int getTotal_no_conceed() {
	return total_no_conceed;
}
public void setTotal_no_conceed(int total_no_conceed) {
	this.total_no_conceed = total_no_conceed;
}
public int getTotal_penalty_created() {
	return total_penalty_created;
}
public void setTotal_penalty_created(int total_penalty_created) {
	this.total_penalty_created = total_penalty_created;
}
public int getTotal_penalty_missed() {
	return total_penalty_missed;
}
public void setTotal_penalty_missed(int total_penalty_missed) {
	this.total_penalty_missed = total_penalty_missed;
}
public int getTotal_penalty_saved() {
	return total_penalty_saved;
}
public void setTotal_penalty_saved(int total_penalty_saved) {
	this.total_penalty_saved = total_penalty_saved;
}
public int getTotal_played_60_min() {
	return total_played_60_min;
}
public void setTotal_played_60_min(int total_played_60_min) {
	this.total_played_60_min = total_played_60_min;
}
public int getTotal_played_game() {
	return total_played_game;
}
public void setTotal_played_game(int total_played_game) {
	this.total_played_game = total_played_game;
}
public int getTotal_red_card() {
	return total_red_card;
}
public void setTotal_red_card(int total_red_card) {
	this.total_red_card = total_red_card;
}
public int getTotal_yellow_card() {
	return total_yellow_card;
}
public void setTotal_yellow_card(int total_yellow_card) {
	this.total_yellow_card = total_yellow_card;
}
public String getClub_name() {
	return club_name;
}
public void setClub_name(String club_name) {
	this.club_name = club_name;
}
public int getJersey_no() {
	return jersey_no;
}
public void setJersey_no(int jersey_no) {
	this.jersey_no = jersey_no;
}
public String getPlayer_name() {
	return player_name;
}
public void setPlayer_name(String player_name) {
	this.player_name = player_name;
}
public String getPosition() {
	return position;
}
public void setPosition(String position) {
	this.position = position;
}
public int getToday_score() {
	return today_score;
}
public void setToday_score(int today_score) {
	this.today_score = today_score;
}
public float getValue() {
	return value;
}
public void setValue(float value) {
	this.value = value;
}
public String getToday_played() {
	return today_played;
}
public void setToday_played(String today_played) {
	this.today_played = today_played;
}
public int getTotal_score() {
	return total_score;
}
public void setTotal_score(int total_score) {
	this.total_score = total_score;
}
public boolean equal(Player p)
{
	if(p==null)
	{
		return false;
	}
	
	
	else if((this.getClub_name()).equals(p.getClub_name()) && (this.getJersey_no())==p.getJersey_no()) 
			{return true;}
	else {return false;}
			
}
}
