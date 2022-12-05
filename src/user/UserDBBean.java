package user;

import mybatis.SqlMapClient;

public class UserDBBean implements UserDao {
	
	// 가입
	public int insertUser(UserDataBean dto) {
		return SqlMapClient.getSession().insert("UserInfo.insertUser", dto);
		
	}
	
	// 항공사 가입
	@Override
	public int insertAirUser(UserDataBean dto) {
		return SqlMapClient.getSession().insert("UserInfo.insertAirUser", dto);		
	
	}	
	
	// 아이디 중복
	@Override
	public int checkId(String userId) {
		return SqlMapClient.getSession().selectOne("UserInfo.checkId", userId);
	}
	
	// 전화번호 중복
	@Override
	public int checkTel(String userTel) {
		return SqlMapClient.getSession().selectOne("UserInfo.checkTel", userTel);
	}	
	
	// 메인페이지에 이름을 띄우는 용도
	@Override
	public UserDataBean getUser(String userId) {
		return SqlMapClient.getSession().selectOne("UserInfo.getUser", userId);
	}
	
	// 로그인을 위한 아이디 비번 체크
	public int check(String userId, String userPasswd) {
		int result;
		int count = checkId(userId);
		if(count == 1) {
			//아이디가 있다
			UserDataBean dto = getUser(userId);
			if(dto.getUserPasswd().equals(userPasswd)) {
				//비밀번호가 같다
				result = 1;
			} else {
				//비밀번호가 다르다
				result = 0;
			}
		} else {
			//아이디가 없다
			result = -1;
		}
		return result;
	
		}
	
	// 수정
	@Override
	public int modifyUser(UserDataBean dto) {
		return SqlMapClient.getSession().update("UserInfo.modifyUser", dto);
	}
	
	// 삭제
	@Override
	public int deleteUser(String userId) {
		return SqlMapClient.getSession().delete("UserInfo.deleteUser", userId);
	}
	
}