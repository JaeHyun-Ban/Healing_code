<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
    
	<link rel="stylesheet" href="https://unpkg.com/swiper/swiper-bundle.css">
    <link rel="stylesheet" href="https://unpkg.com/swiper/swiper-bundle.min.css">
    <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=3004837755eae7b6be51a2cfae956086&libraries=services"></script>
    <style>

        html,
        body {
            position: relative;
            height: 100%;
        }

        body {
            background: white;
            font-family: Helvetica Neue, Helvetica, Arial, sans-serif;
            font-size: 14px;
            color: #000;
            margin-top:150px;
            padding: 0;
        }

        .swiper-container {
            width: 100%;
            height: 31%;
        }

        .swiper-slide {
            text-align: center;
            font-size: 18px;
            background: white;

            /* Center slide text vertically */
            display: -webkit-box;
            display: -ms-flexbox;
            display: -webkit-flex;
            display: flex;
            -webkit-box-pack: center;
            -ms-flex-pack: center;
            -webkit-justify-content: center;
            justify-content: center;
            -webkit-box-align: center;
            -ms-flex-align: center;
            -webkit-align-items: center;
            align-items: center;
            overflow: hidden;
        }
        .swiper-slide>img{
            max-width: 100%;
            height: auto;
            display: block;
        }


        /* ========객실======== */
        .room {
            padding: 20px 20px 20px 330px;
            border: 1px solid #ddd;
            position: relative;
            margin-bottom: 20px;
        }

        .room-img {
            position: absolute;
            top: 20px;
            left: 20px;
        }
        .room-img img{
            height: 172px;
            width: 300px;
        }

        .room-content {
            overflow: hidden;
        }

        .room-content>.left {
            float: left;
            width: 50%;
            box-sizing: border-box;
            padding: 10px;

        }

        .room-content>.right {
            float: right;
            width: 50%;
            box-sizing: border-box;
        }

        .room-content>.left .reserve {
            text-align: right;
            border-bottom: 1px solid #ddd;
            padding-bottom: 10px;
        }

        .re-time {
            overflow: hidden;
        }

        .re-time>.left {
            float: left;
        }

        .re-time>.right {
            float: right;
        }

        .re-time span {
            display: block;
            padding-bottom: 3px;
        }

        /* =========슬라이드========== */
        .guest-content{
            overflow: hidden;
            margin-top: 20px;
        }
        
        .guest-content .load-info{
            border: 1px solid #ddd;
            text-align: center;
            height: 200px;
            
        }
        
        .guest-content .map1{
            border: 1px solid #ddd;
            text-align: center;
            height: 200px;

         }
        



        /* ========리뷰======== */
        .review ul,
        li {
            list-style: none;
        }

        .score-top {
            text-align: center;
            padding: 30px 0;
            border-bottom: 1px solid #ddd;
        }

        .pic {
            padding: 20px 20px 20px 100px;
            position: relative;
            border-bottom: 1px solid #ddd;
        }

        .pic .img {
            position: absolute;
            top: 10px;
            left: 10px;
        }

        
        /* ==========댓글등록 ================*/
        .reply-group input{width:180px;margin-bottom: 10px;}
        .reply-wrap{background-color: #f5f5f5; border: 1px solid #ddd; padding: 20px; }

        
        .reply-content{
            padding-left: 60px;
            position: relative;
        }
        
        
        .fileDiv{padding-left: 60px;}

        .reply-group{
            overflow: hidden; 
            padding-top: 20px;
        }
        .reply-group .left{float: left;}
        .reply-group .right{float: right}
        
        /*텍스트영역 리사이징 옵션, 에니메이션*/
        .reply-content textarea{resize: none; height: 100px; transition: height 0.5s ease-in-out;} /*에니메이션 효과(변경할속성,지속시간,에니메이션방식,딜레이초)*/
        .reply-content textarea:focus{height: 200px;}

        /*댓글 코멘트 영역 - 위 클래스를 재활용*/
        .reply-group a{text-decoration: none; color:#7777;}
        .reply-group p{margin: 0;}

        /* =======별점 */
        #star_grade a{
        text-decoration: none;
        color: gray;
        font-size: 30px;
        }
        #star_grade a.on{
            color: darkgoldenrod;
        }

        @media (max-width: 767px){
            .room-img{
                display: none;
            }
            .room{
                padding: 10px;
            }
            .swiper-container{
                display: none;
            }
        }

    </style>
    
    
    
    
    
    
    <div class="container">
        
        <ul class="nav nav-tabs">
            <li class="active"><a data-toggle="tab" href="#home">객실</a></li>
            <li><a data-toggle="tab" href="#menu1">숙소정보</a></li>
            <li><a data-toggle="tab" href="#menu2">리뷰</a></li>

        </ul>

        <div class="tab-content">
            <div id="home" class="tab-pane fade in active">
            	<c:forEach items="${roomlist}" var="room">
                <div class="room">
                    <div class="room-img">
                        <img src="display/${room.fileloca }/${room.filename}">
                    </div>
                    <div>
                        <strong>${room.title }</strong>
                    </div>
                    <div class="room-content">
                        <div class="left" style="border-right: 1px solid #7777;">
                            <p>대실</p>
                            <form action="reservation" method="post">
	                            <div class="reserve">
	                                <span>예약</span>
	                                <b style="color: red;">${room.half_price }</b>
	                            </div>
	                            <div class="re-time">
	                                <div class="left">                               
	                                    <span>이용시간</span>
	                                </div>
	                                <div class="right">
	                                    <select name="time1">
	                                    	<option value="10">10:00</option>
	                                    	<option value="11">11:00</option>
	                                    	<option value="12">12:00</option>
	                                    	<option value="13">13:00</option>
	                                    	<option value="14">14:00</option>
	                                    	<option value="15">15:00</option>
	                                    	<option value="16">16:00</option>
	                                    	<option value="17">17:00</option>
	                                    	<option value="18">18:00</option>
	                                    	<option value="19">19:00</option>
	                                    	<option value="20">20:00</option>
	                                    </select>~
	                                    <span> ${room.half_time} 시간</span>
	                                </div>
	                            </div>
	                            <input type="hidden" name="title" value="${room.title}">
	                            <input type="hidden" name="pro_no" value="${room.pro_no}">
	                            <input type="hidden" name="room_no" value="${room.room_no}">
	                            <input type="hidden" name="pro_type" value="half">
	                            
	                            <input type="hidden" name="time2" value="${room.half_time}">
	                            <input type="hidden" name="price" value="${room.half_price}">
	                            <div>
	                                <button type="submit" class="btn btn-danger" id="half" style="width: 100%;">예약하기</button>
	                            </div>
                            </form>
                        </div>
                        <div class="left">
                            <p>숙박</p>
                            <form action="reservation" method="post">
	                            <div class="reserve">
	                                <span>예약</span>
	                                <b style="color: red;">${room.rental_price }</b>
	                            </div>
	                            <div class="re-time">
	                                <div class="left">
	                                    <span>체크인</span>
	                                    <span>체크아웃</span>
	                                </div>
	                                <div class="right">
	                                    <span>${room.checkin }</span>
	                                    <span>${room.checkout }</span>
	                                </div>
	                            </div>
	                            <input type="hidden" name="title" value="${room.title}">
	                            <input type="hidden" name="pro_no" value="${room.pro_no}">
	                            <input type="hidden" name="room_no" value="${room.room_no}">
	                            <input type="hidden" name="pro_type" value="rental">
	                            <input type="hidden" name="checkin" value="${room.checkin}">
	                            <input type="hidden" name="checkout" value="${room.checkout}">
	                            <input type="hidden" name="price" value="${room.rental_price}">
	                            <div>
	                                <button type="submit" class="btn btn-danger" id="rental" style="width: 100%;">예약하기</button>
	                            </div>
                            </form>
                        </div>
                    </div>
                </div>
                </c:forEach>
                
			</div>
                


            <div id="menu1" class="tab-pane fade">
                <div>
                    호텔객실사진
                </div>
                <!-- Swiper -->
                <div class="swiper-container" style="padding-top: 10px;">
                    <div class="swiper-wrapper">
                        <div class="swiper-slide">
                            <img src="${pageContext.request.contextPath }/resources/img/493.jpg">
                        </div>
                        <div class="swiper-slide">
                            <img src="${pageContext.request.contextPath }/resources/img/494.jpg">
                        </div>
                        <div class="swiper-slide">
                            <img src="${pageContext.request.contextPath }/resources/img/495.jpg">
                        </div>
                        <div class="swiper-slide">
                            <img src="${pageContext.request.contextPath }/resources/img/496.jpg">
                        </div>
                        <div class="swiper-slide">
                            <img src="${pageContext.request.contextPath }/resources/img/497.jpg">
                        </div>
                        <div class="swiper-slide">
                            <img src="${pageContext.request.contextPath }/resources/img/498.jpg">
                        </div>
                        <div class="swiper-slide">
                            <img src="${pageContext.request.contextPath }/resources/img/499.jpg">
                        </div>
                        <div class="swiper-slide">
                            <img src="${pageContext.request.contextPath }/resources/img/500.jpg">
                        </div>
                        <div class="swiper-slide">
                            <img src="${pageContext.request.contextPath }/resources/img/501.jpg">
                        </div>
                        
                    </div>


                    <!-- Add Pagination -->
                    <div class="swiper-pagination"></div>
                    <!-- Add Arrows -->
                    <div class="swiper-button-next"></div>
                    <div class="swiper-button-prev"></div>
                </div>
				
                <!-- <div class="container guest-content">
                    <div class="row">
                        <div class="col-sm-12 col-md-6 load-info">
                            <p>오시는길</p>
                            
                        </div>
                        <div class="col-sm-12 col-md-6 map1">
                            <p>지도</p>
                            <div id="map" style="width:100%;height:350px;"></div>
                        </div>
                    </div>
                </div> -->

                


            </div>



            <div id="menu2" class="tab-pane fade">
                <div class="review">
                    <div class="score-top">
                        <strong style="padding-bottom: 10px;">추천해요</strong>

                        <div class="score-wrap">
                            <div class="score-star star-45"></div>
                            <div class="num">
                            	<p id="review_mean"></p>
                            </div>
                        </div>
                        <p>전체리뷰:<span id="review_count"></span></p>
                    </div>

                    <ul id="reviewlist" style="padding: 0;">
                    	
                        <!-- <li class="pic">
                        	<div>
                                <img src="98eee517dd344e7bfc4cb1dc1688e7eb.jpg" width="300px" height="200px">
                            </div>
                            <div class="img">
                                <img src="human.png" alt="">
                            </div>
                            <p>
                                <strong>제목</strong>
                            </p>
                            <div class="score-wrap">
                                <div class="score-star star-45"></div>
                                <div class="num">9.0</div>
                            </div>
                            <div class="name">
                                <b>스탠다드 객실이용고객.</b>
                                <strong>회원id</strong>
                            </div>
                            <div class="txt">
                                객실이너무좋네요.객실이너무좋네요.객실이너무좋네요.객실이너무좋네요.객실이너무좋네요.객실이너무좋네요.
                            </div>
                            <div class="date">
                                <span>2시간전</span>
                            </div>
                        </li> -->
                        
                    </ul>
                    <button type="button" class="form-control" id="morelist">게시글(더보기)</button>


                </div>
                <div class="writer">
                    
                        <!-- <div class="fileDiv">
                            <img id="fileImg" src="../resources/img/img_ready.png">
                        </div> -->
                        <div class="reply-content">
                            
                            <p id="star_grade">
                                <a href="#" data-star="1">★</a>
                                <a href="#" data-star="2">★</a>
                                <a href="#" data-star="3">★</a>
                                <a href="#" data-star="4">★</a>
                                <a href="#" data-star="5">★</a>
                                <span style="font-size: 20px;">나의별점:</span>
                                <strong id="star-result" style="font-size: 20px;"></strong>
                                
                            </p>
                            
                            
                            <input type="text" class="form-control" placeholder="제목을 입력하세요" name="review-title" style="width: 50%;">
                            <br>
                            <textarea class="form-control" rows="5" id="comment"></textarea>
                            <div class="reply-group"> <!-- 부모상자 -->
                                <div class="filebox left">
                                    <label for="file">이미지업로드</label> 
                                    <input type="file" name="file" id="file">
                                </div>
                                <button type="button" class="right btn btn-info" id="uploadBtn">등록하기</button>
                            </div>
                        </div>
                   
                    
                    
                </div>

            </div>

        </div>
    </div>
<hr>
<div style="padding: 0px 140px">
<div id="map" style="width:100%;height:350px;"></div>
</div>
    <script src="ht	tps://unpkg.com/swiper/swiper-bundle.js"></script>
    <script src="https://unpkg.com/swiper/swiper-bundle.min.js"></script>
    <!-- Initialize Swiper -->
    
 

    
    <script>
    var address = "${address}";
    var protitle = "${protitle}";
	var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
	    mapOption = {
	        center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
	        level: 5 // 지도의 확대 레벨
	    };  
	
	// 지도를 생성합니다    
	var map = new kakao.maps.Map(mapContainer, mapOption); 
	
	// 주소-좌표 변환 객체를 생성합니다
	var geocoder = new kakao.maps.services.Geocoder();
	
	// 주소로 좌표를 검색합니다
	geocoder.addressSearch(address, function(result, status) {
	
	    // 정상적으로 검색이 완료됐으면 
	     if (status === kakao.maps.services.Status.OK) {
	
	        var coords = new kakao.maps.LatLng(result[0].y, result[0].x);
	
	        // 결과값으로 받은 위치를 마커로 표시합니다
	        var marker = new kakao.maps.Marker({
	            map: map,
	            position: coords
	        });
	
	        // 인포윈도우로 장소에 대한 설명을 표시합니다
	        var infowindow = new kakao.maps.InfoWindow({
	            content: '<div style="width:150px;text-align:center;padding:6px 0;">'+protitle+'</div>'
	        });
	        infowindow.open(map, marker);
	
	        // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
	        map.setCenter(coords);
	    } 
	});    
</script>

    <script>
        var swiper = new Swiper('.swiper-container', {
            slidesPerView: 3,
            spaceBetween: 30,
            slidesPerGroup: 3,
            observer: true,  // true 로 설정할 경우 슬라이더가 불러올때마다 새로고침되는 역할
            observeParents: true, //
            loop: true,
            loopFillGroupWithBlank: true,
            pagination: {
                el: '.swiper-pagination',
                clickable: true,
            },
            navigation: {
                nextEl: '.swiper-button-next',
                prevEl: '.swiper-button-prev',
            },
        });
    </script>

    <script>
        $('#star_grade a').click(function(){
            $(this).parent().children("a").removeClass("on");  /* 별점의 on 클래스 전부 제거 */ 
            $(this).addClass("on").prevAll("a").addClass("on"); /* 클릭한 별과, 그 앞 까지 별점에 on 클래스 추가 */
            $("#star-result").html(event.target.dataset.star)
        });
        
       
        $(document).ready(function(){
        	$("#uploadBtn").click(regist);
        	
	        function regist() {
				var writer = "${userVO.userId}";
				var file = $("#file").val();
				var pro_no = $("input[name='pro_no']").val();
				var score=$("#star-result").html()
				var title=$("input[name='review-title']").val()
				var content = $("#comment").val()
				
				file=file.substring(file.lastIndexOf('.')+1,file.length).toLowerCase();
				
				if(file != 'jpg' && file !='png' && file !='jpeg'){
					alert('이미지(jpg,png,jpeg)만 등록가능합니다')
					return;
				}else if(title ==""){
					alert("제목을 입력해주세요")
					return;
				}else if(content ==""){
					alert("내용을 입력해주세요")
					return;
				}
				 else if(writer ==""){
					alert('로그인이 필요한 서비스입니다')
					return;
				} 
				
				var formData = new FormData();
				var data = $("#file");
				
				formData.append("file",data[0].files[0]); //file이름으로 file데이터 저장
				formData.append("pro_no",pro_no);
				formData.append("score",score);
				formData.append("title",title);
				formData.append("content",content);
				
				
				
				$.ajax({
					type:"post",
					url:"upload",
					processData:false, //폼형식이 &변수=값의 형태로 변경되는 것을 막는다.
					contentType:false, //false로 지정하면 기본으로 "multipart/form-data" 으로 선언됨
					data:formData, //폼데이터객체
					success:function(result){
						if(result=="success"){
							$("#file").val("");
							$("input[name='review-title']").val("");
							$("#comment").val("");
							$("#star_grade").children("a").removeClass("on");
							alert('등록되었습니다');
							$("#morelist").css("display","block");
							getlist(1,true);
						}else{
							alert("등록실패. 관리자에게 문의하세요");
						}
					},
					error:function(status,error){}
				})	
			}
	        
	        
	        getlist(1,false);
	        
	        var pageNum =1;
	        var str="";
	        function getlist(page,reset) {
		        var pro_no = $("input[name='pro_no']").val();
				$.getJSON("getreview/"+pro_no+"/"+page,function(map){
					var list=map.list;
					var count = map.count;
					var mean = map.mean;
					$("#review_count").html(count);
					$("#review_mean").html(mean.toFixed(2));
					if(reset){
						str="";
						pageNum=1;
					}
					if(pageNum*10>= count){
						$("#morelist").css("display","none");
					}
					if(list.length <=0){
						return;
					}
					
					for(var i=0; i<list.length; i++){
						str+='<li class="pic">'
						str+='<div>'
						str+='<img src=display/'+list[i].fileloca+"/"+list[i].filename+' width="300px" height="200px">'
						str+='</div>'
						str+='<div class="img">'
						str+='<img src="human.png" alt="">'
						str+='</div>'
						str+='<p>'
						str+='<strong>'+list[i].title+'</strong>'
						str+='</p>'
						str+='<div class="score-wrap">'
						str+='<div class="score-star star-45"></div>'
						str+='<div class="num">'+list[i].score+".0"+'</div>'
						str+='</div>'
						str+='<div class="name">'
						str+='<b>스탠다드 객실이용고객.</b>'
						str+='<strong>'+list[i].id+'</strong>'
						str+='</div>'
						str+='<div class="txt">'
						str+=list[i].content
						str+='</div>'
						str+='<div class="date">'
						str+='<span>'+timeStamp(list[i].regdate)+'</span>'
						str+='</div>'
						str+='</li>'
					}
					$("#reviewlist").html(str)
				})
			}
	        
	        $("#morelist").click(function(){
	        	pageNum = pageNum+1;
	        	getlist(pageNum,false);
	        })
	        
	        function timeStamp(millis) {
				//1시간 기준으로 방금전 or xx시간
				//1일 기준으로 날짜 출력
				var date = new Date(); //현재시간
				var gap = date- millis; //밀리초
				console.log(gap);
				
				//1000*60*60 //1시간
				//1000*60*60*24 //1일
				var result ="";
				if(gap <1000*60*60){
					result="방금전";
				}else if(gap <1000*60*60*24){
					var time=parseInt(gap/(1000*60*60));
					result=time+"시간전";
				}else{	
					var date = new Date(millis);
					var year=date.getFullYear();
					var month=date.getMonth()+1;
					var day=date.getDate();
					var hour=date.getHours();
					var minute=date.getMinutes();
					var second=date.getSeconds();
					result = year+"년"+month+"월"+day+"일"+(hour <10?"0"+hour:hour)+":"+(minute <10?"0"+minute:minute)+":"+(second <10?"0"+second:second)
				}
				return result;
				
			}
	        
        })
        
        
        
        
        
    </script>
    