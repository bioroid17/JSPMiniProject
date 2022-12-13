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
public class MovieInfoHandler implements CommandHandler{

	@Resource
	private MovieDAO movieDao;
	@RequestMapping("movie/movieInfo")
	@Override
	public ModelAndView process(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		int movieId = Integer.parseInt(request.getParameter("movieId"));
	
		MovieDataBean dto = movieDao.getMovie(movieId);
		

		request.setAttribute("prodNum", movieId);
		request.setAttribute("dto", dto);
		
		return new ModelAndView ("movie/movieInfo");
	}
}
