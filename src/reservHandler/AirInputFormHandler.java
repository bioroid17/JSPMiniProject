package reservHandler;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import user.UserDao;
import user.UserDataBean;

@Controller
public class AirInputFormHandler implements CommandHandler{
	
	@Resource
	private UserDao userDao;
	
	@RequestMapping("Mini/reservair/airinputForm")
	@Override
	public ModelAndView process(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		
		String userId = request.getParameter("userId");
		UserDataBean dto = userDao.getUser(userId);
		
		int reNum = 0;
		
		
		request.setAttribute("userId", userId);
		request.setAttribute("dto", dto);
		request.setAttribute("reNum", reNum);
		
		return new ModelAndView("reservair/airinputForm");
	}

}
