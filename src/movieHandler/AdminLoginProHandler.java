package movieHandler;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import movie.MovieDAO;

@Controller
public class AdminLoginProHandler implements CommandHandler{
	@Resource
	private MovieDAO movieDao;
	@RequestMapping("movie/adminLoginPro")
	@Override
	public ModelAndView process(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		
		String adminId = request.getParameter("adminId");
		String adminPasswd = request.getParameter("adminPasswd");
		
		int result = movieDao.checkAdminId(adminId, adminPasswd); // 아이디와 비밀번호 일치하는지 체크
		
		request.setAttribute("result", result);
		request.setAttribute("adminId", adminId);
		
		return new ModelAndView ("movie/adminLoginPro");
	}
}
