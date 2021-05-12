<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/resources/css/main.css">



<!-- 배너영역 -->

<section class="banner">

	<div id="myCarousel" class="carousel slide" data-ride="carousel">

		<!-- Indicators -->
		<ol class="carousel-indicators">
			<li data-target="#myCarousel" data-slide-to="0" class="active"></li>
			<li data-target="#myCarousel" data-slide-to="1"></li>
			<li data-target="#myCarousel" data-slide-to="2"></li>
		</ol>


		<!-- Wrapper for slides -->
		<div class="carousel-inner">
			<div class="item active">
				<a href="#"><img src="resources/img/a.jpg" alt="1"
					style="width: 100%;"></a>
			</div>

			<div class="item">
				<a href="#"><img src="resources/img/b.png" alt="2"
					style="width: 100%;"></a>
			</div>

			<div class="item">
				<a href="#"><img src="resources/img/c.png" alt="3"
					style="width: 100%;"></a>
			</div>
		</div>

		<!-- Left and right controls -->
		<a class="left carousel-control" href="#myCarousel" data-slide="prev">
			<span class="glyphicon glyphicon-chevron-left"></span> <span
			class="sr-only">Previous</span>
		</a> <a class="right carousel-control" href="#myCarousel"
			data-slide="next"> <span
			class="glyphicon glyphicon-chevron-right"></span> <span
			class="sr-only">Next</span>
		</a>
	</div>
</section>


<!-- 아이콘 영역 -->
<section>
	<div class="container" style="margin-top: 90px;">
		<div class="row">
			<li class="col-lg-3 col-md-3 col-sm-6 col-xs-6"><a href="search/select_area"
				class="selecttype typeselect"> <img
					src="resources/img/icon/region.png" alt="region" class="typeimg ">
					<p class="typetext">지역별 보기</p>
			</a></li>
			<li class="col-lg-3 col-md-3 col-sm-6 col-xs-6"><a href="search/byagegroup"
				class="selecttype"> <img
					src="resources/img/icon/recommendation.png" alt="recommendation"
					class="typeimg">
					<p class="typetext">연령별 추천</p>

			</a></li>
			<li class="col-lg-3 col-md-3 col-sm-6 col-xs-6"><a href="##"
				class="selecttype"> <img src="resources/img/icon/travel.png"
					alt="travel" class="typeimg">
					<p class="typetext">여행지 주변</p>
			</a></li>
			<li class="col-lg-3 col-md-3 col-sm-6 col-xs-6"><a href="search/search_room?range=30&searchname="
				class="selecttype"> <img
					src="resources/img/icon/free-icon-nearby-2041118.png" alt="arround"
					class="typeimg">
					<p class="typetext">내 주변</p>
			</a></li>
		</div>

	</div>

	<div class="container" style="margin-top: 50px;">
		<form action="search/search_room">
			<div class="input-group">
				<input type="text" class="form-control"
					placeholder="혹시 찾으시는 곳이 있나요?" name="searchname"
					style="height: 40px;">
				<div class="input-group-btn">
					<button class="btn btn-default" type="submit">
						<i class="glyphicon glyphicon-search" style="height: 25px;"></i>
					</button>
				</div>
			</div>
		</form>
	</div>
</section>

<!-- 객실 뷰 영역 -->
<section class="mainview">

	<h2 style="text-align: center;">*별점순위*</h2>
	<div class="container">
		<div class="row" style="text-align: center;">
			
			<c:forEach items="${productlist }" var="product">
			<a href = "search/room_info?pro_no=${product.pro_no }">
				<li class="col-lg-6 col-sm-12 mainviewimg"><img
					src="search/display/${product.fileloca }/${product.filename}" >
					<div class="gra_black">

						<div class="mainviewinfo" style="text-align: left;">
							<p style="margin: 0; font-size: 25px;">${product.name }</p>
							<p style="margin: 0; font-size: 15px;" id="${product.pro_no }no">5.0</p>
							               	<script type="text/javascript">
			                            			reviewmean();
			                            			function reviewmean() {
			                         
			                            				$.getJSON("search/reviewcountMean/"+${product.pro_no}, function(map){
															console.log(map.mean);
															$("#${product.pro_no }no").html(map.mean.toFixed(1));
												
														})
													}	
			                            	</script>
							<p style="margin: 0; font-size: 19px;">${product.basic_address }</p>
						</div>

						<div class="mainviewprice">
							<p style="margin: 0; font-size: 25px;">${product.rental_price }</p>
						</div>
					</div></li>
			</a>
			</c:forEach>
		
			
		</div>
	</div>
</section>




<script>
//뒤로가기 시 기록상태
window.onload = function() {
	 if(history.state === '' ) return;
	 
	 var msg = "${msg}"; //컨트롤러에서 넘어온 메시지
	 if(msg !== '') {
		 alert(msg);
		 //브라우저의 기록을 새롭게 변경(데이터, 페이지제목, 변경할주소)
		 //이렇게 변경된 기록정보는 history.state 객체를 통해서 확인이 가능합니다.
		 history.replaceState('', null, null); 
	 }
}

//위치정보
function seccess(position){
    console.log(position);
    console.log("위도:"+position.coords.latitude);
    console.log("경도:"+position.coords.longitude);
    var lat1=position.coords.latitude;
    var lng1=position.coords.longitude;
    
    sessionStorage.setItem("lat1", lat1 );
    sessionStorage.setItem("lng1", lng1 );
}

function fail(){
    alert('위치정보를 얻는데 실패했습니다');
}

//페이지 접속 시 위치정보 얻어오기
(function(){
    navigator.geolocation.getCurrentPosition(seccess,fail);
})();




</script>


