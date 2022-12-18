/**
 * 
 */

var idmsg = "아이디를 입력하세요.";
var passwdmsg = "비밀번호를 입력하세요.";

var titlemsg = "영화 제목을 입력하세요.";
var postermsg = "영화 포스터를 넣으세요.";
var timemsg = "상영시간을 입력하세요.";
var tagmsg = "태그를 입력하세요.";
var genremsg = "영화 장르를 입력하세요.";
var directormsg = "감독 이름을 입력하세요.";
var actorsmsg = "출연진 정보를 입력하세요.";
var infomsg = "영화정보를 입력하세요.";

var iderror = "입력하신 아이디가 없습니다.\n다시 확인하세요.";
var passwderror = "입력하신 비밀번호가 다릅니다.\n다시 확인하세요.";
var inserterror = "영화 등록에 실패했습니다.\n다시 시도하세요.";
var updateerror = "영화 수정에 실패했습니다.\n다시 시도하세요.";
var deleteerror = "영화 삭제에 실패했습니다.\n다시 시도하세요.";
	
function erroralert(msg){
	alert(msg);
	history.back();	// window.history.back() : 이전 페이지로 돌아감
}

function logincheck(){
	if (! adminLoginForm.adminId.value){
		alert(idmsg);
		adminLoginForm.adminId.focus();
		return false;
	}
	if (! adminLoginForm.adminPasswd.value){
		alert(passwdmsg);
		adminLoginForm.adminPasswd.focus();
		return false;
	}
}

function moviecheck(){
	if (! movieform.movieTitle.value){
		alert(titlemsg);
		movieform.movieTitle.focus();
		return false;
	}
	if (! movieform.moviePoster.value){
		alert(postermsg);
		movieform.moviePoster.focus();
		return false;
	}
	if (! movieform.movieTime.value){
		alert(timemsg);
		movieform.movieTime.focus();
		return false;
	}
	if (! movieform.movieTags.value){
		alert(tagmsg);
		movieform.movieTags.focus();
		return false;
	}
	if (! movieform.movieGenre.value){
		alert(genremsg);
		movieform.movieGenre.focus();
		return false;
	}
	if (! movieform.movieDirector.value){
		alert(directormsg);
		movieform.movieDirector.focus();
		return false;
	}
	if (! movieform.movieActors.value){
		alert(actorsmsg);
		movieform.movieActors.focus();
		return false;
	}
	if (! movieform.movieInfo.value){
		alert(infomsg);
		movieform.movieInfo.focus();
		return false;
	}
}