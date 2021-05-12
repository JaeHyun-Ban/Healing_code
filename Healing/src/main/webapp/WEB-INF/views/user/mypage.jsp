<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

	<style>
      * {
        box-sizing: border-box
      }

      body {
        font-family: "Lato", sans-serif;
        margin-top:200px;
        margin-bottom:200px;
      }

      /* Style the tab */
      .tab {
        float: left;
        border: 1px solid #ccc;
        background-color: #f1f1f1;
        width: 15%;
        height: 274px;

      }

      /* Style the buttons inside the tab */
      .tab button {
        display: block;
        background-color: inherit;
        color: black;
        padding: 22px 16px;
        width: 100%;
        border: none;
        outline: none;
        text-align: left;
        cursor: pointer;
        transition: 0.3s;
        font-size: 17px;
      }

      /* Change background color of buttons on hover */
      .tab button:hover {
        background-color: #ddd;
      }

      /* Create an active/current "tab button" class */
      .tab button.active {
        background-color: #ccc;
      }

      /* Style the tab content */
      .tabcontent {
        float: left;
        padding: 0px 12px;
        width: 70%;
        border-left: none;
        /* padding-top: 100px; */
      }

      /* ========================== */



      .tabcontent>ul,
      li {
        list-style: none;
      }

      .reserve {
        position: relative;
        height: 170px;
        border-bottom: 1px solid #7777;
        padding: 20px 20px 20px 200px;
        overflow: hidden;
      }

      .reserve>.left {
        float: left;
        width: 50%;
      }

      .reserve>.right {
        float: right;
        width: 50%;
      }

      .motelimg {
        position: absolute;
        top: 10px;
        left: 10px;
      }

      .motelimg>img {
        width: 150px;
        height: 150px;
      }
	  .my-content .right{
	  	text-align: right;
	  }	


      .pagination {
        display: block;
        text-align: center;
      }

      .pagination>li>a {
        float: none;
        margin-left: -5px;
      }

      .title-foot {
        text-align: center;
      }
    </style>
    
    
  <div class="container">  
    <div class="tab">
      <button class="tablinks" onclick="openCity(event, 'London')" id="defaultOpen">내정보</button>
      <button class="tablinks" onclick="openCity(event, 'Paris')">예약내역</button>
      <button class="tablinks" onclick="openCity(event, 'Tokyo')">후기</button>
      <button class="tablinks" onclick="openCity(event, 'my')">찜목록</button>
    </div>

    <div id="London" class="tabcontent">
      <h3 style="margin-bottom: 20px;">내정보</h3>
	<form action="update" name="myinfo">
      <table class="table">
        <tbody class="m-control">
          <tr>
            <td class="m-title">*ID</td>
            <td><input type="text" class="form-control m-md" name="id" value="${userVO.userId}" readonly></td>
          </tr>
          <tr>
            <td class="m-title">*이름</td>
            <td><input type="text" class="form-control m-md" name="name" value="${userVO.userName }" readonly></td>
          </tr>
          <tr>
            <td class="m-title">*비밀번호</td>
            <td><input type="password" class="form-control m-md"  id="pwd" name="pwd"></td>
          </tr>
          <tr>
            <td class="m-title">*비밀번호 확인</td>
            <td><input type="password" class="form-control m-md" id="pwdChk"></td>
          </tr>
          <tr>
            <td class="m-title">*이메일</td>
            <td>
            	<input id="email" type="text" class="form-control" name="email" value="${userVO.email }"/>
							<select class="form-control" name="email2" id="email2">
								<option ${userVO.email2=='@naver.com'?'selected':'' }>@naver.com</option>
								<option ${userVO.email2=='@daum.net'?'selected':'' }>@daum.net</option>
								<option ${userVO.email2=='@gmail.com'?'selected':'' }>@gmail.com</option>
							</select>
            </td>
          </tr>
          <tr>
            <td class="m-title">*휴대폰</td>
            <td><input type="text" class="form-control m-sm" placeholder="010" style="display: inline; width: 32%;">-
              <input type="text" class="form-control m-sm" id="phone1" style="display: inline; width: 32%;" value="">-
              <input type="text" class="form-control m-sm" id="phone2" style="display: inline; width: 32%;" value="">
            	<input type="hidden" name="phone">
            </td>
          </tr>
          <tr>
            <td class="m-title">*우편번호</td>
            <td>
            	<input id="zipNo" type="text" class="form-control addr-input"
								name="zipNo" placeholder="우편번호" style="display: inline; width: 70%" value="${userVO.zipNo }" readonly>
            	<button class="btn btn-warning btn-addrfind" type="button"
							onclick="goPopup()">주소찾기</button>
            </td>
          </tr>
          <tr>
            <td class="m-title">*주소</td>
            <td><input type="text" class="form-control" id="addrBasic"  name="addrBasic" value="${userVO.addrBasic}" readonly></td>
          </tr>
          <tr>
            <td class="m-title">*상세주소</td>
            <td><input type="text" class="form-control" id="addrDetail" name="addrDetail" value="${userVO.addrDetail}" readonly></td>
          </tr>
        </tbody>
      </table>
      <hr>
      <div class="title-foot">
        <button type="button" class="btn" id="update-btn">수정</button>
        <button type="button" class="btn" id="delete-btn" onclick="location.href='delete?id=${userVO.userId}'">회원탈퇴</button>
      </div>
      </form>
    </div>

    <div id="Paris" class="tabcontent">
      <h3>예약내역</h3>
      <hr style="margin-bottom: 10px;">
      <div class="my-content">
        
        <c:forEach items="${reservelist}" var="reserve">
	        <div class="reserve">
	          <div class="motelimg">
	            <img src="98eee517dd344e7bfc4cb1dc1688e7eb.jpg" alt="">
	          </div>
	          <div class="left">
	            <h4 style="margin-bottom: 25px">
	            	<a href="../search/room_info?pro_no=${reserve.pro_no}">${reserve.name}</a>
	            </h4>
	            
	            <p>예약날짜</p>
	            <p>체크인</p>
	            <p>체크아웃</p>
	           
	          </div>
	          <div class="right">
	            <h3 style="margin: 0">${reserve.price}원</h3>
	            <h4>${reserve.reserve_type=='half'?'대실':'숙박'}</h4>
	            <p>${reserve.regdate}</p>
	            <p>${reserve.checkin}:00시</p>
	            <p>${reserve.checkout}:00시</p>
	            
	          </div>
	        </div>
        </c:forEach>
        
      </div>
      <hr>
      <%-- <div class="container">
        <ul class="pagination">
          <li><a href="#" data-page="${pagevo.startPage-1}">이전</a></li>
          <li><a href="#">1</a></li>
          <li class="active"><a href="#">2</a></li>
          <li><a href="#">3</a></li>
          <li><a href="#">4</a></li>
          <li><a href="#">5</a></li>
          <li><a href="#" data-page="${pagevo.endPage+1}">다음</a></li>
        </ul>
      </div> --%>

    </div>

    <div id="Tokyo" class="tabcontent">
      <h3>내가쓴 후기</h3>
      <hr style="margin-bottom: 10px;">
      <div class="my-content">
      	<c:forEach items="${reviewlist}" var="review">
	        <div class="reserve">
	          <div class="motelimg">
	            <img src="../search/display/${review.fileloca}/${review.filename}" alt="">
	          </div>
	          <div class="left">
	            <h4>${review.name }</h4>
	            <p>
	              <span><em>9.0</em></span>
	            </p>
	            <p>전화번호:${review.tel}</p>
	          </div>
	          <div class="right">
	            <p><strong>${review.title }</strong></p>
	            <p>${review.content }</p>
	          </div>
	        </div>
        </c:forEach>
      </div>
      <hr>

      
    </div>


    <div id="my" class="tabcontent">
      <h3>찜목록</h3>
      <hr style="margin-bottom: 10px;">
      <div class="my-content">
      	<c:forEach items="">
	        <div class="reserve">
	          <div class="motelimg">
	            <img src="98eee517dd344e7bfc4cb1dc1688e7eb.jpg" alt="">
	          </div>
	          <div class="left">
	            <h4>종로h모텔</h4>
	            <p>
	              <span>
	                <em>9.0</em>
	              </span>
	            </p>
	            <p>예약날짜</p>
	            <p>객실정보</p>
	          </div>
	          <div class="right">
	            <h3 style="text-align: right;">38000원</h3>
	          </div>
	        </div>
        </c:forEach>
      </div>
      <hr>

    </div>
</div>
    <script>
      function openCity(evt, cityName) {
        var i, tabcontent, tablinks;
        tabcontent = document.getElementsByClassName("tabcontent");
        for (i = 0; i < tabcontent.length; i++) {
          tabcontent[i].style.display = "none";
        }
        tablinks = document.getElementsByClassName("tablinks");
        for (i = 0; i < tablinks.length; i++) {
          tablinks[i].className = tablinks[i].className.replace(" active", "");
        }
        document.getElementById(cityName).style.display = "block";
        evt.currentTarget.className += " active";
      }

      // Get the element with id="defaultOpen" and click on it
      document.getElementById("defaultOpen").click();
    </script>
    	
    	
    <script>
    	$(document).ready(function(){		
	    	

	    	var phone="${userVO.phone}";
	    	var phone1=phone.substr(3,4);
	    	var phone2=phone.substr(7,phone.length);
	    	$("#phone1").val(phone1)
	    	$("#phone2").val(phone2)
	    	
    	})
		
    	$("#update-btn").click(function(){
    		
    		var phone="010"+$("#phone1").val() +$("#phone2").val()
    		$("input[name='phone']").val(phone)
    		document.myinfo.submit();
    	})
    	
		
    </script>
    <!-- 주소 검색 팝업 -->
	<script>
		//팝업으로 열기
		function goPopup() {
			var pop = window
					.open("${pageContext.request.contextPath}/resources/popup/jusoPopup.jsp",
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
		
		
		//비밀번호 검사
		var pwd = document.getElementById("pwd");
		pwd.onkeyup = function() {
			//정규표현식
			//https://developer.mozilla.org/ko/docs/Web/JavaScript/Guide/%EC%A0%95%EA%B7%9C%EC%8B%9D
			//var regexPwd = /^[~!@#$%^&*()].{1}[a-z0-9+].{7,}]$/;
			var regexPwd = /^(?=.*[0-9])(?=.[a-z])[~!@#$%^&*()].{1}[a-z0-9+].{7,}]$/;
			//if(regexPW.test)
			if (regexPwd.test(pwd.value) == true) {
				document.getElementById("pwd").style.border = "2px solid green";
			} else {
				document.getElementById("pwd").style.border = "2px solid red";
			}
		}
		//비밀번호 확인 검사
		var pwdChk = document.getElementById("pwdChk");
		pwdChk.onkeyup = function () {
			
		}
		
		
		var uservo = "${userVO}";
		$(document).ready(function() {
			setInterval(function(){
				console.log(uservo);
				if(uservo ==null){
					window.location="login";
				}
			},100)
			
		})
		
		
		
	</script>
	
	