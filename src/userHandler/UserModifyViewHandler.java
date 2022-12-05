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
public class UserModifyViewHandler implements CommandHandler {
	
	@Resource
	private UserDao userDao;
	
	@RequestMapping("Mini/user/usermodifyView")
	@Override
	public ModelAndView process(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		
		String userId = request.getParameter("userId");
		String userPasswd = request.getParameter( "userPasswd" );	
		int result = userDao.check( userId, userPasswd );
		
		request.setAttribute( "result", result );
		
		if( result != 0 ) {
			UserDataBean dto = userDao.getUser( userId );
			request.setAttribute( "dto", dto );
		}
		
		return new ModelAndView("user/usermodifyView");
	}

}
