package movieHandler;

import java.io.File;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import movie.MovieDAO;
import movie.MovieDataBean;

@Controller
public class MovieUpdateProHandler implements CommandHandler{

	@Resource
	private MovieDAO movieDao;
	@RequestMapping("movie/movieUpdatePro")
	@Override
	public ModelAndView process(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		request.setCharacterEncoding("utf-8");
		
		MovieDataBean dto = new MovieDataBean();

		////////////////////////////////////////////////////////////////////////////////////////////
		String moviePosterDir = request.getSession().getServletContext().getRealPath("/moviePoster");
		new File(moviePosterDir).mkdir();
		MultipartRequest multi = new MultipartRequest(request, moviePosterDir, 1024*1024*10, "utf-8", new DefaultFileRenamePolicy());
		// 파일 업로드가 가능하게 하는 기능

		//  enctype을 "multipart/form-data"로 선언하고 submit한 데이터들은 request객체가 아닌 MultipartRequest객체로 불러와야 한다.
		String moviePosterOriName = multi.getOriginalFileName("moviePoster");	// DB에 저장되는 파일 이름
		String moviePosterSysName = multi.getFilesystemName("moviePoster");		// 파일 이름 정책으로 변화되는 실제 파일 이름

		////////////////////////////////////////////////////////////////////////////////////////////
		dto.setMovieId(Integer.parseInt(multi.getParameter("movieId")));
		dto.setMovieTitle(multi.getParameter("movieTitle"));
		dto.setMovieGenre(multi.getParameter("movieGenre"));
		dto.setMoviePosterDir(moviePosterDir);
		dto.setMoviePosterOriName(moviePosterOriName);
		dto.setMoviePosterSysName(moviePosterSysName);
		dto.setMovieTags(multi.getParameter("movieTags"));
		dto.setMovieAge(multi.getParameter("movieAge"));
		dto.setMovieInfo(multi.getParameter("movieInfo"));
		dto.setMovieTime(Integer.parseInt(multi.getParameter("movieTime")));
		dto.setMovieDirector(multi.getParameter("movieDirector"));
		dto.setMovieActors(multi.getParameter("movieActors"));
		
		int result = movieDao.updateMovie(dto);
		
		request.setAttribute("result", result);
		return new ModelAndView ("movie/movieUpdatePro");
	}
}
