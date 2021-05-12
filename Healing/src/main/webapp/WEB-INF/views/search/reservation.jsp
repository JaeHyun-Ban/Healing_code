<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/base.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/reservation.css">
    <section>
      <!-- 부트스트랩: class="container" -->
      <div class="container" style="margin-top: 110px">
        <!-- 그리드 시스템에서는 이 class="row" 태그 안에 표시할 내용을 준비한다.
            출처: https://araikuma.tistory.com/62 [프로그램 개발 지식 공유]-->
        <div class="row">
          <div class="res-form col-xs-12 col-sm-7 col-md-7">
            <form action="reservationForm" name="reservepayment">
              <div class="res-content">

                <div class="left">
                  <img src="img/res_img.jpg">
                </div>

                <div class="right">
                  <div class="info">
                    <p>
                      <strong>숙소이름</strong>
                     ${infovo.pro_title}
                    </p>
                    <p>
                      <strong>객실 타입</strong>
                      ${infovo.title}
                    </p>
                   
                    <p>
                      <strong>체크인</strong>
                      ${infovo.checkin}:00
                    </p>
                    <p>
                      <strong>체크아웃</strong>
                      ${infovo.checkout}:00
                  </div>
                </div>
              </div>

              <h3>예약자 정보</h3>
              <div class="form-group res-content2">
                <div>
                  <label>이름</label>
                  <input class="form-control" type="text" style="width: 30%" value="${userVO.userName}">
                  <label>휴대폰 번호</label>
                  <p>개인 정보 보호를 위해 안심번호로 숙소에 전송됩니다.</p>
                  <input class="form-control" type="text" style="width: 50%">
                </div>
              </div>
              <!-- 결제수단 -->
              <div class="form-group res-content3">
                <div class="payment">
                  <h3>결제수단 선택</h3>
                  <select class="form-control">
                    <option value="card" selected="selected">신용/체크 카드</option>
                    <option value="bank">계좌이체</option>
                    <option value="kakao">카카오페이</option>
                    <option value="naver">네이버페이</option>
                  </select>
                </div>
              </div>
              <!-- 체크박스================================= -->
              <section class="agree">
                <p class="checkbox all-check">
                  <!-- 클릭시 체크박스 모두 체크되게 처리 -->
                  <label><input type="checkbox" id="all" value="" onclick="checkall();"/><span>전체 동의</span></label>
                </p>
                <!-- 
                  자바스크립트
                  클릭시 약관이 보이도록 처리 할 것(참고: 여기어때 예약페이지)
                 -->
                <p class="checkbox">
                  <label><input type="checkbox" name="checkbox" id="one" value="" >
                    <i>숙소 이용규칙 및 취소/환불규정 동의</i><b>(필수)</b>
                  </label>
                </p>
                <p class="checkbox">
                  <label><input type="checkbox" name="checkbox" id="two" value=""><i>개인정보 수집 및 이용 동의</i><b>(필수)</b></label>
                </p>
                <p class="checkbox">
                  <label><input type="checkbox" name="checkbox" id="three" value=""><i>개인정보 제 3자 제공 동의</i><b>(필수)</b></label>
                </p>
              </section>
              <!-- ====================================== -->
              <h3 class="pay">총 결제 금액: ${infovo.price}원</h3>
              <button type="button" class="btnpay btn btn-primary btn-block" id="payment">결제하기</button>
				
				<!-- 예약시 넘길폼값 -->
				<input type="hidden" name="checkin" value="${infovo.checkin}">
				<input type="hidden" name="checkout" value="${infovo.checkout}">
				<input type="hidden" name="price" value="${infovo.price}">
				<input type="hidden" name="reserve_type" value="${infovo.pro_type}">
				<input type="hidden" name="id" value="${userVO.userId}">
				<input type="hidden" name="pro_no" value="${infovo.pro_no}">
				<input type="hidden" name="room_no" value="${infovo.room_no}">
            </form>
          </div>
        </div>
      </div>

    </section>
    
    <script>
    	document.getElementById("all");
    	function checkall (){
    		if(document.getElementById("all").checked==true){
    			$("input[name='checkbox']").prop("checked",true);
    		}else{
    			$("input[name='checkbox']").prop("checked",false);
    		}
    	}
    	$("#payment").click(function(){
    		if( document.getElementById("one").checked==false){
    			alert('첫번째 약관에 동의해주세요')
    			return;
    		}else if(document.getElementById("two").checked==false){
    			alert('두번째 약관에 동의해주세요')
    			return;
    		}else if(document.getElementById("three").checked==false){
    			alert('세번째 약관에 동의해주세요')
    			return;
    		}else{
    			document.reservepayment.submit();
    		}
    	})
    	
    	
    	
    </script>