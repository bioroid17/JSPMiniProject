package reservHandler;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import reserv.AirDao;
import reserv.AirDataBean;
import reserv.ReservDao;
import reserv.ReservDataBean;
import user.UserDao;
import user.UserDataBean;

@Controller
public class ReservContentHandler implements CommandHandler{
	
	@Resource
	private UserDao userDao;
	
	@Resource
	private AirDao airDao;
	
	@Resource
	private ReservDao reservDao;
	
	@RequestMapping("Mini/reservair/reservcontent")
	@Override
	public ModelAndView process(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		String userId = request.getParameter("userId");
		int reNum = Integer.parseInt(request.getParameter("reNum"));
		int reservNum=0;
		int count = 0;
		UserDataBean dto = userDao.getUser(userId);
		AirDataBean ato = airDao.getAirContent(reNum);
		List<ReservDataBean> rto = reservDao.getMyList(userId);
		
//		count = reservDao.reservCountUser(userId);
//		request.setAttribute("count", count);
//		
//		if(count != 0) {
//			List<AirDataBean> rto = reservDao.getCheck(reNum);
//			request.setAttribute("reNum", reNum);
//			request.setAttribute("rto", rto);
//		}
		
		request.setAttribute("rto", rto);
		request.setAttribute("userId", userId);
		request.setAttribute("reNum", reNum);
		request.setAttribute("dto", dto); // 유저
		request.setAttribute("ato", ato); // 비행기 정보
		request.setAttribute("reservNum", reservNum);
		
		return new ModelAndView("reservair/reservcontent");
	}

}
