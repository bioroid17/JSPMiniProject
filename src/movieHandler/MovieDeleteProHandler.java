package movieHandler;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import movie.MovieDAO;

@Controller
public class MovieDeleteProHandler implements CommandHandler{

	@Resource
	private MovieDAO movieDao;
	@RequestMapping("movie/movieDeletePro")
	@Override
	public ModelAndView process(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		String adminId = (String) request.getSession().getAttribute("adminId");
		int movieId = Integer.parseInt(request.getParameter("movieId"));
		String passwd = request.getParameter("passwd");
		
		int resultCheck = movieDao.checkAdminPasswd(adminId, passwd);
		request.setAttribute("resultCheck", resultCheck);
		
		if(resultCheck != 0) {
			int result = movieDao.deleteMovie(movieId);
			request.setAttribute("result", result);
		}
		return new ModelAndView ("movie/movieDeletePro");
	}
}
