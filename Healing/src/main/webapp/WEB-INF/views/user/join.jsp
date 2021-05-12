<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- 기본 CSS -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/resources/css/base.css">
<!-- 개인 디자인 추가-->
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/resources/css/login_join.css">
<!-- SweetAlert(예쁜디자인 alert) -->
<script
	src="${pageContext.request.contextPath }/resources/js/sweetalert/sweetalert.min.js"></script>
<!-- 테마 색상: #e8ddcc, #ead0b8, #f0957d, #d96a53, #7dadcd -->

<!-- 회원가입 -->
<section>

	<div class="container">
		<!-- 그리드: https://www.w3schools.com/bootstrap/bootstrap_grid_system.asp -->
		<div class="row">
			<div class="join-form col-xs-12 col-sm-8 col-md-8">
				<!-- 참고한 w3school -->
				<!-- Form Inputs: https://www.w3schools.com/bootstrap/bootstrap_forms_inputs.asp -->
				<!-- https://www.w3schools.com/bootstrap/bootstrap_forms_inputs2.asp -->
				<!-- 버튼: https://www.w3schools.com/bootstrap/bootstrap_buttons.asp -->
				<!-- 값을 보내야하니 form -->
				<form action="userJoin" id="joinForm" method="post">
					<div class="title-box">회원가입</div>
					<div class="form-group">
						<label for="userId">아이디</label>
						<button type="button" class="btn btn-warning btn-idChk"
							id="btnidChk" onclick="idChk()">아이디 중복 체크</button>
						<div class="input-shadow">
							<input id="userId" type="text" class="form-control" name="userId"
								placeholder="영어,숫자 8글자 이상" required="required"
								oninvalid="this.setCustomValidity('아이디를 입력해주세요')">
						</div>
					</div>

					<div class="form-group">
						<label for="userPwd">비밀번호</label>
						<div class="input-shadow">
							<input id="userPwd" type="password" class="form-control"
								name="userPwd"
								placeholder="8자이상 영어(소문자), 숫자, 특수문자 포함"
								required="required"
								oninvalid="this.setCustomValidity('비밀번호를 입력하세요')">
						</div>
					</div>

					<!--비밀번호 확인-->
					<div class="form-group">
						<label for="pwdChk">비밀번호 확인</label>
						<!-- 숨겨진 경고창 -->
						<span id="pwdWarn" style="float: right"></span>
						<div class="input-shadow">
							<input id="pwdChk" type="password" class="form-control"
								name="pwdChk" placeholder="비밀번호 확인">
						</div>
					</div>
					<div class="form-group">
						<label for="name">이름</label> 
						<span id="nameWarn"	style="float: right"></span>
						<div class="input-shadow">
							<input type="text" class="form-control" name="userName"
								id="userName">
						</div>
					</div>
					<div class="form-group">
						<label for="age">나이</label> 
						<span id="ageWarn"	style="float: right"></span>
						<div class="input-shadow">
							<input type="text" class="form-control" name="userAge"
								id="userAge">
						</div>
					</div>
					<div class="form-group">
						<label for="phone">휴대폰</label>
						<span id="phWarn" style="float: right"></span>
						<div class="input-shadow">
							<input id="phone" type="text" class="form-control" name="phone"
								placeholder="- 를 제외하고 입력하세요" />
						</div>
					</div>

					<div class="form-group">
						<label for="email">이메일</label>
						<div class="input-shadow">
							<input id="email" type="text" class="form-control" name="email" />
							<select class="form-control" name="email2" id="email2">
								<option>@naver.com</option>
								<option>@daum.net</option>
								<option>@gmail.com</option>
							</select>
						</div>
					</div>

					<!-- form-group묶는것 주의-->
					<div class="form-group addr-btn">
						<label for="addr">주소</label>
						<button class="btn btn-warning btn-addrfind" type="button"
							onclick="goPopup()">주소찾기</button>
						<!-- <div class="input-group"> -->
						<div class="input-shadow input-shadow-addr">
							<input id="zipNo" type="text" class="form-control addr-input"
								name="zipNo" placeholder="우편번호" readonly>
						</div>
						<div class="input-shadow">
							<!-- 기본 주소-->
							<input type="text" class="form-control" id="addrBasic"
								name="addrBasic" placeholder="기본주소" readonly>
						</div>
						<div class="input-shadow">
							<!-- 상세 주소 -->
							<input type="text" class="form-control" id="addrDetail"
								name="addrDetail" placeholder="상세주소">
							<!-- </div> -->
						</div>
					</div>

					<!-- 버튼 -->
					<div class="form-group">
						<button type="button" class="btn btn-primary btn-block btn-join"
							id="joinBtn">회원가입</button>
						<button type="button" class="btn btn-success btn-block btn-login"
							id="loginBtn">로그인</button>
					</div>

				</form>

			</div>
		</div>
	</div>
</section>


<script>
	//아이디 중복확인 alert창(시간나면 modal시도)
	function idChk() {
		var userId = document.getElementById("userId");
		if (userId.value === "") {
			swal({
				title : '아이디를 입력해주세요'
			})
			return;
		} else {
			//비동기 통신 아이디 검증
			$.ajax({
				type : "POST",
				url : "idCheck", //뭐엿지 이거 -> 컨트롤러로 보내는 요청
				data : JSON.stringify({
					"userId" : userId.value
				}),
				contentType : "application/json; charset=utf-8", //전송 타입
				success : function(data) {//성공시
					//console.log(data);//확인해보기
					var regexId = /^[A-Za-z0-9+]{8,}$/; //아이디 정규표현식
					//중복 O + id정규 표현식 X
					if (data === 1 || regexId.test(userId.value) === false) {
						userId.style.border = "2px solid red";
						userId.focus();
						swal({
							icon : 'error',
							title : '사용할 수 없는 아이디 입니다.'
						});
					} else { //중복 X
						userId.setAttribute('readonly', true);
						userId.style.borderColor = "#ccc";
						swal({
							icon : 'success',
							title : '사용가능한 아이디 입니다.'
						});
					}
				},
				error : function(status, error) {
					alert("서버에러가 발생했습니다, 관리자에게 문의해주세요");
				}
			})
		}
	};
</script>

<!-- 정규 표현식 검사 -->
<script type="text/javascript">
	//비밀번호 검사
	var userPwd = document.getElementById("userPwd");
	userPwd.onkeyup = function() {
		//정규표현식 참고 링크
		//https://developer.mozilla.org/ko/docs/Web/JavaScript/Guide/%EC%A0%95%EA%B7%9C%EC%8B%9D
		//https://www.thepolyglotdeveloper.com/2015/05/use-regex-to-test-password-strength-in-javascript/
		var regexPwd = new RegExp(
				"^(?=.*[a-z])(?=.*[0-9])(?=.*[~!@#\$%\^&\*])(?=.{8,})"); //8자이상, 최소 하나의 영어(소문자),숫자, 특수문자(~!@#\$%\^&\*)를 포함
		//if(regexPW.test)
		if (regexPwd.test(userPwd.value) == true) {
			userPwd.style.border = "1px solid #71e901";//녹색
		} else {
			userPwd.style.border = "1px solid #fe5757";//빨간색
		}
	}
	//비밀번호 확인 검사
	var pwdChk = document.getElementById("pwdChk");
	var pwdWarn = document.getElementById("pwdWarn");
	pwdChk.onkeyup = function() {
		if (userPwd.value !== pwdChk.value) { //다름
			pwdChk.style.border = "1px solid #fe5757";
		} else {//같음
			pwdChk.style.border = "1px solid #71e901";
			pwdWarn.innerHTML = "";//경고문구 제거
		}
	};
</script>

<!-- 주소 검색 팝업 -->
<script>
	//팝업으로 열기
	function goPopup() {
		var pop = window
				.open(
						"${pageContext.request.contextPath}/resources/popup/jusoPopup.jsp",
						"pop",
						"width=570,height=420, left=300, top=75, scrollbars=yes, resizable=yes");
	}
	//값을 받아오는 함수
	function jusoCallBack(roadFullAddr, roadAddrPart1, addrDetail,
			roadAddrPart2, engAddr, jibunAddr, zipNo, admCd, rnMgtSn, bdMgtSn,
			detBdNmList, bdNm, bdKdcd, siNm, sggNm, emdNm, liNm, rn, udrtYn,
			buldMnnm, buldSlno, mtYn, lnbrMnnm, lnbrSlno, emdNo) {
		//주소, 상세주소, 우편번호만 받아 대입
		document.getElementById("zipNo").value = zipNo;
		document.getElementById("addrBasic").value = roadAddrPart1;
		document.getElementById("addrDetail").value = addrDetail;
	}
</script>


<!-- 이름에 특수문자, 숫자 안됨 -->
<script>
	var userName = document.getElementById("userName");
	var nameWarn = document.getElementById("nameWarn");
	//이름 패턴(한글, 영어(대,소))
	var regexName = /^[가-힣A-Za-z]{1,}/;
	userName.onkeyup = function() {
		if (regexName.test(userName.value) === false) {
			nameWarn.innerHTML = "잘못된 이름 형식입니다";
			nameWarn.style.color = "red";
			userName.style.borderColor = "#fe5757";//#적색
		} else {
			nameWarn.innerHTML = "";
			userName.style.borderColor = "#e5e5e5";
		}
	}
</script>

<!-- 휴대폰번호 검증 -->
<script>
	var phone = document.getElementById("phone");
	var phWarn = document.getElementById("phWarn");
	var regexPh = /^[0-9]{10,11}/;
	phone.onkeyup = function() {
		if (regexPh.test(phone.value) !== true) {
			phone.style.borderColor = "#fe5757";//적색
			
			// phone.style.borderColor = "#71e901";//녹색
		} else {
			phone.style.borderColor = "#e5e5e5";
		}
	}
</script>
<!-- 나이 검증 -->
<script>
	var userAge = document.getElementById("userAge");
	var ageWarn = document.getElementById("ageWarn");
	var regexId = /^[0-9]{1,2}$/;
	
	userAge.onkeyup = function(){
		if(regexId.test(userAge.value) !== true){
			userAge.style.borderColor = "#fe5757";//적색
			ageWarn.innerHTML = "정확한 나이를 입력하세요";
		} else {
			userAge.style.borderColor = "#e5e5e5";
			ageWarn.innerHTML = "";
		}	
	}
</script>

<!-- 회원가입 버튼 클릭시 최종 확인 -->
<!-- 회원가입 버튼 클릭 -->
<script type="text/javascript">
	joinBtn.onclick = function() {
		var email = document.getElementById("email");
		var zipNo = document.getElementById("zipNo");
		var addrBasic = document.getElementById("addrBasic");
		var addrDetail = document.getElementById("addrDetail");
		//console.log(email);
		/* 아이디 확인 검사: readonly면 ok */
		if (userId.getAttribute('readonly') === null) {
			swal({
				icon : 'error',
				title : '아이디 중복체크를 눌러주세요'
			})
			
			userId.focus();//위치로 이동
			return;
			//비밀번호 확인 검사
			//조건: 1.비밀번호  공백, 서로 다름
		} else if (userPwd.value === '' && pwdChk.value === ''
				|| userPwd.value !== pwdChk.value) {
			
			swal({
				icon : 'error',
				title : '비밀번호를 다시 확인해주세요'
			})
			userPwd.focus();
			return;
			//이름 확인 검사
			//조건: 1.정규식과 다름, 2.공백
		} else if (regexName.test(userName.value) !== true || userName.value === "") {
			swal({
				icon : 'error',
				title : '이름을 다시 확인해주세요'
			})
			userName.focus();
			return;
			//휴대폰 검사 확인
			//조건:1.공백, 2.조건
		} else if(phone.value === "" || regexPh.test(phone.value) !== true){
			swal({
				icon : 'error',
				title : '휴대폰번호를 다시 확인주세요'
			});
			pwdWarn.innerHTML = "휴대폰번호를 다시 확인해주세요";
			pwdWarn.color = "red";
			phone.focus();
			return;
			//이메일 검사
			//조건: 1.공백
		} else if(email.value === ""){
			swal({
				icon : 'error',
				title : '이메일을 작성해주세요'
			})
			email.focus();
			return;
			//주소검사
			//조건: 1.공백(3칸)
		} else if(zipNo.value === "" || addrBasic.value === "" || addrDetail.value === ""){
		
			swal({
				icon : 'error',
				title : '주소를 작성해주세요'
			})
			addrDetail.focus();
			return;
			
		}else if(userAge.value === ''){//나이 검증
			swal({
				icon : 'error',
				title : '나이를 작성해주세요'
			})
			addrDetail.focus();
			return;
			
		} else{ //모두 문제 없을 시
			$("#joinForm").submit();//Form전송
		}
	}
	/* //JQuery: #아이디
	$("#joinBtn").click(function() { //클릭이벤트
		$("#joinForm").submit();//Form전송
	}) */
</script>


<!-- 로그인 페이지 이동 -->
<script type="text/javascript">
	document.getElementById('loginBtn').onclick = function() {
		location.href = 'login';
	}
</script>