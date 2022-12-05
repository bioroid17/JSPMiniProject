package reserv;

import java.util.List;
import java.util.Map;

public interface AirDao {
	
	public int insertAir(AirDataBean dto); // 등록
	
	public int airCount(); // 글 갯수
	public List<AirDataBean> getAirList(Map<String, Integer>map); // 글 출력
	
	public AirDataBean getAirContent(int reNum); // 글보기
}
