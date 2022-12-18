<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib prefix = "fn" uri = "http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE HTML>
<!--
	Phantom by HTML5 UP
	html5up.net | @ajlkn
	Free for personal and commercial use under the CCA 3.0 license (html5up.net/license)
-->
<html>
	<head>
		<title>Phantom by HTML5 UP</title>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
		<link rel="stylesheet" href="../../assets/css/main.css" />
		<noscript><link rel="stylesheet" href="../../assets/css/noscript.css" /></noscript>
		<style>
			.modal-wrapper {
			  position: fixed;
			  top: 0;
			  left: 0;
			  width: 100%;
			  height: 100%;
			  background: rgba(0, 0, 0, 0.5);
			  display: flex;
			  align-items: center;
			  justify-content: center;
			}
			
			.modal {
			  background: white;
			  padding: 24px 16px;
			  border-radius: 4px;
			  width: 80%;
			  height:90%;
			  overflow-y: auto;
			}
			
			.modal-title {
			  font-size: 24px;
			  font-weight: bold;
			}
			
			.modal p {
			  font-size: 16px;
			}
			
			.close-wrapper {
			  text-align: right;
			}
			
			#close {
				float:right;
			}
		</style>
	</head>
	<body class="is-preload">
		<!-- Wrapper --> 
			<div id="wrapper">

				<!-- Header -->
					<header id="header">
						<div class="inner">

							<!-- Logo -->
								<a href="../index.do" class="logo">
									<span class="symbol"><img src="../../images/logo.svg" alt="" /></span><span class="title">Phantom</span>
								</a>

							<!-- Nav -->
								<nav>
									<ul>
										<li><a href="#menu">Menu</a></li>
									</ul>
								</nav>

						</div>
					</header>

				<!-- Menu -->
					<nav id="menu">
						<!-- 로그인 -->
						<c:if test="${sessionScope.memId ne null}">
						<div style="display:flex">
							<h3 style="font-widegt:bold">${dto.userName}</h3><h4>님 안녕하세요.</h4>
						</div>
						<ul>
							<li><a href="../user/logoutPro.do">로그아웃</a></li>
							<li><a href="../reservair/myReserv.do?userId=${dto.userId}">내 예약 보기</a></li>
							<li><a href="../reservair/reservmain.do?userId=${dto.userId}">예약 하러가기</a></li>
							<li><a href="../user/usermodifyForm.do?userId=${dto.userId}">회원정보 수정</a></li>
							<li><a href="../user/userdeleteForm.do?userId=${dto.userId}">회원탈퇴</a></li>
						</ul>
						</c:if>
					</nav>

				<!-- Main -->
					<div id="main">
						<div class="inner">						
							<h1>이곳은 공항</h1>
							
							<div style="display:flex; justify-content:center;">
								
								<div>
									<h4>${ato.startCountry} - ${ato.startCity}</h4>
									<h5>${ato.startDate} - ${ato.startTime}</h5>
								</div>
								
								<span style="width:100px;"></span>
								
								<div>
									<span><img src="../../images/airplane.png" alt="" /></span>
								</div>
								
								<span style="width:100px;"></span>
								
								<div>
									<h4>${ato.finishCountry} - ${ato.finishCity}</h4>
									<h5>${ato.finishDate} - ${ato.finishTime}</h5>
								</div>						
							</div>
							
							<button id="open" style="width:100%;">예약하기</button>
							
							<!-- 이 부분부터 모달 페이지  -->
						    <div class="modal-wrapper" style="display: none; z-index: 1;">
						      <div class="modal">
						      <form method="post" action="reservinputPro.do" name="resercinputForm" onsubmit="return reservinputCheck()">
						        <div class="modal-title">옵션을 선택하세요  <button id="close" type="button">닫기</button></div>
						        	<input type="hidden" name="userId" value="${dto.userId}">
						        	<input type="hidden" name="reservAir" value="${ato.airName}">
						        	<input type="hidden" name="reservNum" value="${reservNum}">
						        	<input type="hidden" name="reNum" value="${ato.reNum}">
						        	<div style="display:flex;">
						        		<div class="col-12 col-12-small" style="width:40%">
											<select name="reservPerseon" id="seatMember">
												<option value="123">탑승 인원</option>
												<option value="1">1</option>
												<option value="2">2</option>
												<option value="3">3</option>
												<option value="4">4</option>
												<option value="5">5</option>
												<option value="6">6</option>
												<option value="7">7</option>
												<option value="8">8</option>
												<option value="9">9</option>
												<option value="10">직접입력</option>
											</select>
											<input type="text" name="reservPerseons" id="Membernum1" oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');" maxlength="3">
										</div>
										
										<script type="text/javascript" src="http://code.jquery.com/jquery-latest.min.js"></script>
										<script>
											$("#Membernum1").hide();
										</script>
										<script type="text/javascript">
										//인원 선택
										$('#seatMember').change(function(){
										   $("#seatMember option:selected").each(function () {
											   if($(this).val()== '123'){
												   $("#Membernum1").hide();
												   $("#seatLevel").hide();
												   $("#seatselect1").hide();
												   $("#seatselect2").hide();
												   $("#seatselect3").hide();
												   $("#seatselect1").attr("disabled",true);
												   $("#seatselect2").attr("disabled",true);
												   $("#seatselect3").attr("disabled",true);
												   $("#Membernum1").attr("disabled",true); //비활성화
												   $(".seat").prop('checked', false);
											   }
										   		else if($(this).val()== '10'){ //직접입력일 경우
													 $("#Membernum1").val('');                        //값 초기화	 
													 $("#seatLevel").show();
													 $("#Membernum1").show();
													 $("#Membernum1").attr("disabled",false); //활성화
													 $(".seat").prop('checked', false);
												}else{ //직접입력이 아닐경우
													 $("#Membernum1").hide();
													 $("#seatLevel").show();
													 $("#Membernum1").attr("disabled",true); //비활성화
													 $(".seat").prop('checked', false);
												}
										   });
										});
										</script>
										&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
										<div class="col-12 col-12-small" style="width:40%">
											<select name="seatLevel" id="seatLevel">
												<option value="123">좌석 선택</option>
												<option value="일반석">이코노미 클래스(일반석)</option>
												<option value="이등석">비지니스 클래스(이등석)</option>
												<option value="일등석">퍼스트 클래스(일등석)</option>
											</select>
										</div>
										
										<script type="text/javascript" src="http://code.jquery.com/jquery-latest.min.js"></script>
										<script type="text/javascript">
										//인원 선택
										$('#seatLevel').change(function(){
										   $("#seatLevel option:selected").each(function () {
										   		if($(this).val()== '123'){		
												   	 $("#seatselect1").hide();
													 $("#seatselect2").hide();
													 $("#seatselect3").hide();
													 
													 $("#seatselect1").attr("disabled",false); //활성화
													 $("#seatselect2").attr("disabled",true);
													 $("#seatselect3").attr("disabled",true);
													 $(".seat").prop('checked', false);
										   		}else if($(this).val()== '일반석'){
													 $("#seatselect1").show();
													 
													 $("#seatselect2").hide();
													 $("#seatselect3").hide();
													 
													 $("#seatselect1").attr("disabled",false); //활성화
													 $("#seatselect2").attr("disabled",true);
													 $("#seatselect3").attr("disabled",true);
													 $(".seat").prop('checked', false);
													 
												} else if($(this).val()== '이등석') {
													 $("#seatselect2").show();
													 
													 $("#seatselect1").hide();
													 $("#seatselect3").hide();
													 
													 $("#seatselect2").attr("disabled",false); //활성화
													 $("#seatselect1").attr("disabled",true);
													 $("#seatselect3").attr("disabled",true);
													 $(".seat").prop('checked', false);

													 
												} else if ($(this).val()== '일등석'){
													$("#seatselect3").show();
													
													$("#seatselect1").hide();
													$("#seatselect2").hide();
													
													$("#seatselect3").attr("disabled",false); //활성화
													$("#seatselect1").attr("disabled",true);
													$("#seatselect2").attr("disabled",true);
													$(".seat").prop('checked', false);
													
												} else {
													$("#seatselect1").hide();
													$("#seatselect2").hide();
													$("#seatselect3").hide();
													$(".seat").prop('checked', false);
												}
										   });
										});
										</script>
										
						        	</div>
					        		<br>
									<!-- 여기부터 좌석 출력  -->
									<div class="col-6 col-12-small" id="seatselect1">
										<input type="checkbox" id="K20" name="seatNum" value="K20" class="seat">
										<label for="K20">K20</label>
										<input type="checkbox" id="K21" name="seatNum" value="K21" class="seat">
										<label for="K21">K21</label>
										<input type="checkbox" id="K22" name="seatNum" value="K22" class="seat">
										<label for="K22">K22</label>
										<input type="checkbox" id="K23" name="seatNum" value="K23" class="seat">
										<label for="K23">K23</label>
										<input type="checkbox" id="K24" name="seatNum" value="K24" class="seat">
										<label for="K24">K24</label>
										<input type="checkbox" id="K25" name="seatNum" value="K25" class="seat">
										<label for="K25">K25</label>
										<input type="checkbox" id="K26" name="seatNum" value="K26" class="seat">
										<label for="K26">K26</label>
										<input type="checkbox" id="K27" name="seatNum" value="K27" class="seat">
										<label for="K27">K27</label>
										<input type="checkbox" id="K28" name="seatNum" value="K28" class="seat">
										<label for="K28">K28</label>
										<input type="checkbox" id="K29" name="seatNum" value="K29" class="seat">
										<label for="K29">K29</label>
										<input type="checkbox" id="K30" name="seatNum" value="K30" class="seat">
										<label for="K30">K30</label>
										<input type="checkbox" id="K31" name="seatNum" value="K31" class="seat">
										<label for="K31">K31</label>
										<input type="checkbox" id="K32" name="seatNum" value="K32" class="seat">
										<label for="K32">K32</label>
										<input type="checkbox" id="K33" name="seatNum" value="K33" class="seat">
										<label for="K33">K33</label>
										<input type="checkbox" id="K34" name="seatNum" value="K34" class="seat">
										<label for="K34">K34</label>
										<input type="checkbox" id="K35" name="seatNum" value="K35" class="seat">
										<label for="K35">K35</label>
										<br>
										<input type="checkbox" id="J20" name="seatNum" value="J20" class="seat">
										<label for="J20">J20</label>
										<input type="checkbox" id="J21" name="seatNum" value="J21" class="seat">
										<label for="J21">J21</label>
										<input type="checkbox" id="J22" name="seatNum" value="J22" class="seat">
										<label for="J22">J22</label>
										<input type="checkbox" id="J23" name="seatNum" value="J23" class="seat">
										<label for="J23">J23</label>
										<input type="checkbox" id="J24" name="seatNum" value="J24" class="seat">
										<label for="J24">J24</label>
										<input type="checkbox" id="J25" name="seatNum" value="J25" class="seat">
										<label for="J25">J25</label>
										<input type="checkbox" id="J26" name="seatNum" value="J26" class="seat">
										<label for="J26">J26</label>
										<input type="checkbox" id="J27" name="seatNum" value="J27" class="seat">
										<label for="J27">J27</label>
										<input type="checkbox" id="J28" name="seatNum" value="J28" class="seat">
										<label for="J28">J28</label>
										<input type="checkbox" id="J29" name="seatNum" value="J29" class="seat">
										<label for="J29">J29</label>
										<input type="checkbox" id="J30" name="seatNum" value="J30" class="seat">
										<label for="J30">J30</label>
										<input type="checkbox" id="J31" name="seatNum" value="J31" class="seat">
										<label for="J31">J31</label>
										<input type="checkbox" id="J32" name="seatNum" value="J32" class="seat">
										<label for="J32">J32</label>
										<input type="checkbox" id="J33" name="seatNum" value="J33" class="seat">
										<label for="J33">J33</label>
										<input type="checkbox" id="J34" name="seatNum" value="J34" class="seat">
										<label for="J34">J34</label>
										<input type="checkbox" id="J35" name="seatNum" value="J35" class="seat">
										<label for="J35">J35</label>
										<br>
										<input type="checkbox" id="H20" name="seatNum" value="H20" class="seat">
										<label for="H20">H20</label>
										<input type="checkbox" id="H21" name="seatNum" value="H21" class="seat">
										<label for="H21">H21</label>
										<input type="checkbox" id="H22" name="seatNum" value="H22" class="seat">
										<label for="H22">H22</label>
										<input type="checkbox" id="H23" name="seatNum" value="H23" class="seat">
										<label for="H23">H23</label>
										<input type="checkbox" id="H24" name="seatNum" value="H24" class="seat">
										<label for="H24">H24</label>
										<input type="checkbox" id="H25" name="seatNum" value="H25" class="seat">
										<label for="H25">H25</label>
										<input type="checkbox" id="H26" name="seatNum" value="H26" class="seat">
										<label for="H26">H26</label>
										<input type="checkbox" id="H27" name="seatNum" value="H27" class="seat">
										<label for="H27">H27</label>
										<input type="checkbox" id="H28" name="seatNum" value="H28" class="seat">
										<label for="H28">H28</label>
										<input type="checkbox" id="H29" name="seatNum" value="H29" class="seat">
										<label for="H29">H29</label>
										<input type="checkbox" id="H30" name="seatNum" value="H30" class="seat">
										<label for="H30">H30</label>
										<input type="checkbox" id="H31" name="seatNum" value="H31" class="seat">
										<label for="H31">H31</label>
										<input type="checkbox" id="H32" name="seatNum" value="H32" class="seat">
										<label for="H32">H32</label>
										<input type="checkbox" id="H33" name="seatNum" value="H33" class="seat">
										<label for="H33">H33</label>
										<input type="checkbox" id="H34" name="seatNum" value="H34" class="seat">
										<label for="H34">H34</label>
										<input type="checkbox" id="H35" name="seatNum" value="H35" class="seat">
										<label for="H35">H35</label>
										<br>
										<input type="checkbox" id="G20" name="seatNum" value="G20" class="seat">
										<label for="G20">G20</label>
										<input type="checkbox" id="G21" name="seatNum" value="G21" class="seat">
										<label for="G21">G21</label>
										<input type="checkbox" id="G22" name="seatNum" value="G22" class="seat">
										<label for="G22">G22</label>
										<input type="checkbox" id="G23" name="seatNum" value="G23" class="seat">
										<label for="G23">G23</label>
										<input type="checkbox" id="G24" name="seatNum" value="G24" class="seat">
										<label for="G24">G24</label>
										<input type="checkbox" id="G25" name="seatNum" value="G25" class="seat">
										<label for="G25">G25</label>
										<input type="checkbox" id="G26" name="seatNum" value="G26" class="seat">
										<label for="G26">G26</label>
										<input type="checkbox" id="G27" name="seatNum" value="G27" class="seat">
										<label for="G27">G27</label>
										<input type="checkbox" id="G28" name="seatNum" value="G28" class="seat">
										<label for="G28">G28</label>
										<input type="checkbox" id="G29" name="seatNum" value="G29" class="seat">
										<label for="G29">G29</label>
										<input type="checkbox" id="G30" name="seatNum" value="G30" class="seat">
										<label for="G30">G30</label>
										<input type="checkbox" id="G31" name="seatNum" value="G31" class="seat">
										<label for="G31">G31</label>
										<input type="checkbox" id="G32" name="seatNum" value="G32" class="seat">
										<label for="G32">G32</label>
										<input type="checkbox" id="G33" name="seatNum" value="G33" class="seat">
										<label for="G33">G33</label>
										<input type="checkbox" id="G34" name="seatNum" value="G34" class="seat">
										<label for="G34">G34</label>
										<input type="checkbox" id="G35" name="seatNum" value="G35" class="seat">
										<label for="G35">G35</label>
										<br>
										<input type="checkbox" id="F20" name="seatNum" value="F20" class="seat">
										<label for="F20">F20</label>
										<input type="checkbox" id="F21" name="seatNum" value="F21" class="seat">
										<label for="F21">F21</label>
										<input type="checkbox" id="F22" name="seatNum" value="F22" class="seat">
										<label for="F22">F22</label>
										<input type="checkbox" id="F23" name="seatNum" value="F23" class="seat">
										<label for="F23">F23</label>
										<input type="checkbox" id="F24" name="seatNum" value="F24" class="seat">
										<label for="F24">F24</label>
										<input type="checkbox" id="F25" name="seatNum" value="F25" class="seat">
										<label for="F25">F25</label>
										<input type="checkbox" id="F26" name="seatNum" value="F26" class="seat">
										<label for="F26">F26</label>
										<input type="checkbox" id="F27" name="seatNum" value="F27" class="seat">
										<label for="F27">F27</label>
										<input type="checkbox" id="F28" name="seatNum" value="F28" class="seat">
										<label for="F28">F28</label>
										<input type="checkbox" id="F29" name="seatNum" value="F29" class="seat">
										<label for="F29">F29</label>
										<input type="checkbox" id="F30" name="seatNum" value="F30" class="seat">
										<label for="F30">F30</label>
										<input type="checkbox" id="F31" name="seatNum" value="F31" class="seat">
										<label for="F31">F31</label>
										<input type="checkbox" id="F32" name="seatNum" value="F32" class="seat">
										<label for="F32">F32</label>
										<input type="checkbox" id="F33" name="seatNum" value="F33" class="seat">
										<label for="F33">F33</label>
										<input type="checkbox" id="F34" name="seatNum" value="F34" class="seat">
										<label for="F34">F34</label>
										<input type="checkbox" id="F35" name="seatNum" value="F35" class="seat">
										<label for="F35">F35</label>
										<br>
										<input type="checkbox" id="E20" name="seatNum" value="E20" class="seat">
										<label for="E20">E20</label>
										<input type="checkbox" id="E21" name="seatNum" value="E21" class="seat">
										<label for="E21">E21</label>
										<input type="checkbox" id="E22" name="seatNum" value="E22" class="seat">
										<label for="E22">E22</label>
										<input type="checkbox" id="E23" name="seatNum" value="E23" class="seat">
										<label for="E23">E23</label>
										<input type="checkbox" id="E24" name="seatNum" value="E24" class="seat">
										<label for="E24">E24</label>
										<input type="checkbox" id="E25" name="seatNum" value="E25" class="seat">
										<label for="E25">E25</label>
										<input type="checkbox" id="E26" name="seatNum" value="E26" class="seat">
										<label for="E26">E26</label>
										<input type="checkbox" id="E27" name="seatNum" value="E27" class="seat">
										<label for="E27">E27</label>
										<input type="checkbox" id="E28" name="seatNum" value="E28" class="seat">
										<label for="E28">E28</label>
										<input type="checkbox" id="E29" name="seatNum" value="E29" class="seat">
										<label for="E29">E29</label>
										<input type="checkbox" id="E30" name="seatNum" value="E30" class="seat">
										<label for="E30">E30</label>
										<input type="checkbox" id="E31" name="seatNum" value="E31" class="seat">
										<label for="E31">E31</label>
										<input type="checkbox" id="E32" name="seatNum" value="E32" class="seat">
										<label for="E32">E32</label>
										<input type="checkbox" id="E33" name="seatNum" value="E33" class="seat">
										<label for="E33">E33</label>
										<input type="checkbox" id="E34" name="seatNum" value="E34" class="seat">
										<label for="E34">E34</label>
										<input type="checkbox" id="E35" name="seatNum" value="E35" class="seat">
										<label for="E35">E35</label>
										<br>
										<input type="checkbox" id="D20" name="seatNum" value="D20" class="seat">
										<label for="F20">D20</label>
										<input type="checkbox" id="D21" name="seatNum" value="D21" class="seat">
										<label for="F21">D21</label>
										<input type="checkbox" id="D22" name="seatNum" value="D22" class="seat">
										<label for="F22">D22</label>
										<input type="checkbox" id="D23" name="seatNum" value="D23" class="seat">
										<label for="F23">D23</label>
										<input type="checkbox" id="D24" name="seatNum" value="D24" class="seat">
										<label for="F24">D24</label>
										<input type="checkbox" id="D25" name="seatNum" value="D25" class="seat">
										<label for="F25">D25</label>
										<input type="checkbox" id="D26" name="seatNum" value="D26" class="seat">
										<label for="F26">D26</label>
										<input type="checkbox" id="D27" name="seatNum" value="D27" class="seat">
										<label for="F27">D27</label>
										<input type="checkbox" id="D28" name="seatNum" value="D28" class="seat">
										<label for="F28">D28</label>
										<input type="checkbox" id="D29" name="seatNum" value="D29" class="seat">
										<label for="F29">D29</label>
										<input type="checkbox" id="D30" name="seatNum" value="D30" class="seat">
										<label for="F30">D30</label>
										<input type="checkbox" id="D31" name="seatNum" value="D31" class="seat">
										<label for="F31">D31</label>
										<input type="checkbox" id="D32" name="seatNum" value="D32" class="seat">
										<label for="F32">D32</label>
										<input type="checkbox" id="D33" name="seatNum" value="D33" class="seat">
										<label for="F33">D33</label>
										<input type="checkbox" id="D34" name="seatNum" value="D34" class="seat">
										<label for="F34">D34</label>
										<input type="checkbox" id="D35" name="seatNum" value="D35" class="seat">
										<label for="F35">D35</label>
										<br>	
										<input type="checkbox" id="C20" name="seatNum" value="C20" class="seat">
										<label for="C20">C20</label>
										<input type="checkbox" id="C21" name="seatNum" value="C21" class="seat">
										<label for="C21">C21</label>
										<input type="checkbox" id="C22" name="seatNum" value="C22" class="seat">
										<label for="C22">C22</label>
										<input type="checkbox" id="C23" name="seatNum" value="C23" class="seat">
										<label for="C23">C23</label>
										<input type="checkbox" id="C24" name="seatNum" value="C24" class="seat">
										<label for="C24">C24</label>
										<input type="checkbox" id="C25" name="seatNum" value="C25" class="seat">
										<label for="C25">C25</label>
										<input type="checkbox" id="C26" name="seatNum" value="C26" class="seat">
										<label for="C26">C26</label>
										<input type="checkbox" id="C27" name="seatNum" value="C27" class="seat">
										<label for="C27">C27</label>
										<input type="checkbox" id="C28" name="seatNum" value="C28" class="seat">
										<label for="C28">C28</label>
										<input type="checkbox" id="C29" name="seatNum" value="C29" class="seat">
										<label for="C29">C29</label>
										<input type="checkbox" id="C30" name="seatNum" value="C30" class="seat">
										<label for="C30">C30</label>
										<input type="checkbox" id="C31" name="seatNum" value="C31" class="seat">
										<label for="C31">C31</label>
										<input type="checkbox" id="C32" name="seatNum" value="C32" class="seat">
										<label for="C32">C32</label>
										<input type="checkbox" id="C33" name="seatNum" value="C33" class="seat">
										<label for="C33">V33</label>
										<input type="checkbox" id="C34" name="seatNum" value="C34" class="seat">
										<label for="C34">C34</label>
										<input type="checkbox" id="C35" name="seatNum" value="C35" class="seat">
										<label for="C35">C35</label>
										<br>	
										<input type="checkbox" id="B20" name="seatNum" value="B20" class="seat">
										<label for="B20">B20</label>
										<input type="checkbox" id="B21" name="seatNum" value="B21" class="seat">
										<label for="B21">B21</label>
										<input type="checkbox" id="B22" name="seatNum" value="B22" class="seat">
										<label for="B22">B22</label>
										<input type="checkbox" id="B23" name="seatNum" value="B23" class="seat">
										<label for="B23">B23</label>
										<input type="checkbox" id="B24" name="seatNum" value="B24" class="seat">
										<label for="B24">B24</label>
										<input type="checkbox" id="B25" name="seatNum" value="B25" class="seat">
										<label for="B25">B25</label>
										<input type="checkbox" id="B26" name="seatNum" value="B26" class="seat">
										<label for="B26">B26</label>
										<input type="checkbox" id="B27" name="seatNum" value="B27" class="seat">
										<label for="B27">B27</label>
										<input type="checkbox" id="B28" name="seatNum" value="B28" class="seat">
										<label for="B28">B28</label>
										<input type="checkbox" id="B29" name="seatNum" value="B29" class="seat">
										<label for="B29">B29</label>
										<input type="checkbox" id="B30" name="seatNum" value="B30" class="seat">
										<label for="B30">B30</label>
										<input type="checkbox" id="B31" name="seatNum" value="B31" class="seat">
										<label for="B31">B31</label>
										<input type="checkbox" id="B32" name="seatNum" value="B32" class="seat">
										<label for="B32">B32</label>
										<input type="checkbox" id="B33" name="seatNum" value="B33" class="seat">
										<label for="B33">B33</label>
										<input type="checkbox" id="B34" name="seatNum" value="B34" class="seat">
										<label for="B34">B34</label>
										<input type="checkbox" id="B35" name="seatNum" value="B35" class="seat">
										<label for="B35">B35</label>
										<br>
										<input type="checkbox" id="A20" name="seatNum" value="A20" class="seat">
										<label for="A20">A20</label>
										<input type="checkbox" id="A21" name="seatNum" value="A21" class="seat">
										<label for="A21">A21</label>
										<input type="checkbox" id="A22" name="seatNum" value="A22" class="seat">
										<label for="A22">A22</label>
										<input type="checkbox" id="A23" name="seatNum" value="A23" class="seat">
										<label for="A23">A23</label>
										<input type="checkbox" id="A24" name="seatNum" value="A24" class="seat">
										<label for="A24">A24</label>
										<input type="checkbox" id="A25" name="seatNum" value="A25" class="seat">
										<label for="A25">A25</label>
										<input type="checkbox" id="A26" name="seatNum" value="A26" class="seat">							
										<label for="A26">A26</label>
										<input type="checkbox" id="A27" name="seatNum" value="A27" class="seat">
										<label for="A27">A27</label>
										<input type="checkbox" id="A28" name="seatNum" value="A28" class="seat">
										<label for="A28">A28</label>
										<input type="checkbox" id="A29" name="seatNum" value="A29" class="seat">
										<label for="A29">A29</label>
										<input type="checkbox" id="A30" name="seatNum" value="A30" class="seat">
										<label for="A30">A30</label>
										<input type="checkbox" id="A31" name="seatNum" value="A31" class="seat">
										<label for="A31">A31</label>
										<input type="checkbox" id="A32" name="seatNum" value="A32" class="seat">
										<label for="A32">A32</label>
										<input type="checkbox" id="A33" name="seatNum" value="A33" class="seat">
										<label for="A33">A33</label>
										<input type="checkbox" id="A34" name="seatNum" value="A34" class="seat">
										<label for="A34">A34</label>
										<input type="checkbox" id="A35" name="seatNum" value="A35" class="seat">
										<label for="A35">A35</label>
										<br>
										<img src="../../images/airnormalseat.png">
										<br><br>
										<input type="submit" value="예약하기" class="primary" style="width:100%" />
									</div>
									
									
									
									
									<div class="col-6 col-12-small" id="seatselect2">
										<input type="checkbox" id="H4" name="seatNum" value="H4" class="seat">
										<label for="H4">H4</label>
										<input type="checkbox" id="H5" name="seatNum" value="H5" class="seat">
										<label for="H5">H5</label>
										<input type="checkbox" id="H6" name="seatNum" value="H6" class="seat">
										<label for="H6">H6</label>
										<input type="checkbox" id="H7" name="seatNum" value="H7" class="seat">
										<label for="H7">H7</label>
										<input type="checkbox" id="H8" name="seatNum" value="H8" class="seat">
										<label for="H8">H8</label>
										<input type="checkbox" id="H9" name="seatNum" value="H9" class="seat">
										<label for="H9">H9</label>
										<input type="checkbox" id="H10" name="seatNum" value="H10" class="seat">
										<label for="H10">H10</label>
										<input type="checkbox" id="H11" name="seatNum" value="H11" class="seat">
										<label for="H11">H11</label>
										<input type="checkbox" id="H12" name="seatNum" value="H12" class="seat">
										<label for="H12">H12</label>
										<input type="checkbox" id="H13" name="seatNum" value="H13" class="seat">
										<label for="H13">H13</label>
										<input type="checkbox" id="H14" name="seatNum" value="H14" class="seat">
										<label for="H14">H14</label>
										<input type="checkbox" id="H15" name="seatNum" value="H15" class="seat">
										<label for="H15">H15</label>
										<input type="checkbox" id="H16" name="seatNum" value="H16" class="seat">
										<label for="H16">H16</label>
										<input type="checkbox" id="H17" name="seatNum" value="H17" class="seat">
										<label for="H17">H17</label>
										<input type="checkbox" id="H18" name="seatNum" value="H18" class="seat">
										<label for="H18">H18</label>
										<input type="checkbox" id="H19" name="seatNum" value="H19" class="seat">
										<label for="H19">H19</label>
										<br>
										<input type="checkbox" id="G4" name="seatNum" value="G4" class="seat">
										<label for="G4">G4</label>
										<input type="checkbox" id="G5" name="seatNum" value="G5" class="seat">
										<label for="G5">G5</label>
										<input type="checkbox" id="G6" name="seatNum" value="G6" class="seat">
										<label for="G6">G6</label>
										<input type="checkbox" id="G7" name="seatNum" value="G7" class="seat">
										<label for="G7">G7</label>
										<input type="checkbox" id="G8" name="seatNum" value="G8" class="seat">
										<label for="G8">G8</label>
										<input type="checkbox" id="G9" name="seatNum" value="G9" class="seat">
										<label for="G9">G9</label>
										<input type="checkbox" id="G10" name="seatNum" value="G10" class="seat">
										<label for="G10">G10</label>
										<input type="checkbox" id="G11" name="seatNum" value="G11" class="seat">
										<label for="G11">G11</label>
										<input type="checkbox" id="G12" name="seatNum" value="G12" class="seat">
										<label for="G12">G12</label>
										<input type="checkbox" id="G13" name="seatNum" value="G13" class="seat">
										<label for="G13">G13</label>
										<input type="checkbox" id="G14" name="seatNum" value="G14" class="seat">
										<label for="G14">G14</label>
										<input type="checkbox" id="G15" name="seatNum" value="G15" class="seat">
										<label for="G15">G15</label>
										<input type="checkbox" id="G16" name="seatNum" value="G16" class="seat">
										<label for="G16">G16</label>
										<input type="checkbox" id="G17" name="seatNum" value="G17" class="seat">
										<label for="G17">G17</label>
										<input type="checkbox" id="G18" name="seatNum" value="G18" class="seat">
										<label for="G18">G18</label>
										<input type="checkbox" id="G19" name="seatNum" value="G19" class="seat">
										<label for="G19">G19</label>
										<br>
										<input type="checkbox" id="E4" name="seatNum" value="E4" class="seat">
										<label for="E4">E4</label>
										<input type="checkbox" id="E5" name="seatNum" value="E5" class="seat">
										<label for="E5">E5</label>
										<input type="checkbox" id="E6" name="seatNum" value="E6" class="seat">
										<label for="E6">E6</label>
										<input type="checkbox" id="E7" name="seatNum" value="E7" class="seat">
										<label for="E7">E7</label>
										<input type="checkbox" id="E8" name="seatNum" value="E8" class="seat">
										<label for="E8">E8</label>
										<input type="checkbox" id="E9" name="seatNum" value="E9" class="seat">
										<label for="E9">E9</label>
										<input type="checkbox" id="E10" name="seatNum" value="E10" class="seat">
										<label for="E10">E10</label>
										<input type="checkbox" id="E11" name="seatNum" value="E11" class="seat">
										<label for="E11">E11</label>
										<input type="checkbox" id="E12" name="seatNum" value="E12" class="seat">
										<label for="E12">E12</label>
										<input type="checkbox" id="E13" name="seatNum" value="E13" class="seat">
										<label for="E13">E13</label>
										<input type="checkbox" id="E14" name="seatNum" value="E14" class="seat">
										<label for="E14">E14</label>
										<input type="checkbox" id="E15" name="seatNum" value="E15" class="seat">
										<label for="E15">E15</label>
										<input type="checkbox" id="E16" name="seatNum" value="E16" class="seat">
										<label for="E16">E16</label>
										<input type="checkbox" id="E17" name="seatNum" value="E17" class="seat">
										<label for="E17">E17</label>
										<input type="checkbox" id="E18" name="seatNum" value="E18" class="seat">
										<label for="E18">E18</label>
										<input type="checkbox" id="E19" name="seatNum" value="E19" class="seat">
										<label for="E19">E19</label>

										<br>
										<input type="checkbox" id="D4" name="seatNum" value="D4" class="seat">
										<label for="D4">D4</label>
										<input type="checkbox" id="D5" name="seatNum" value="D5" class="seat">
										<label for="D5">D5</label>
										<input type="checkbox" id="D6" name="seatNum" value="D6" class="seat">
										<label for="D6">D6</label>
										<input type="checkbox" id="D7" name="seatNum" value="D7" class="seat">
										<label for="D7">D7</label>
										<input type="checkbox" id="D8" name="seatNum" value="D8" class="seat">
										<label for="D8">D8</label>
										<input type="checkbox" id="D9" name="seatNum" value="D9" class="seat">
										<label for="D9">D9</label>
										<input type="checkbox" id="D10" name="seatNum" value="D10" class="seat">
										<label for="D10">D10</label>
										<input type="checkbox" id="D11" name="seatNum" value="D11" class="seat">
										<label for="D11">D11</label>
										<input type="checkbox" id="D12" name="seatNum" value="D12" class="seat">
										<label for="D12">D12</label>
										<input type="checkbox" id="D13" name="seatNum" value="D13" class="seat">
										<label for="D13">D13</label>
										<input type="checkbox" id="D14" name="seatNum" value="D14" class="seat">
										<label for="D14">D14</label>
										<input type="checkbox" id="D15" name="seatNum" value="D15" class="seat">
										<label for="D15">D15</label>
										<input type="checkbox" id="D16" name="seatNum" value="D16" class="seat">
										<label for="D16">D16</label>
										<input type="checkbox" id="D17" name="seatNum" value="D17" class="seat">
										<label for="D17">D17</label>
										<input type="checkbox" id="D18" name="seatNum" value="D18" class="seat">
										<label for="D18">D18</label>
										<input type="checkbox" id="D19" name="seatNum" value="D19" class="seat">
										<label for="D19">D19</label>
										<br>
										<input type="checkbox" id="B4" name="seatNum" value="B4" class="seat">
										<label for="B4">B4</label>
										<input type="checkbox" id="B5" name="seatNum" value="B5" class="seat">
										<label for="B5">B5</label>
										<input type="checkbox" id="B6" name="seatNum" value="B6" class="seat">
										<label for="B6">B6</label>
										<input type="checkbox" id="B7" name="seatNum" value="B7" class="seat">
										<label for="B7">B7</label>
										<input type="checkbox" id="B8" name="seatNum" value="B8" class="seat">
										<label for="B8">B8</label>
										<input type="checkbox" id="B9" name="seatNum" value="B9" class="seat">
										<label for="B9">B9</label>
										<input type="checkbox" id="B10" name="seatNum" value="B10" class="seat">
										<label for="B10">B10</label>
										<input type="checkbox" id="B11" name="seatNum" value="B11" class="seat">
										<label for="B11">B11</label>
										<input type="checkbox" id="B12" name="seatNum" value="B12" class="seat">
										<label for="B12">B12</label>
										<input type="checkbox" id="B13" name="seatNum" value="B13" class="seat">
										<label for="B13">B13</label>
										<input type="checkbox" id="B14" name="seatNum" value="B14" class="seat">
										<label for="B14">B14</label>
										<input type="checkbox" id="B15" name="seatNum" value="B15" class="seat">
										<label for="B15">B15</label>
										<input type="checkbox" id="B16" name="seatNum" value="B16" class="seat">
										<label for="B16">B16</label>
										<input type="checkbox" id="B17" name="seatNum" value="B17" class="seat">
										<label for="B17">B17</label>
										<input type="checkbox" id="B18" name="seatNum" value="B18" class="seat">
										<label for="B18">B18</label>
										<input type="checkbox" id="B19" name="seatNum" value="B19" class="seat">
										<label for="B19">B19</label>
										<br>
										<input type="checkbox" id="A4" name="seatNum" value="A4" class="seat">
										<label for="A4">A4</label>
										<input type="checkbox" id="A5" name="seatNum" value="A5" class="seat">
										<label for="A5">A5</label>
										<input type="checkbox" id="A6" name="seatNum" value="A6" class="seat">
										<label for="A6">A6</label>
										<input type="checkbox" id="A7" name="seatNum" value="A7" class="seat">
										<label for="A7">A7</label>
										<input type="checkbox" id="A8" name="seatNum" value="A8" class="seat">
										<label for="A8">A8</label>
										<input type="checkbox" id="A9" name="seatNum" value="A9" class="seat">
										<label for="A9">A9</label>
										<input type="checkbox" id="A10" name="seatNum" value="A10" class="seat">
										<label for="A10">A10</label>
										<input type="checkbox" id="A11" name="seatNum" value="A11" class="seat">
										<label for="A11">A11</label>
										<input type="checkbox" id="A12" name="seatNum" value="A12" class="seat">
										<label for="A12">A12</label>
										<input type="checkbox" id="A13" name="seatNum" value="A13" class="seat">
										<label for="A13">A13</label>
										<input type="checkbox" id="A14" name="seatNum" value="A14" class="seat">
										<label for="A14">A14</label>
										<input type="checkbox" id="A15" name="seatNum" value="A15" class="seat">
										<label for="A15">A15</label>
										<input type="checkbox" id="A16" name="seatNum" value="A16" class="seat">
										<label for="A16">A16</label>
										<input type="checkbox" id="A17" name="seatNum" value="A17" class="seat">
										<label for="A17">A17</label>
										<input type="checkbox" id="A18" name="seatNum" value="A18" class="seat">
										<label for="A18">A18</label>
										<input type="checkbox" id="A19" name="seatNum" value="A19" class="seat">
										<label for="A19">A19</label>
										<br>
										<img src="../../images/airsecondseat.png">
										<br><br>
										<input type="submit" value="예약하기" class="primary" style="width:100%" />
									</div>
									
									
									
									
									<div class="col-6 col-12-small" id="seatselect3" style="justify-content: center;">
										<input type="checkbox" id="J1" name="seatNum" value="J1" class="seat">
										<label for="J1">J1</label>
										<input type="checkbox" id="J2" name="seatNum" value="J2" class="seat">
										<label for="J2">J2</label>
										<input type="checkbox" id="J3" name="seatNum" value="J3" class="seat">
										<label for="J3">J3</label>
										<br>
										<input type="checkbox" id="E1" name="seatNum" value="E1" class="seat">
										<label for="E1">E1</label>
										<input type="checkbox" id="E2" name="seatNum" value="E2" class="seat">
										<label for="E2">E2</label>
										<input type="checkbox" id="E3" name="seatNum" value="E3" class="seat">
										<label for="E3">E3</label>
										<br>
										<input type="checkbox" id="D1" name="seatNum" value="D1" class="seat">
										<label for="D1">D1</label>
										<input type="checkbox" id="D2" name="seatNum" value="D2" class="seat">
										<label for="D2">D2</label>
										<input type="checkbox" id="D3" name="seatNum" value="D3" class="seat">
										<label for="D3">D3</label>
										<br>
										<input type="checkbox" id="A1" name="seatNum" value="A1" class="seat">
										<label for="A1">A1</label>
										<input type="checkbox" id="A2" name="seatNum" value="A2" class="seat">
										<label for="A2">A2</label>
										<input type="checkbox" id="A3" name="seatNum" value="A3" class="seat">
										<label for="A3">A3</label>
										<br>
										<img src="../../images/airfirstseat.png">
										<br><br>
										
										<script>
										$(document).ready(function(){
											$("input[type='checkbox']").on("click", function() {
												let count = $("input:checked[type='checkbox']").length;
												
												/* let perseon = $("input[name='reservPerseons']").val(); */
												/* let perseon = $("#seatMember option:selected").val(); */
												
												var selectperseon = $("#seatMember option:selected").val();
												if(selectperseon == "10"){
													var perseon = $("#Membernum1").val();
												} else {
													var perseon = $("#seatMember option:selected").val();
												}
												
												console.log(count);
												console.log(perseon);
												
												if(count > perseon) {
													$(this).prop("checked", false);
													alert("선택하신 인원보다 많이 선택하실 수 없습니다.");
												}
											});
										});
										</script>
										<script>
										$(document).ready(function(){
											$('#Membernum1').keyup(function(){
												$(".seat").prop('checked', false);
											})
										})
										</script>
										<input type="submit" value="예약하기" class="primary" style="width:100%" />
									</div>
									<!-- 여기까지 -->
								</form>
						      </div>
						    </div>
							<!-- 여기까지 -->
							
							<br><br><br><br><br><br>
							<div class="col-6 col-12-medium">
								<h3>주의사항</h3>
								<ul>
									<li>1. 아무거나 </li>
									<li>2. 들어가면</li>
									<li>3. 하지만 빨랐죠?</li>
								</ul>
							</div>
							
						</div>
					</div>

				<!-- Footer -->
					<footer id="footer" style="z-index: 0">
						<div class="inner">
							<section>
								<h2>Get in touch</h2>
								<form method="post" action="#">
									<div class="fields">
										<div class="field half">
											<input type="text" name="name" id="name" placeholder="Name" />
										</div>
										<div class="field half">
											<input type="email" name="email" id="email" placeholder="Email" />
										</div>
										<div class="field">
											<textarea name="message" id="message" placeholder="Message"></textarea>
										</div>
									</div>
									<ul class="actions">
										<li><input type="submit" value="Send" class="primary" /></li>
									</ul>
								</form>
							</section>
							<section>
								<h2>Follow</h2>
								<ul class="icons">
									<li><a href="#" class="icon brands style2 fa-twitter"><span class="label">Twitter</span></a></li>
									<li><a href="#" class="icon brands style2 fa-facebook-f"><span class="label">Facebook</span></a></li>
									<li><a href="#" class="icon brands style2 fa-instagram"><span class="label">Instagram</span></a></li>
									<li><a href="#" class="icon brands style2 fa-dribbble"><span class="label">Dribbble</span></a></li>
									<li><a href="#" class="icon brands style2 fa-github"><span class="label">GitHub</span></a></li>
									<li><a href="#" class="icon brands style2 fa-500px"><span class="label">500px</span></a></li>
									<li><a href="#" class="icon solid style2 fa-phone"><span class="label">Phone</span></a></li>
									<li><a href="#" class="icon solid style2 fa-envelope"><span class="label">Email</span></a></li>
								</ul>
							</section>
							<ul class="copyright">
								<li>&copy; Untitled. All rights reserved</li><li>Design: <a href="http://html5up.net">HTML5 UP</a></li>
							</ul>
						</div>
					</footer>

			</div>

		<!-- Scripts -->
			<script src="../../assets/js/jquery.min.js"></script>
			<script src="../../assets/js/browser.min.js"></script>
			<script src="../../assets/js/breakpoints.min.js"></script>
			<script src="../../assets/js/util.js"></script>
			<script src="../../assets/js/main.js"></script>
			<script src="../../assets/js/script.js"></script>
			<script>
				$("#seatLevel").hide();
				$("#seatselect1").hide();
				$("#seatselect2").hide();
				$("#seatselect3").hide();
			</script>
			
			<script>
				const open = document.getElementById("open");
				const close = document.getElementById("close");
				const modal = document.querySelector(".modal-wrapper");
				open.onclick = () => {
				  modal.style.display = "flex";
				};
				close.onclick = () => {
				  modal.style.display = "none";
				};
			</script>
	</body>
</html>