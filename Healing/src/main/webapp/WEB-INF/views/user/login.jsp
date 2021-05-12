<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!-- 기본 CSS -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/resources/css/base.css">
<!-- 개인 디자인 추가공간-->
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/resources/css/login_join.css">
<!-- <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script> -->
<script
	src="${pageContext.request.contextPath }/resources/js/sweetalert/sweetalert.min.js"></script>
<!-- kakao JavaScript SDK포함, SDK안에 name객체가 이미 존재한다 -->

<section>
	<div class="container">
		<div class="row">
			<div class="login-form col-xs-12 col-sm-8 col-md-8">
				<div class="login-title">로그인</div>

				<form action="userLogin" id="loginForm" method="post">
					<div class="form-group">
						<label for="userId">아이디</label>
						<div class="input-shadow">
							<input type="text" class="form-control" id="userId" name="userId"
								required="required"
								oninvalid="this.setCustomValidity('아이디를 입력하세요')" />
						</div>
					</div>
					<div class="form-group">

						<label for="pwd">비밀번호</label>
						<div class="input-shadow">
							<input type="password" class="form-control" id="userPwd"
								name="userPwd" required="required"
								oninvalid="this.setCustomValidity('비밀번호를 입력하세요')">
						</div>
					</div>
					<!-- 구분선 생성-->
					<div class="login-btn">
						<button type="button" class="btn btn-success btn-block btn-login"
							id="loginBtn">로그인</button>
						<button type="button" class="btn btn-primary btn-block btn-join"
							id="joinBtn">회원가입</button>
						<!-- 클릭시 회원가입 창 이동 -->
					</div>
					
					<!-- 카카오  -->
					<%-- <a id="custom-login-btn" href="javascript:loginWithKakao()"> <img
						alt=""
						src="${pageContext.request.contextPath }/resources/img/kakao/kakao_login_large_wide.png">
					</a> --%>
					<button type="button" class="btn btn-block kLoginBtn" onclick="loginWithKakao()"><img src="${pageContext.request.contextPath }/resources/img/kakao/kakao_login_large_wide.png"></button>

				</form>
				
				<!-- hidden처리로 kakaoLogin을 따로 전송>>>이렇게 해야하는 건가;; -->
				<form action="kLogin" id="kForm" method="post">
					<input type="hidden" id="kUserId" name="kUserId">
					<input type="hidden" id="userName" name="userName">
					<input type="hidden" id="userAge" name="userAge">
					<input type="hidden" id="email" name="email">
					<input type="hidden" id="email2" name="email2">
				</form>
			</div>
		</div>
	</div>

</section>

<!-- 메세지 알림창 -->
<script>
	var msg = "${msg}";
	if (msg != "") {
		swal({
			title : msg
		})
	}
</script>

<!-- 로그인 버튼 처리 -->
<script>
$("#loginBtn").click(function() {
	//console.log($("#userId").val());
	if($("#userId").val() == '' || $("#userPwd").val() == ''){
		swal({
			title : '아이디, 비밀번호를 확인해주세요'
		})
		return;
	}else {
		$("#loginForm").submit();
		
	}
})
</script>


<!-- 회원가입 페이지 이동 -->
<script>
	$("#joinBtn").click(function() {
		location.href = "join";
	})
</script>

<!-- 로그인 실패시 -->
<script type="text/javascript">
	
</script>

<!-- 카카오 SDK -->
<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
<script>
	//카카오 SDK초기화
	//f80c539288e6a1c0860c93c58b8a3cc1
	//https://www.youtube.com/watch?v=Re2R2rid1K4&ab_channel=%EA%B0%9C%EB%B0%9C%EC%9E%90%EC%9D%98%ED%92%88%EA%B2%A9
	window.Kakao.init('f80c539288e6a1c0860c93c58b8a3cc1');
	console.log('카카오SDK 초기화여부: ', Kakao.isInitialized());//SDK초기화 여부를 판단
</script>

<!-- 카카오 로그인 창이 사라질 때는,
토큰이 유지되어 있어서 나타나는 현상이라 
인터넷 어플리케이션을 종료하거나, 
쿠키를 삭제해주면 해결된다 -->
<!-- 카카오 로그인 기능 -->
<!-- https://developers.kakao.com/docs/latest/ko/getting-started/sdk-js -->
<script type="text/javascript">
	//카카오 로그인 실행
	//카카오 API호출: 엑세스 토큰(Access Token)
	//엑세스 토큰 갱신: 리프레시 토큰(Refresh Teken)
	function loginWithKakao() {
		//loginForm: 새 창에서 카카오 로그인
		Kakao.Auth.loginForm ({
			//scope: 'profile, account_email',
			success : function(authObj) {
				console.log(authObj);//받아온 오브젝트 데이터
				//사용자 정보 가져오기, 카카오 API(Kakao.API.request)
				Kakao.API.request({
					url:'/v2/user/me',
					success: function(response) {
						console.log('응답: ' + response);
						var userId = response.id + '@k';//카카오아이디 구분, console.log('유저아이디: ' + userId);
						var userName = response.properties.nickname;
						var userAge = response.kakao_account.age_range;
						var userEmail = response.kakao_account.email;//console.log('이메일: ' + userEmail);
								
						var find = userEmail.indexOf('@');//console.log("앞에:" + userEmail.substr(0, find))
						var email = userEmail.substr(0, find);//console.log("뒤에: " + userEmail.substring(find, userEmail.length))
						var email2 = userEmail.substring(find, userEmail.length);
						
						//hidden에 값 대입
						document.getElementById("kUserId").value = userId;
						document.getElementById("userName").value = userName;
						document.getElementById("userAge").value = userAge.substring(0, 2);
						document.getElementById("email").value = email;
						document.getElementById("email2").value = email2;
						
						document.getElementById("kForm").submit();
						
					},
					fail: function(error){
						console.log(error);
					}
					
				})
				console.info(JSON.stringify(authObj));
			},
			fail : function(error) {
				console.error('에러 발생');
				console.error(JSON.stringify(err))
			},
		})
	}
</script>

<!-- 카카오 로그아웃 -->
<!-- <script type="text/javascript">
function kakaoLogout() {
	//가지고 있는 토큰 확인
    if (!Kakao.Auth.getAccessToken()) {
      console.log('Not logged in.');
      return;
    }
    Kakao.Auth.logout(function () {
    	//가지고 있는 토큰이 존재하는지 확인
      console.log('logout ok\naccess token -> ' + Kakao.Auth.getAccessToken());
    })
  }
</script> -->
