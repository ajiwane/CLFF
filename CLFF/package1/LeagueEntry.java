package package1;

public class LeagueEntry {
	String team_name;
	int score;
	int score_Today;
	int league_rank;
	String user_id;
	
	public int getLeague_rank() {
		return league_rank;
	}
	public void setLeague_rank(int league_rank) {
		this.league_rank = league_rank;
	}
	public int getScore() {
		return score;
	}
	public void setScore(int score) {
		this.score = score;
	}
	public int getScore_Today() {
		return score_Today;
	}
	public void setScore_Today(int score_Today) {
		this.score_Today = score_Today;
	}
	public String getTeam_name() {
		return team_name;
	}
	public void setTeam_name(String team_name) {
		this.team_name = team_name;
	}
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
}
