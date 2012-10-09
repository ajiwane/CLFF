import java.io.IOException;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

;public abstract class Logout {

	public static void checkLogout(HttpSession session,HttpServletResponse response) throws IOException
	   {
		session.invalidate();
		response.sendRedirect("Login.jsp");
	   }
}

