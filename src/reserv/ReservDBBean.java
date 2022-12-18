package reserv;

import java.util.List;

import mybatis.SqlMapClient;

public class ReservDBBean implements ReservDao {
	// 등록
	public int insertReserv(ReservDataBean rto) {
		return SqlMapClient.getSession().insert("ReservInfo.insertReserv", rto);
	}
	
	// 글 갯수
	@Override
	public int reservCount(String userId) {
		return SqlMapClient.getSession().selectOne("ReservInfo.reservCount", userId);
	}
	
	@Override
	public ReservDataBean getReserv(int reservNum) {
		return SqlMapClient.getSession().selectOne("ReservInfo.getReserv", reservNum);
	}
	
	
	// 내 예약
	@Override	
	public List<ReservDataBean> getMyList(String userId) {
		return SqlMapClient.getSession().selectList("ReservInfo.getMyList", userId);
	}
	
	public int reservCheck(int reservNum, String userId) {
		ReservDataBean rto = getReserv(reservNum);
		int result = 0;
		if(rto.getUserId().contentEquals(userId)) {
			result = 1;
		} else {
			result = 0;
		}
		return result;
	}
	
	@Override
	public int deleteReserv(int reservNum) {
		return SqlMapClient.getSession().delete("ReservInfo.deleteReserv", reservNum);
	}
	
	
//	public int reservCheck(String userId, int reNum) {
//		int result;
//		int count = reservCount(userId);
//		if (count == 1) {
//			ReservDataBean rto = getReserv(userId);
//			if(rto.getReNum() == reNum) {
//				result = -1;
//			} else {
//				result = 0;
//			}
//		} else {
//			result = 1;
//		}
//		return result;
//	}
}
