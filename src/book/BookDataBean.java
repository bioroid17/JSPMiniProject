package book;


public class BookDataBean {
	private String keyWords; 	// 키워드
	private String b_Name; 		// 책 제목
	private String b_Writer;	// 책 저자	
	private String b_Type;		// 책 장르	
	private int b_Num;			// 책 번호
	private String b_Image;		// 책 이미지
	private String b_SangSae; 	// 책 상세내용
	
	public String getKeyWords() {
		return keyWords;
	}
	public void setKeyWords(String keyWords) {
		this.keyWords = keyWords;
	}
	public String getB_Name() {
		return b_Name;
	}
	public void setB_Name(String b_Name) {
		this.b_Name = b_Name;
	}
	public String getB_Writer() {
		return b_Writer;
	}
	public void setB_Writer(String b_Writer) {
		this.b_Writer = b_Writer;
	}
	public String getB_Type() {
		return b_Type;
	}
	public void setB_Type(String b_Type) {
		this.b_Type = b_Type;
	}
	public int getB_Num() {
		return b_Num;
	}
	public void setB_Num(int b_Num) {
		this.b_Num = b_Num;
	}
	public String getB_Image() {
		return b_Image;
	}
	public void setB_Image(String b_Image) {
		this.b_Image = b_Image;
	}
	public String getB_SangSae() {
		return b_SangSae;
	}
	public void setB_SangSae(String b_SangSae) {
		this.b_SangSae = b_SangSae;
	}
	

	
}