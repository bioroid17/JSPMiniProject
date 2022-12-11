package reserv;

import java.util.List;
import java.util.Map;

public interface ReservDao {
	public int insertReserv(ReservDataBean rto); // 예약
	public int reservCount(String userId); // 갯수 확인
	public List<AirDataBean> getMyList(String userId); // 내 예약 보기
	
}
