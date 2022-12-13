/**
 * 
 */

var idmsg = "아이디를 입력하세요.";
var passwdmsg = "비밀번호를 입력하세요.";
var repasswdmsg = "비밀번호가 일치하지 않습니다.";
var namemsg = "이름을 입력하세요.";
var juminmsg = "주민등록번호를 입력하세요.";
var telmsg = "전화번호를 입력하세요.";
var emailmsg = "이메일 형식이 맞지 않습니다.";
var confirmmsg = "아이디 중복확인을 해주세요";

var iderror = "입력하신 아이디가 없습니다.\n다시 확인하세요.";
var passwderror = "입력하신 비밀번호가 다릅니다.\n다시 확인하세요.";
var inserterror = "영화 등록에 실패했습니다.\n다시 시도하세요.";
	
function erroralert(msg){
	alert(msg);
	history.back();	// window.history.back() : 이전 페이지로 돌아감
}