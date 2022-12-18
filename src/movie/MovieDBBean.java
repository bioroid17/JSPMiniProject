package movie;

import java.util.List;
import java.util.Map;

import mybatis.SqlMapClient;

public class MovieDBBean implements MovieDAO{
	@Override
	public AdminDataBean getAdmin(String adminId) {
		return SqlMapClient.getSession().selectOne("Movies.getAdmin", adminId);
	}
	
	@Override
	public int checkAdmin(String adminId) {
		return SqlMapClient.getSession().selectOne("Movies.checkAdmin", adminId);
	}
	
	@Override
	public int checkAdminId(String adminId, String adminPasswd) {
		int result = 0;
		int count = checkAdmin(adminId);
		if(count == 1) {
			//아이디가 있다
			AdminDataBean dto = getAdmin(adminId);
			if(dto.getAdminPasswd().equals(adminPasswd)) {
				//비밀번호가 같다
				result = 1;
			} else {
				//비밀번호가 다르다
				result = 0;
			}
		} else {
			//아이디가 없다
			result = -1;
		}
		return result;
	}

	@Override
	public int checkAdminPasswd(String adminId, String adminPasswd) {
		int result = 0;
		AdminDataBean dto = getAdmin(adminId);
		if(adminPasswd.equals(dto.getAdminPasswd()))
			result = 1;
		else
			result = 0;
		
		return result;
	}

	@Override
	public MovieDataBean getMovie(int movieId) {
		return SqlMapClient.getSession().selectOne("Movies.getMovie", movieId);
	}

	@Override
	public List<MovieDataBean> getMovies(Map<String, String> map) {
		return SqlMapClient.getSession().selectList("Movies.getMovies", map);
	}

	@Override
	public int getMovieCount() {
		return SqlMapClient.getSession().selectOne("Movies.getMovieCount");
	}

	@Override
	public int insertMovie(MovieDataBean dto) {
		return SqlMapClient.getSession().insert("Movies.insertMovie", dto);
	}

	@Override
	public int updateMovie(MovieDataBean dto) {
		return SqlMapClient.getSession().update("Movies.updateMovie", dto);
	}

	@Override
	public int deleteMovie(int movieId) {
		return SqlMapClient.getSession().delete("Movies.deleteMovie", movieId);
	}

}
