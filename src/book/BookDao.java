package src.book;

import src.reserv.AirDataBean;
import src.reserv.Integer;
import src.reserv.List;
import src.reserv.Map;
import src.reserv.String;

public class BookDao {	
	public List<BookDataBean> getAirList(Map<String, Integer>map); // 글 출력
	
	public BookDataBean getAirContent(int reNum); // 글보기
}
