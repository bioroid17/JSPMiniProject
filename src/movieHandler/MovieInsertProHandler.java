package movieHandler;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import movie.MovieDAO;

@Controller
public class MovieInsertProHandler implements CommandHandler{

	@Resource
	private MovieDAO movieDao;
	@RequestMapping("movie/movieInsertPro")
	@Override
	public ModelAndView process(HttpServletRequest request, HttpServletResponse response) throws Throwable {

		return new ModelAndView ("movie/movieInsertPro");
	}
}
