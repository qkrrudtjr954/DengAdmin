package delegator;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class Delegator {
	
	// singleton 싱글턴 
	private static Delegator delegator = null;
	
	private Delegator() {
		
	}
	
	public static Delegator getInstance() {
		if(delegator==null) {
			delegator = new Delegator();
		}
		
		return delegator;
	}
	
	// 유저가 로그인을 했는지 안했는지 체크하는 메소드 
	public static boolean checkSession(HttpServletRequest req, HttpServletResponse resp) {
		HttpSession session = req.getSession();
		if(session.getAttribute("current_user") == null) {
			return false;
		} else {
			return true;
		}
	}
}
