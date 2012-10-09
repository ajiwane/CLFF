package package1;

import java.util.Vector;

public class AllPlayers {
	Vector goalkeepers=new Vector();
	Vector defenders=new Vector();
	Vector midfielders=new Vector();
	Vector forwards=new Vector();
	public Vector getDefenders() {
		return defenders;
	}
	public void setDefenders(Vector defenders) {
		this.defenders = defenders;
	}
	public Vector getForwards() {
		return forwards;
	}
	public void setForwards(Vector forwards) {
		this.forwards = forwards;
	}
	public Vector getGoalkeepers() {
		return goalkeepers;
	}
	public void setGoalkeepers(Vector goalkeepers) {
		this.goalkeepers = goalkeepers;
	}
	public Vector getMidfielders() {
		return midfielders;
	}
	public void setMidfielders(Vector midfielders) {
		this.midfielders = midfielders;
	}
	
}
