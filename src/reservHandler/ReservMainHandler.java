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

import reserv.AirDao;
import reserv.AirDataBean;
import user.UserDao;
import user.UserDataBean;

@Controller
public class ReservMainHandler implements CommandHandler {
	
	@Resource
	private UserDao userDao;
	
	@Resource
	private AirDao airDao;
	
	@RequestMapping("Mini/reservair/reservmain")
	@Override
	public ModelAndView process(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		int count = 0;
		
		String userId = request.getParameter("userId");
		UserDataBean dto = userDao.getUser(userId);
		request.setAttribute("userId", userId);
		request.setAttribute("dto", dto);
		
		count = airDao.airCount();
		request.setAttribute("count", count);
		
		if(count != 0) {
			Map<String, Integer> map = new HashMap<String, Integer>();
			
			List<AirDataBean> ato = airDao.getAirList(map);
			request.setAttribute("ato", ato);
		}

		return new ModelAndView("reservair/reservmain");
	}

}
