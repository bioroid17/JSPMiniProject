package keyword;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import book.BookDao;
import book.BookDataBean;
@Controller
public class bookPageHandler implements CommandHandler{
	@Resource
	private BookDao bookdao;
	
	@RequestMapping("books/book_keyword")
	
	@Override
	public ModelAndView process(HttpServletRequest request, HttpServletResponse response) throws Throwable {
//		String b_Name = request.getParameter("b_Name"); 
		List<BookDataBean> dto = bookdao.selectBook();
		request.setAttribute("dto", dto);
		return new ModelAndView ("books/book_keyword");
	}
	
}

