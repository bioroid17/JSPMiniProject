package createBean;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.ViewResolver;
import org.springframework.web.servlet.view.JstlView;
import org.springframework.web.servlet.view.UrlBasedViewResolver;

import reserv.AirDBBean;
import reserv.AirDao;
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
	
	//책 상세
	@Bean
	public BookDao bookDao() {
		return new BookDBBean();
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
