package movie;

import java.util.List;
import java.util.Map;

public interface MovieDAO {
	public AdminDataBean getAdmin(String adminId);
	public int checkAdmin(String adminId);
	public int checkAdminId(String adminId, String adminPasswd);
	public int checkAdminPasswd(String adminId, String adminPasswd);
	public MovieDataBean getMovie(String movieCd);
	public MovieInfoDataBean getMovieInfo(String movieCd);
	public List<MovieDataBean> getMovies(Map<String, String> map);
	public int getMovieCount();
	public int getMovieInfoCount(String movieCd);
	public int insertMovie(MovieDataBean dto);
	public int updateMovie(MovieDataBean dto);
	public int insertMovieInfo(MovieInfoDataBean dto);
	public int updateMovieInfo(MovieInfoDataBean dto);
	public List<MovieDataBean> getMovieCds();
	public int deleteMovie(int movieId);
}
