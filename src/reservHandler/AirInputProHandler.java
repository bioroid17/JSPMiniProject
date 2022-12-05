package reservHandler;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import reserv.AirDao;
import reserv.AirDataBean;

@Controller
public class AirInputProHandler implements CommandHandler {
	
	@Resource
	private AirDao airDao;
	
	@RequestMapping("Mini/reservair/airinputPro")
	@Override
	public ModelAndView process(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		
		request.setCharacterEncoding("utf-8");
		
		AirDataBean dto = new AirDataBean();
		
		dto.setReNum(Integer.parseInt(request.getParameter("reNum")));
		dto.setUserId(request.getParameter("userId"));
		dto.setAirName(request.getParameter("airName"));
		dto.setStartCountry(request.getParameter("startCountry"));
		dto.setStartCity(request.getParameter("startCity"));
		dto.setFinishCountry(request.getParameter("finishCountry"));
		dto.setFinishCity(request.getParameter("finishCity"));
		dto.setStartDate(request.getParameter("startDate"));
		dto.setStartTime(request.getParameter("startTime"));
		dto.setFinishDate(request.getParameter("finishDate"));
		dto.setFinishTime(request.getParameter("finishTime"));
		
		int result = airDao.insertAir(dto);
		request.setAttribute("result", result);
		
		return new ModelAndView("reservair/airinputPro");
	}

}
