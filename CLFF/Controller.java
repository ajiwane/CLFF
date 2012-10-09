import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import package1.UserBean;
public class Controller extends HttpServlet {

	private static final long serialVersionUID = 1L;	

	public void doGet(HttpServletRequest request, HttpServletResponse response)
	throws ServletException, IOException {
		HttpSession session = request.getSession(true);
		UserBean user=(UserBean)session.getAttribute("user");		
		String action=user.getAction();
		
		if(action.equals("Register")){
			Register.checkRegister(session, response);			
		}
		else if(action.equals("Login")){
			Login.checkLogin(session, response);					
		}
		else if(action.equals("forgotPassword")){
			FPassword.checkFP(session, response);					
		}
		else if(action.equals("secretQuestion")){
			SQuestion.checkSQ(session, response);					
		}
		else if(action.equals("changePassword")){
			ChangePwd.checkCP(session, response);					
		}
		else if(action.equals("Logout")){
			Logout.checkLogout(session, response);		
		}
		else if(action.equals("Overall")){
			Overall.checkOverall(session, response);		
		}
		else if(action.equals("Today")){
			Today.checkToday(session, response);		
		}
		else if(action.equals("favclub")){
			UserFav.checkFavClub(session, response);		
		}
		else if(action.equals("checkTimeTransfer")){
			Time.checkTime(session, response);		
		}
		else if(action.equals("checkTimeTeam")){
			Time.checkTime(session, response);		
		}
		else if(action.equals("checkTimeSelectTeam")){
			Time.checkTime(session, response);		
		}
		else if(action.equals("MyTeam")){
			MyTeam.checkMyTeam(session, response);		
		}
		else if(action.equals("MakeTeam")){
			MakeTeam.checkMakeTeam(session, response);		
		}
		else if(action.equals("Change")){
			Change.checkChange(session, response);		
		}
		else if(action.equals("showLeague")){
			ShowLeague.checkShow(session, response);		
		}
		else if(action.equals("createLeague")){
			CreateLeague.checkCreate(session, response);		
		}
		else if(action.equals("joinLeague")){
			JoinLeague.checkJoin(session, response);		
		}
		else if(action.equals("setTransfer")){
			SetTransfer.checkSetTransfer(session, response);		
		}
		else if(action.equals("setSelectTeam")){
			SetSelectTeam.checkSetSelectTeam(session, response);		
		}
		else if(action.equals("showResults")){
			Results.checkResults(session, response);		
		}
		else if(action.equals("MakeTransfer")){
			MakeTransfer.checkMakeTransfer(session, response);
		}
		else if(action.equals("showClubs1")){
			Clubs.checkClubs(session, response);		
		}
		else if(action.equals("showClubs2")){
			Clubs.checkClubs(session, response);		
		}
		else if(action.equals("showClubs3Register")){
			Clubs.checkClubs(session, response);		
		}
		else if(action.equals("showPlayers")){
			ShowPlayers.checkPlayers(session, response);		
		}
		else if(action.equals("viewClub")){
			ViewClub.checkClub(session, response);		
		}
			
	}
	public void doPost(HttpServletRequest request, HttpServletResponse response)
	throws ServletException, IOException {
		doGet(request,response);
	}
}
	