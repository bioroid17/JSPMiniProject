package reserv;

import java.util.List;
import java.util.Map;

import mybatis.SqlMapClient;

public class AirDBBean implements AirDao {
	
	// 등록
	public int insertAir(AirDataBean dto) {
		return SqlMapClient.getSession().insert("AirInfo.insertAir", dto);
	}
	
	// 글 갯수
	@Override
	public int airCount() {
		return SqlMapClient.getSession().selectOne("AirInfo.airCount");
	}
	
	// 글 출력
	@Override
	public List<AirDataBean> getAirList(Map<String, Integer>map) {
		return SqlMapClient.getSession().selectList("AirInfo.getairList", map);
	}
	
	// 글 보기
	@Override
	public AirDataBean getAirContent(int reNum) {
		return SqlMapClient.getSession().selectOne("AirInfo.getAirContent", reNum);
	}
	
}
