package src.book;


public class BookDao {	
	public List<BookDataBean> getAirList(Map<String, Integer>map); // 글 출력
	
	public BookDataBean getAirContent(int reNum); // 글보기
}
