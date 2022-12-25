package movieHandler;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import movie.MovieDAO;
import movie.MovieDataBean;

@Controller
public class MovieUpdateFormHandler implements CommandHandler{

	@Resource
	private MovieDAO movieDao;
	@RequestMapping("movie/movieUpdateForm")
	@Override
	public ModelAndView process(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		String movieCd = request.getParameter("movieCd");
		MovieDataBean dto = movieDao.getMovie(movieCd);
		
		request.setAttribute("dto", dto);
		return new ModelAndView ("movie/movieUpdateForm");
	}
}
