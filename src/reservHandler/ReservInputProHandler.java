package reservHandler;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import reserv.ReservDao;
import reserv.ReservDataBean;

@Controller
public class ReservInputProHandler implements CommandHandler{
	
	@Resource
	private ReservDao reservDao;
	
	@RequestMapping("Mini/reservair/reservinputPro")
	@Override
	public ModelAndView process(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		
		request.setCharacterEncoding("utf-8");
		ReservDataBean rto = new ReservDataBean();
		
		rto.setReservNum(Integer.parseInt(request.getParameter("reservNum")));
		rto.setReNum(Integer.parseInt(request.getParameter("reNum")));
		rto.setUserId(request.getParameter("userId"));
		rto.setReservAir(request.getParameter("reservAir"));
		rto.setReservPerseon(request.getParameter("reservPerseon"));
		
		String perseon = null;
		String reservPerseon = request.getParameter("reservPerseon");
		String reservPerseons = request.getParameter("reservPerseons");
		
		if(reservPerseon.equals("10")) {
			perseon = reservPerseons; // 직접 입력
		} else {
			perseon = reservPerseon; // 선택 입력
		}
		rto.setReservPerseon(perseon);
		
		
		rto.setSeatLevel(request.getParameter("seatLevel"));
		
//		rto.setSeatNum(request.getParameter("seatNum"));
		
		String[] seatNum = request.getParameterValues("seatNum");
		String array = "";
		for(int i = 0; i < seatNum.length; i++) {
			array += seatNum[i] + " ";
		}
		rto.setSeatNum(array);
		
//		int resultCheck = reservDao.reservCheck(userId, reNum);
		int result = reservDao.insertReserv(rto);
		request.setAttribute("result", result);
		
		return new ModelAndView("reservair/reservinputPro");
	}

}
