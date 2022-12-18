/**
 * 
 */

var userIdMsg = "아이디를 입력하세요";
var userPasswdMsg = "비밀번호를 입력하세요";
var userInfoMsg = "항공사를 선택해주세요";
var userNameMsg = "이름을 입력하세요";
var userTelMsg = "전화번호를 입력하세요";
var userTelMsgs = "전화번호를 정확히 입력하세요";
var userRePwMsg = "재입력 비밀번호가 일치하지 않습니다.";
var confirmMsg = "이미 사용중인 아이디 입니다.";
var confirmtelMsg = "중복된 전화번호입니다.";
var passwderror = "비밀번호가 일치하지 않습니다.";
var scountryMsg = "출발 나라를 선택해 주세요";
var scityMsg = "출발 지역을 선택해 주세요";
var fcountryhMsg = "도착 나라를 선택헤 주세요";
var fcityMsg = "도착 지역을 선택헤 주세요";
var dateMsg = "날짜가 지정한 날짜보다 작습니다"
var timeMsg = "시간이 지정한 시간보다 작습니다"

var signError = "회원가입에 실패했습니다 \n 잠시후 다시 시도해주세요."

function erroralert(msg) {
	alert(msg);
	history.back();
}

// 로그인 체크
function loginCheck() {
	if( ! loginForm.userId.value) {
		alert(userIdMsg);
		loginForm.userId.focus();
		return false;
	} else if ( !loginForm.userPasswd.value){
		alert(userPasswdMsg);
		loginForm.userPasswd.focus();
		return false;
		
	}
}


// 일반 유저 회원가입 체크
function signcheck() {
	if(signupForm.confirmvalue.value == "0") {
		alert(confirmMsg);
		signupForm.userId.focus();
		return false;
	} else if(! signupForm.userId.value) {
		alert(userIdMsg);
		signupForm.userId.focus();
		return false;
	} else if (! signupForm.userPasswd.value){
		alert(userPasswdMsg);
		signupForm.userPasswd.focus();
		return false;
	} else if (signupForm.userPasswd.value != signupForm.userRePasswd.value){
		alert(userRePwMsg);
		signupForm.userRePasswd.focus();
		return false;
	} else if (! signupForm.userName.value){
		alert(userNameMsg);
		signupForm.userName.focus();
		return false;
	} else if (! signupForm.userTel.value){
		alert(userTelMsg);
		signupForm.userTel.focus();
		return false;
	} else if(signupForm.userTel.value.length != 13) {
		alert(userTelMsgs);
		signupForm.userTel.focus();
		return false;
	} else if(signupForm.confirmtelvalue.value == "0") {
		alert(confirmtelMsg);
		signupForm.userTel.focus();
		return false;
	}
}


// 항공사 회원가입 체크
function signAircheck() {
	if(! signupAirForm.userId.value) {
		alert(userIdMsg);
		signupAirForm.userId.focus();
		return false;
	} else if(signupAirForm.confirmvalue.value == "0") {
		alert(confirmMsg);
		signupAirForm.userId.focus();
		return false;
	} else if (! signupAirForm.userPasswd.value){
		alert(userPasswdMsg);
		signupAirForm.userPasswd.focus();
		return false;
	} else if (signupAirForm.userPasswd.value != signupAirForm.userRePasswd.value){
		alert(userRePwMsg);
		signupAirForm.userRePasswd.focus();
		return false;
	} else if (! signupAirForm.userInfo.value){
		alert(userInfoMsg);
		signupAirForm.userInfo.focus();
		return false;
	} else if (! signupAirForm.userName.value){
		alert(userNameMsg);
		signupAirForm.userName.focus();
		return false;
	} else if (! signupAirForm.userTel.value){
		alert(userTelMsg);
		signupAirForm.userTel.focus();
		return false;
	} else if(signupAirForm.userTel.value.length != 13) {
		alert(userTelMsgs);
		signupAirForm.userTel.focus();
		return false;
	} else if(signupAirForm.confirmtelvalue.value == "0") {
		alert(confirmtelMsg);
		signupAirForm.userTel.focus();
		return false;
	}
}

function modifycheck() {
	if(! usermodifyForm.userPasswd.value) {
		alert(userPasswdMsg);
		usermodifyForm.userPasswd.focus();
		return false;
	}
}

function modifyviewcheck() {
	if (! usermodifyviewForm.userPasswd.value){
		alert(userPasswdMsg);
		usermodifyviewForm.userPasswd.focus();
		return false;
	} else if (usermodifyviewForm.userPasswd.value != usermodifyviewForm.userRePasswd.value){
		alert(userRePwMsg);
		usermodifyviewForm.userRePasswd.focus();
		return false;
	} else if (! usermodifyviewForm.userTel.value){
		alert(userTelMsg);
		usermodifyviewForm.userTel.focus();
		return false;
	} else if(usermodifyviewForm.userTel.value.length != 13) {
		alert(userTelMsgs);
		usermodifyviewForm.userTel.focus();
		return false;
	}
}

function aircheck() {
	
	// 출발 지역 선택 X
	if(! airinputForm.startCountry.value) {
		alert(scountryMsg);
		airinputForm.startCountry.focus();
		return false;
	}
	
//	else if(! airinputForm.startCity.value) {
//		alert(scityMsg);
//		return false;
//	}
	
	// 도착 지역 선택 X
	else if(! airinputForm.finishCountry.value) {
		alert(fcountryhMsg);
		airinputForm.finishCountry.focus();
		return false;
	}
	
//	else if(! airinputForm.finishCity.value) {
//		alert(fcityhMsg);
//		airinputForm.finishCity.focus();
//		return false;
//	}
	
	// 날짜 비교
	else if(airinputForm.startDate.value > airinputForm.finishDate.value) {
		alert(dateMsg);
		airinputForm.startDate.focus();
		return false;
	
	// 시간 비교
	} else if(airinputForm.startDate.value == airinputForm.finishDate.value) {
		if (airinputForm.startTime.value > airinputForm.finishTime.value) {
			alert(timeMsg);
			airinputForm.startDate.focus();
			return false;
		}
	}
}


function reservinputCheck() {
	let count = $("input:checked[type='checkbox']").length;
	
	var selectperseon = $("#seatMember option:selected").val();
	if(selectperseon == "10"){
		var perseon = $("#Membernum1").val();
	} else {
		var perseon = $("#seatMember option:selected").val();
	}
	
	if(!$("input:checked[name='seatNum'").is(":checked")){
		alert('좌석을 선택하세요');
		return false;
	} else if (count < perseon) {
		alert("좌석이 선택하신 인원수보다 적습니다.");
		return false;
		
	}
}