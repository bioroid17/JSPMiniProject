package reserv;

import java.util.List;
import java.util.Map;

public interface ReservDao {
	public int insertReserv(ReservDataBean rto); // 예약
	public int reservCount(String userId); // 갯수 확인
	public List<ReservDataBean> getMyList(String userId); // 내 예약 보기
	
	public ReservDataBean getReserv(int reservNum); // 체크용
	public int reservCheck(int reservNum, String userId); //체크용
	public int deleteReserv(int reservNum);
//	public int reservCountUser(String userId);
//	public List<AirDataBean> getCheck(int reNum);
}
