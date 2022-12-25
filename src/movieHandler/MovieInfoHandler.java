package movieHandler;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import movie.MovieDAO;
import movie.MovieDataBean;
import movie.MovieInfoDataBean;

@Controller
public class MovieInfoHandler implements CommandHandler {

	@Resource
	private MovieDAO movieDao;

	@RequestMapping("movie/movieInfo")
	@Override
	public ModelAndView process(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		String movieCd = request.getParameter("movieCd");

		MovieDataBean movieDto = movieDao.getMovie(movieCd);
		MovieInfoDataBean infoDto = movieDao.getMovieInfo(movieCd);

		request.setAttribute("prodNum", movieCd);
		request.setAttribute("movieDto", movieDto);
		request.setAttribute("infoDto", infoDto);

		return new ModelAndView("movie/movieInfo");
	}
}
