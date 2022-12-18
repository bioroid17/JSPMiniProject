package movie;

public class MovieDataBean {
	private int movieId;				// bigint
	private String movieTitle;			// 제목
	private String movieGenre;			// 장르
	private String moviePosterDir;		// 경로명
	private String moviePosterOriName;	// 경로명 오리지널
	private String moviePosterSysName;	// 경로명 시스템명
	private String movieTags;			// 태그
	private String movieAge;			// 연령등급
	private String movieInfo;			// 정보
	private int movieTime;				// 상영시간
	private String movieDirector;		// 감독
	private String movieActors;			// 출연진
	
	public int getMovieId() {
		return movieId;
	}
	public void setMovieId(int movieId) {
		this.movieId = movieId;
	}
	public String getMovieTitle() {
		return movieTitle;
	}
	public void setMovieTitle(String movieTitle) {
		this.movieTitle = movieTitle;
	}
	public String getMovieGenre() {
		return movieGenre;
	}
	public void setMovieGenre(String movieGenre) {
		this.movieGenre = movieGenre;
	}
	public String getMoviePosterDir() {
		return moviePosterDir;
	}
	public void setMoviePosterDir(String moviePosterDir) {
		this.moviePosterDir = moviePosterDir;
	}
	public String getMoviePosterOriName() {
		return moviePosterOriName;
	}
	public void setMoviePosterOriName(String moviePosterOriName) {
		this.moviePosterOriName = moviePosterOriName;
	}
	public String getMoviePosterSysName() {
		return moviePosterSysName;
	}
	public void setMoviePosterSysName(String moviePosterSysName) {
		this.moviePosterSysName = moviePosterSysName;
	}
	public String getMovieTags() {
		return movieTags;
	}
	public void setMovieTags(String movieTags) {
		this.movieTags = movieTags;
	}
	public String getMovieAge() {
		return movieAge;
	}
	public void setMovieAge(String movieAge) {
		this.movieAge = movieAge;
	}
	public String getMovieInfo() {
		return movieInfo;
	}
	public void setMovieInfo(String movieInfo) {
		this.movieInfo = movieInfo;
	}
	public int getMovieTime() {
		return movieTime;
	}
	public void setMovieTime(int movieTime) {
		this.movieTime = movieTime;
	}
	public String getMovieDirector() {
		return movieDirector;
	}
	public void setMovieDirector(String movieDirector) {
		this.movieDirector = movieDirector;
	}
	public String getMovieActors() {
		return movieActors;
	}
	public void setMovieActors(String movieActors) {
		this.movieActors = movieActors;
	}
	
	
}
