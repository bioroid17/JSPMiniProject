package userHandler;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import user.UserDao;

@Controller
public class LoginProHandler implements CommandHandler {
	
	@Resource
	private UserDao userDao;
	
	@RequestMapping("Mini/user/loginPro")
	@Override
	public ModelAndView process(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		
		String userId = request.getParameter("userId");
		String userPasswd = request.getParameter("userPasswd");
		
		int result = userDao.check(userId, userPasswd); // 아이디와 비밀번호 일치하는지 체크
		
		request.setAttribute("result", result);
		request.setAttribute("userId", userId);
		
		return new ModelAndView("user/loginPro");
	}
}
