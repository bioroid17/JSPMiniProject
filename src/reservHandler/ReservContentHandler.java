package reservHandler;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import reserv.AirDao;
import reserv.AirDataBean;
import user.UserDao;
import user.UserDataBean;

@Controller
public class ReservContentHandler implements CommandHandler{
	
	@Resource
	private UserDao userDao;
	
	@Resource
	private AirDao airDao;
	
	@RequestMapping("Mini/reservair/reservcontent")
	@Override
	public ModelAndView process(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		
		String userId = request.getParameter("userId");
		int reNum = Integer.parseInt(request.getParameter("reNum"));
		
		UserDataBean dto = userDao.getUser(userId);
		AirDataBean ato = airDao.getAirContent(reNum);
		
		request.setAttribute("userId", userId);
		request.setAttribute("dto", dto); // 유저
		request.setAttribute("ato", ato); // 비행기 정보
		
		return new ModelAndView("reservair/reservcontent");
	}

}
