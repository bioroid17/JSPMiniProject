package movie;

import java.util.List;
import java.util.Map;

public interface MovieDAO {
	public AdminDataBean getAdmin(String adminId);
	public int checkAdmin(String adminId);
	public int checkAdminId(String adminId, String adminPasswd);
	public MovieDataBean getMovie(int movieId);
	public List<MovieDataBean> getMovies(Map<String, String> map);
	public int getMovieCount();
	public int insertMovie(MovieDataBean dto);
	public int updateMovie(MovieDataBean dto);
	public int deleteMovie(int movieId);
}
