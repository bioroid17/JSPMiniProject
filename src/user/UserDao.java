package user;

public interface UserDao {
	public int insertUser(UserDataBean dto); // 회원가입
	public int insertAirUser(UserDataBean dto); // 항공사 회원가입
	public int checkId(String userId); // 아이디 중복 체크
	public int checkTel(String userTel); // 전화번호 중복 체크
	public int check(String userId, String userPasswd); // 로그인을 위해 아이디 비번 체크
	public UserDataBean getUser(String userId); // 메인페이지 이름 띄우는 용도, 혹은 인증용도
	public int modifyUser(UserDataBean dto); // 수정
	public int deleteUser(String userId); // 삭제
	
}
