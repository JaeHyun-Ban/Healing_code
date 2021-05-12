<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
    <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/byagegroup.css">
    
<section>
        <div class="container">
            <div class="row">
                <div class="col-xs-12" style="margin-top: 100px;">



                    <div class="title-box">
                        연령대별 추천
                    </div>

                    <ul class="nav nav-tabs agegroup ">
                        <li class="active"><a data-toggle="tab" href="#after20">20대</a></li>
                        <li><a data-toggle="tab" href="#after30">30대</a></li>
                        <li><a data-toggle="tab" href="#after40">40대이상</a></li>
                        
                    </ul>

                    <!-- =========20대=========== -->
                    <div class="tab-content">
                        <div id="after20" class="tab-pane fade in active">
							<c:forEach items="${twentylist}" var="twenty">
                            <li class="col-lg-6 col-sm-12 mainviewimg">
                                <a href="room_info?pro_no=${twenty.pro_no }" class="selecttype">
                                    <img src="display/${twenty.fileloca}/${twenty.filename}" alt="1">

                                    <div class="gra_black">

                                        <div class="mainviewinfo" style="text-align: left;">
                                            <p style="margin: 0; font-size: 25px;">${twenty.name }</p>
                                            <p style="margin: 0; font-size: 15px;" id="twenty${twenty.pro_no}"></p>
                                            <script type="text/javascript">
			                            			reviewmean();
			                            			function reviewmean() {
			                         
			                            				$.getJSON("reviewcountMean/"+${twenty.pro_no}, function(map){
															console.log(map.mean);
															$("#twenty${twenty.pro_no}").html(map.mean.toFixed(1));
												
														})
													}	
			                            	</script>
                                            <p style="margin: 0; font-size: 19px;">${twenty.basic_address}</p>
                                        </div>

                                        <div class="mainviewprice">
                                            <p style="margin: 0; font-size: 25px;">${twenty.rental_price}</p>
                                        </div>

                                    </div>
                                </a>
                            </li>
							</c:forEach>
                            

                        </div>


                        <!-- =========30대=========== -->
                        <div id="after30" class="tab-pane fade">

                            <c:forEach items="${thirtylist}" var="thirty">
                            <li class="col-lg-6 col-sm-12 mainviewimg">
                                <a href="room_info?pro_no=${thirty.pro_no }" class="selecttype">
                                    <img src="display/${thirty.fileloca}/${thirty.filename}" alt="1">

                                    <div class="gra_black">

                                        <div class="mainviewinfo" style="text-align: left;">
                                            <p style="margin: 0; font-size: 25px;">${thirty.name }</p>
                                            <p style="margin: 0; font-size: 15px;" id="thirty${thirty.pro_no}"></p>
                                            <script type="text/javascript">
			                            			reviewmean1();
			                            			function reviewmean1() {
			                         
			                            				$.getJSON("reviewcountMean/"+${thirty.pro_no}, function(map){
															console.log(map.mean);
															$("#thirty${thirty.pro_no}").html(map.mean.toFixed(1));
												
														})
													}	
			                            	</script>
                                            <p style="margin: 0; font-size: 19px;">${thirty.basic_address}</p>
                                        </div>

                                        <div class="mainviewprice">
                                            <p style="margin: 0; font-size: 25px;">${thirty.rental_price}</p>
                                        </div>

                                    </div>
                                </a>
                            </li>
							</c:forEach>

                        </div>


                        <!-- =========40대=========== -->
                        <div id="after40" class="tab-pane fade">

                            <c:forEach items="${fortylist}" var="forty">
                            <li class="col-lg-6 col-sm-12 mainviewimg">
                                <a href="room_info?pro_no=${forty.pro_no }" class="selecttype">
                                    <img src="display/${forty.fileloca}/${forty.filename}" alt="1">

                                    <div class="gra_black">

                                        <div class="mainviewinfo" style="text-align: left;">
                                            <p style="margin: 0; font-size: 25px;">${forty.name }</p>
                                            <p style="margin: 0; font-size: 15px;" id="${forty.pro_no}">5.0</p>
                                            <script type="text/javascript">
			                            			reviewmean();
			                            			function reviewmean() {
			                         
			                            				$.getJSON("reviewcountMean/"+${forty.pro_no}, function(map){
															console.log(map.mean);
															$("#${forty.pro_no}").html(map.mean.toFixed(1));
												
														})
													}	
			                            	</script>
                                            <p style="margin: 0; font-size: 19px;">${forty.basic_address}</p>
                                        </div>

                                        <div class="mainviewprice">
                                            <p style="margin: 0; font-size: 25px;">${forty.rental_price}</p>
                                        </div>

                                    </div>
                                </a>
                            </li>
							</c:forEach>

                        </div>


                        <!-- =========50대=========== -->
                        

                    </div>
                </div>
            </div>
    </section>