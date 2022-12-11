package reserv;

import java.util.List;
import java.util.Map;

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
		
	// 내 예약
	@Override	
	public List<AirDataBean> getMyList(String userId) {
		return SqlMapClient.getSession().selectList("ReservInfo.getMyList", userId);
	}
	
}
