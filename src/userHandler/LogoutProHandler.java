package userHandler;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class LogoutProHandler implements CommandHandler{
	@RequestMapping("Mini/user/logoutPro")
	@Override
	public ModelAndView process(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		
		request.getSession().removeAttribute("memId");
		
		return new ModelAndView("user/airportmain");
	}
}
