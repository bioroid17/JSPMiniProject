package src.book;


public class BookDao {	
	public List<BookDataBean> getAirList(Map<String, Integer>map); // 글 출력
	
	public BookDataBean getAirContent(int reNum); // 글보기
}
// 인터페이스로 다시 만드셈