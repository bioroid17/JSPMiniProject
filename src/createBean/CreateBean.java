package createBean;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.ViewResolver;
import org.springframework.web.servlet.view.JstlView;
import org.springframework.web.servlet.view.UrlBasedViewResolver;

import reserv.AirDBBean;
import reserv.AirDao;
import book.BookDBBean;
import book.BookDao;
import movie.MovieDAO;
import movie.MovieDBBean;
import reserv.ReservDBBean;
import reserv.ReservDao;
import user.UserDBBean;
import user.UserDao;


@Configuration
public class CreateBean {
	
	// 유저
	@Bean
	public UserDao userDao() {
		return new UserDBBean();
	}
	
	// 등록
	@Bean
	public AirDao airDao() {
		return new AirDBBean();
	}
	
	// 예약
	@Bean
	public ReservDao ReservDao() {
		return new ReservDBBean();
	}
	
	//책 상세
	@Bean
	public BookDao bookDao() {
		return new BookDBBean();
	}
	
	// 영화 추천
	@Bean
	public MovieDAO movieDAO() {
		return new MovieDBBean();
	}
	
	@Bean
	public ViewResolver viewResolver() {
		UrlBasedViewResolver viewResolver = new UrlBasedViewResolver();
		viewResolver.setViewClass(JstlView.class);
		viewResolver.setPrefix("/Mini/");
		viewResolver.setSuffix(".jsp");
		return viewResolver;
	}
}
