package userHandler;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import user.UserDao;
import user.UserDataBean;

@Controller
public class UserDeleteProHandler implements CommandHandler{
	
	@Resource
	private UserDao userDao;
	
	@RequestMapping("Mini/user/userdeletePro")
	@Override
	public ModelAndView process(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		
		String userId = request.getParameter("userId");
		String userPasswd = request.getParameter( "userPasswd" );
		
		int resultCheck = userDao.check( userId, userPasswd );
		
		request.setAttribute( "resultCheck", resultCheck );
		
		if( resultCheck != 0 ) {
			int result = userDao.deleteUser(userId);
			request.setAttribute("result", result);
		}
		
		return new ModelAndView("user/userdeletePro");
	}

}
