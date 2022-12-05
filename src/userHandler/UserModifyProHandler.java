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
public class UserModifyProHandler implements CommandHandler {
	
	@Resource
	private UserDao userDao;
	
	@RequestMapping("Mini/user/usermodifyPro")
	@Override
	public ModelAndView process(HttpServletRequest request, HttpServletResponse response) throws Throwable {

		UserDataBean dto = new UserDataBean();
		dto.setUserId(request.getParameter("userId"));
		dto.setUserPasswd(request.getParameter("userPasswd"));
		dto.setUserTel(request.getParameter("userTel"));
		
		int result = userDao.modifyUser(dto);
		request.setAttribute("result", result);
		
		return new ModelAndView("user/usermodifyPro");
	}

}
