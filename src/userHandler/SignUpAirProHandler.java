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
public class SignUpAirProHandler implements CommandHandler {
	
	@Resource
	private UserDao userDao;
	
	@RequestMapping("Mini/user/signupAirPro")
	@Override
	public ModelAndView process(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		
		request.setCharacterEncoding("utf-8");
		String userId = request.getParameter("userId");
		
		UserDataBean dto = new UserDataBean();
		dto.setUserId(request.getParameter("userId"));
		dto.setUserPasswd(request.getParameter("userPasswd"));
		dto.setUserInfo(request.getParameter("userInfo"));
		dto.setUserName(request.getParameter("userName"));
		dto.setUserTel(request.getParameter("userTel"));
		
		
		int result = userDao.insertAirUser(dto);
		
		request.setAttribute("userId", userId);
		request.setAttribute("result", result);
	
		
		return new ModelAndView("user/signupAirPro");
	}
}
