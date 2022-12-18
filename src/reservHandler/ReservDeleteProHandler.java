package reservHandler;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import reserv.ReservDao;
import user.UserDao;
import user.UserDataBean;

@Controller
public class ReservDeleteProHandler implements CommandHandler {
	
	@Resource
	private UserDao userDao;
	
	@Resource
	private ReservDao reservDao;
	
	@RequestMapping("Mini/reservair/reservdeletePro")
	@Override
	public ModelAndView process(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		int reservNum = Integer.parseInt(request.getParameter("reservNum"));
		String userId = request.getParameter("userId");
		UserDataBean dto = userDao.getUser(userId);
		request.setAttribute("userId", userId);
		request.setAttribute("dto", dto);
		
		
		int resultCheck = reservDao.reservCheck(reservNum, userId);
		request.setAttribute("resultCheck", resultCheck);
		
		if(resultCheck != 0) {
			int result = reservDao.deleteReserv(reservNum);
			request.setAttribute("result", result);
		}
		
		return new ModelAndView("reservair/reservdeletePro");
	}

}
