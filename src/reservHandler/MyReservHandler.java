package reservHandler;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import reserv.AirDataBean;
import reserv.ReservDao;
import user.UserDao;
import user.UserDataBean;

@Controller
public class MyReservHandler implements CommandHandler {
	
	@Resource
	private UserDao userDao;
	
	@Resource
	private ReservDao reservDao;
	
	@RequestMapping("Mini/reservair/myReserv")
	@Override
	public ModelAndView process(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		int count = 0;
		
		String userId = request.getParameter("userId");
		UserDataBean dto = userDao.getUser(userId);
		
		
		count = reservDao.reservCount(userId);
		request.setAttribute("count", count);
		
		if(count != 0) {
			List<AirDataBean> rto = reservDao.getMyList(userId);
			request.setAttribute("userId", userId);
			request.setAttribute("rto", rto);
		}
		
		request.setAttribute("dto", dto);
		
		return new ModelAndView("reservair/myReserv");
	}

}
