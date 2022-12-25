package movieHandler;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.LinkedHashMap;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.codehaus.jackson.map.ObjectMapper;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import kr.or.kobis.kobisopenapi.consumer.rest.KobisOpenAPIRestService;
import movie.MovieDAO;
import movie.MovieDataBean;

@Controller
public class KobisMovieInsertHandler implements CommandHandler{

	@Resource
	private MovieDAO movieDao;

	@RequestMapping("movie/kobisMovieInsert")
	@Override
	public ModelAndView process(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		// JSON 라이브러리 ObjectMapper를 통해 처리
		// /JSPMiniProject/WebContent/WEB-INF/lib/jackson-mapper-asl-1.6.2.jar : ObjectMapper 클래스 선언에 필요
		ObjectMapper mapper = new ObjectMapper();
		String key = "6a61a2c243f3a3d6f185296f8b133f6f";
		boolean isJson = true;
		
		KobisOpenAPIRestService service = new KobisOpenAPIRestService(key);
		int curPage = 1;
		String itemPerPage = "100";
		String movieNm = null;
		String directorNm = null;
		String openStartDt = null;
		String openEndDt = "2022";
		String prdtStartYear = null;
		String prdtEndYear = null;
		String repNationCd = null;
		String[] movieTypeCdArr = null;
		
		int count = 1;
		while(true) {
			String searchMovieList = service.getMovieList(isJson, Integer.toString(curPage++), itemPerPage, movieNm, directorNm, openStartDt, openEndDt,
															prdtStartYear, prdtEndYear, repNationCd, movieTypeCdArr);
												// 영화 목록 불러오기
												// (boolean isJson, String curPage, String itemPerPage, String movieNm, String directorNm, String openStartDt, 
												// String openEndDt, String prdtStartYear, String prdtEndYear, String repNationCd, String[] movieTypeCdArr)
			// /JSPMiniProject/WebContent/WEB-INF/lib/jackson-core-asl-1.6.2.jar : readValue에 필요
			HashMap<String, Object> movieListJSON = mapper.readValue(searchMovieList, HashMap.class);
			LinkedHashMap<String, Object> movieListResult = (LinkedHashMap<String, Object>)movieListJSON.get("movieListResult");
			ArrayList<LinkedHashMap<String, Object>> movies = (ArrayList<LinkedHashMap<String, Object>>)movieListResult.get("movieList");
			int totCnt = (int)movieListResult.get("totCnt");
			if(totCnt == 0)
				break;
			
			for(LinkedHashMap<String, Object> movie : movies) {
				MovieDataBean movieDto = new MovieDataBean();
				String movieCd = (String)movie.get("movieCd");
				System.out.println(movieCd);
				movieDto.setMovieCd(movieCd);
				movieDto.setMovieNm((String)movie.get("movieNm"));
				movieDto.setMovieNmEn((String)movie.get("movieNmEn"));
				movieDto.setPrdtYear((String)movie.get("prdtYear"));
				movieDto.setOpenDt((String)movie.get("openDt"));
				movieDto.setTypeNm((String)movie.get("typeNm"));
				movieDto.setPrdtStatNm((String)movie.get("prdtStatNm"));
				movieDto.setNationAlt((String)movie.get("nationAlt"));
				movieDto.setGenreAlt((String)movie.get("genreAlt"));
				movieDto.setRepNationNm((String)movie.get("repNationNm"));
				movieDto.setRepGenreNm((String)movie.get("repGenreNm"));
				
				ArrayList<LinkedHashMap<String, Object>> directorList = (ArrayList<LinkedHashMap<String, Object>>)movie.get("directors");
				String directorNms = "";
				String directorNmEns = "";
				for(LinkedHashMap<String, Object> director : directorList) {
					String peopleNm = (String)director.get("peopleNm");
					String peopleNmEn = (String)director.get("peopleNmEn");
					if (peopleNm != null)
						directorNms += peopleNm + ",";
					if (peopleNmEn != null)
						directorNmEns += peopleNmEn + ",";
				}
				movieDto.setDirectorNms(directorNms);
				movieDto.setDirectorNmEns(directorNmEns);
				
				ArrayList<LinkedHashMap<String, Object>> companyList = (ArrayList<LinkedHashMap<String, Object>>)movie.get("companys");
				String companyNms = "";
				String companyNmEns = "";
				String companyPartNms = "";
				for(LinkedHashMap<String, Object> company : companyList) {
					String companyNm = (String)company.get("companyNm");
					String companyNmEn = (String)company.get("companyNmEn");
					String companyPartNm = (String)company.get("companyPartNm");
					if (companyNm != null)
						companyNms += companyNm + ",";
					if (companyNmEn != null)
						companyNmEns += companyNmEn + ",";
					if (companyPartNm != null)
						companyPartNms += companyPartNm + ",";
				}
				movieDto.setCompanyNms(companyNms);
				movieDto.setCompanyNmEns(companyNmEns);
				movieDto.setCompanyPartNms(companyPartNms);
				// SQLIntegrityConstraintViolationException 발생 가능
				int result1 = movieDao.insertMovie(movieDto);	// 영화 insert
				if (result1 == 0)
					continue;
				
//				String searchMovieInfo = service.getMovieInfo(isJson, movieCd);
//														// (boolean isJson, String movieCd)
//				HashMap<String, Object> movieInfoJSON = mapper.readValue(searchMovieInfo, HashMap.class);
//				LinkedHashMap<String, Object> movieInfoResult = (LinkedHashMap<String, Object>)movieInfoJSON.get("movieInfoResult");
//				LinkedHashMap<String, Object> movieInfo = (LinkedHashMap<String, Object>)movieInfoResult.get("movieInfo");
//				MovieInfoDataBean infoDto = new MovieInfoDataBean();
//				infoDto.setMovieCd((String)movieInfo.get("movieCd"));
//				infoDto.setMovieNm((String)movieInfo.get("movieNm"));
//				infoDto.setMovieNmEn((String)movieInfo.get("movieNmEn"));
//				infoDto.setMovieNmOg((String)movieInfo.get("movieNmOg"));
//				infoDto.setPrdtYear((String)movieInfo.get("prdtYear"));
//				infoDto.setShowTm((String)movieInfo.get("showTm"));
//				infoDto.setOpenDt((String)movieInfo.get("openDt"));
//				infoDto.setPrdtStatNm((String)movieInfo.get("prdtStatNm"));
//				infoDto.setTypeNm((String)movieInfo.get("typeNm"));
//
//				ArrayList<LinkedHashMap<String, Object>> nationList = (ArrayList<LinkedHashMap<String, Object>>)movieInfo.get("nations");
//				String nations = "";
//				for(LinkedHashMap<String, Object> nation : nationList) {
//					String nationNm = (String)nation.get("nationNm");
//					if (nationNm != null)
//						nations += nationNm + ",";
//				}
//				infoDto.setNations(nations);
//				System.out.println(nations);
//
//				ArrayList<LinkedHashMap<String, Object>> genreList = (ArrayList<LinkedHashMap<String, Object>>)movieInfo.get("genres");
//				String genres = "";
//				for(LinkedHashMap<String, Object> genre : genreList) {
//					String genreNm = (String)genre.get("genreNm");
//					if (genreNm != null)
//						genres += genreNm + ",";
//				}
//				infoDto.setGenres(genres);
//				System.out.println(genres);
//
//				directorList = (ArrayList<LinkedHashMap<String, Object>>)movieInfo.get("directors");
//				directorNms = "";
//				directorNmEns = "";
//				for(LinkedHashMap<String, Object> director : directorList) {
//					String peopleNm = (String)director.get("peopleNm");
//					String peopleNmEn = (String)director.get("peopleNmEn");
//					if (peopleNm != null)
//						directorNms += peopleNm + ",";
//					if (peopleNmEn != null)
//						directorNmEns += peopleNmEn + ",";
//				}
//				infoDto.setDirectorNms(directorNms);
//				infoDto.setDirectorNmEns(directorNmEns);
//				System.out.println(directorNms);
//
//				ArrayList<LinkedHashMap<String, Object>> actorList = (ArrayList<LinkedHashMap<String, Object>>)movieInfo.get("actors");
//				String actorNms = "";
//				String actorNmEns = "";
//				String castNms = "";
//				String castNmEns = "";
//				for(LinkedHashMap<String, Object> actor : actorList) {
//					String peopleNm = (String)actor.get("peopleNm");
//					String peopleNmEn = (String)actor.get("peopleNmEn");
//					String cast = (String)actor.get("cast");
//					String castEn = (String)actor.get("castEn");
//					if (peopleNm != null)
//						actorNms += peopleNm + ",";
//					if (peopleNmEn != null)
//						actorNmEns += peopleNmEn + ",";
//					if (cast != null)
//						castNms += cast + ",";
//					if (castEn != null)
//						castNmEns += castEn + ",";
//				}
//				infoDto.setActorNms(actorNms);
//				infoDto.setActorNmEns(actorNmEns);
//				infoDto.setCastNmEns(castNms);
//				infoDto.setCastNmEns(castNmEns);
//				System.out.println(actorNms);
//
//				ArrayList<LinkedHashMap<String, Object>> showTypeList = (ArrayList<LinkedHashMap<String, Object>>)movieInfo.get("showTypes");
//				String showTypeGroupNms = "";
//				String showTypeNms = "";
//				for(LinkedHashMap<String, Object> showType : showTypeList) {
//					String showTypeGroupNm = (String)showType.get("showTypeGroupNm");
//					String showTypeNm = (String)showType.get("showTypeNm");
//					if (showTypeGroupNm != null)
//						showTypeGroupNms += showTypeGroupNm + ",";
//					if (showTypeNm != null)
//						showTypeNms += showTypeNm + ",";
//				}
//				infoDto.setShowTypeGroupNms(showTypeGroupNms);
//				infoDto.setShowTypeNms(showTypeNms);
//				System.out.println(showTypeNms);
//
//				ArrayList<LinkedHashMap<String, Object>> auditList = (ArrayList<LinkedHashMap<String, Object>>)movieInfo.get("audits");
//				String auditNos = "";
//				String watchGradeNms = "";
//				for(LinkedHashMap<String, Object> audit : auditList) {
//					String auditNo = (String)audit.get("auditNo");
//					String watchGradeNm = (String)audit.get("watchGradeNm");
//					if (auditNo != null)
//						auditNos += auditNo + ",";
//					if (watchGradeNm != null)
//						watchGradeNms += watchGradeNm + ",";
//				}
//				infoDto.setAuditNos(auditNos);
//				infoDto.setWatchGradeNms(watchGradeNms);
//				System.out.println(auditNos);
//
//				companyList = (ArrayList<LinkedHashMap<String, Object>>)movieInfo.get("companys");
//				companyNms = "";
//				companyNmEns = "";
//				companyPartNms = "";
//				for(LinkedHashMap<String, Object> company : companyList) {
//					String companyNm = (String)company.get("companyNm");
//					String companyNmEn = (String)company.get("companyNmEn");
//					String companyPartNm = (String)company.get("companyPartNm");
//					if (companyNm != null)
//						companyNms += companyNm + ",";
//					if (companyNmEn != null)
//						companyNmEns += companyNmEn + ",";
//					if (companyPartNm != null)
//						companyPartNms += companyPartNm + ",";
//				}
//				movieDto.setCompanyNms(companyNms);
//				movieDto.setCompanyNmEns(companyNmEns);
//				movieDto.setCompanyPartNms(companyPartNms);
//
//				ArrayList<LinkedHashMap<String, Object>> staffList = (ArrayList<LinkedHashMap<String, Object>>)movieInfo.get("staffs");
//				String staffNms = "";
//				String staffNmEns = "";
//				String staffRoleNms = "";
//				for(LinkedHashMap<String, Object> staff : staffList) {
//					String staffNm = (String)staff.get("staffNm");
//					String staffNmEn = (String)staff.get("staffNmEn");
//					String staffRoleNm = (String)staff.get("staffRoleNm");
//					if (staffNm != null)
//						staffNms += staffNm + ",";
//					if (staffNmEn != null)
//						staffNmEns += staffNmEn + ",";
//					if (staffRoleNm != null)
//						staffRoleNms += staffRoleNm + ",";
//				}
//				infoDto.setStaffNms(staffNms);
//				infoDto.setStaffNmEns(staffNmEns);
//				infoDto.setStaffRoleNms(staffRoleNms);
//				int result2 = movieDao.insertMovieInfo(infoDto); 	// 영화정보 insert
//				if (result2 == 0)
//					continue;
			}
			System.out.println(count++);
		}
		
		return new ModelAndView ("movie/kobisMovieInsert");
	}
}
