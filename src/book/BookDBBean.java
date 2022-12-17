package book;

import java.util.Map;
import mybatis.SqlMapClient;

public class BookDBBean implements BookDao{

	public int insertBook( BookDataBean dto ) {

		String b_Name = dto.getB_Name(); 		// 책 제목
		String b_Writer = dto.getB_Writer();	// 책 저자	
		String b_Type = dto.getB_Type();		// 책 장르	
		int b_Num = dto.getB_Num();				// 책 번호
		String b_Image = dto.getB_Image();		// 책 이미지
		String b_SangSae = dto.getB_SangSae(); 	// 책 상세내용

		return SqlMapClient.getSession().insert("book.keyword", dto ); 	
	}
}
