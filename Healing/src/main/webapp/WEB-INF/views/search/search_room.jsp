<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
	
	<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
    <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
    
    <style>
        body{
            font-size: 20px;
        }
        h3{margin: 0;}
        
        .filter-wrap {
        }
        .space{
            border: 1px solid #ddd;
            padding: 18px;
        }

        .list-wrap {
        }
        .head-check ul,li{
            list-style: none;
            margin: 0;
        }
        .head-check li{
            display: inline-block;
            background-color: #ddd;
            font-size: 25px;
            padding: 10px;
        }


        .product-list{
            border: 1px solid #ddd;
            padding: 10px;

        }
        .product-no{
            padding: 16px 0 16px 168px;
            position: relative;
            border-bottom: 1px solid #ddd;
        }
        .product-no .back-color{
            position: absolute;
            background-color:rgba(247, 238, 238, 0.8); 
            top: 0; 
            left: 0; 
            width: 100%; 
            height: 100%; 
            opacity: 0; 
            text-align: center; 
            color: white;
        }
        .product-no:hover> .back-color{
            opacity: 1;
            z-index: 10;
        }
        .product-no img{
            position: absolute;
            top: 16px;
            left: 10px;
            width: 150px;
            height: 227px;
        }

        .pro-right{
            text-align: right;
            padding-top: 60px;
        }

        .on{
            color: red;
        }
        .date-wrap{
            padding: 10px;
            border-bottom: 1px solid #ddd;
        }
        

    </style>
    <script type="text/javascript">
    function getDistanceFromLatLonInKm(lat2,lng2) {
    	var lat1 =sessionStorage.getItem("lat1"); 
		var lng1 =sessionStorage.getItem("lng1");
		function deg2rad(deg) {
	        return deg * (Math.PI/180)
	    }

	    var R = 6371; // Radius of the earth in km
	    var dLat = deg2rad(lat2-lat1);  // deg2rad below
	    var dLon = deg2rad(lng2-lng1);
	    var a = Math.sin(dLat/2) * Math.sin(dLat/2) + Math.cos(deg2rad(lat1)) * Math.cos(deg2rad(lat2)) * Math.sin(dLon/2) * Math.sin(dLon/2);
	    var c = 2 * Math.atan2(Math.sqrt(a), Math.sqrt(1-a));
	    var d = R * c; // Distance in km
	    return d;
	}
	</script>
    
    
    <div class="container">
        <div class="row">
            <div class="col-sm-12 col-md-4 filter-wrap" style="margin-top: 100px;">
                <div class="space">
                    <div class="date-wrap">
                        <h3 style="padding: 10px;">날짜</h3>
                        <div style="padding: 10px;">
                            <input type="text" id="datepicker1">일 ~
                            <input type="text" id="datepicker2">까지
                        </div>
                    </div>
                    <form action="search_room" name="searchform">
                    <div class="check-wrap">
                        <h3 style="padding: 20px 10px;">상세조건</h3>
                        <div>
                            <button type="reset" class="btn" style="width: 45%;">초기화</button>   
                            <button type="button" class="btn btn-danger" style="width: 45%;" id="btn1">적용</button>
                        </div>
                        <div style="padding: 10px;">
                            
                                <h4>테마</h4>
	                                <input type="radio" name="thema" ${searchNameVO.thema =='all'?'checked':'' } value="all">전체<br>
	                                <input type="radio" name="thema" ${searchNameVO.thema =='hotel'?'checked':'' } value="hotel">호텔<br>
	                                <input type="radio" name="thema" ${searchNameVO.thema =='motel'?'checked':'' } value="motel">모텔<br>
	                                <hr>
                                <h4>거리설정</h4>
	                                <input type="radio" name="range" ${searchNameVO.range ==9999?'checked':'' } value="9999">기준거리 <br>
	                                <input type="radio" name="range" ${searchNameVO.range ==10?'checked':'' } value="10">10km<br>
	                                <input type="radio" name="range" ${searchNameVO.range ==20?'checked':'' } value="20">20km<br>
	                                <input type="radio" name="range" ${searchNameVO.range ==30?'checked':'' } value="30">30km<br>
	                                <hr>
                                <h4>가격</h4>
                                <p>
                                    <label for="amount">가격:</label>
                                    <input type="text" id="amount" readonly style="border:0; color:#f6931f; font-weight:bold;">
                                  </p>
                                   
                                  <div id="slider-range"></div>
                            	<hr>
	                            <h4>순서</h4>
	                            	<input type="radio" name="order" ${searchNameVO.order =='rowprice'?'checked':'' } value="rowprice">낮은가격순<br>
	                                <input type="radio" name="order" ${searchNameVO.order =='highprice'?'checked':'' } value="highprice">높은가격순<br>
	                              		
									
									<input type="hidden" name="price1">
									<input type="hidden" name="price2">
									<input type="hidden" name="searchname" value="${searchNameVO.searchname}">
													
                        </div>
                        
                    </div>
                    </form>
                </div>
            </div>
            <div class="col-sm-12 col-md-8 list-wrap" style="margin-top: 100px;">
               
                <div class="product-list">
                	<c:forEach items="${productlist}" var="product">
                	
                	
                    <div class="product-no">
                        
                        <div>
                            <img src="display/${product.fileloca}/${product.filename}" >
                        </div>
                        <div class="pro-left">
                            <h3><a href="room_info?pro_no=${product.pro_no}">${product.name}</a></h3>
                            <span style="background-color: gold;">
                            	<script type="text/javascript">
                            			reviewmean();
                            			function reviewmean() {
                            				
                            				$.getJSON("reviewcountMean/"+${product.pro_no}, function(map){
												console.log(map.count);
												console.log(map.mean);
												$("#${product.pro_no}no").parent().prev().html("("+map.count+")");
												$("#${product.pro_no}no").parent().prev().prev().prev().children().last().html(map.mean.toFixed(1));
									
											})
										}	
                            	</script>
                            	<em></em>
                            </span>
                            <strong>추천해요</strong>
                            	<span></span>
                            <p>
                            	<span id="${product.pro_no}no"></span> |
                            		<script>
	                            		var lat2 = "${product.latitude}";
	                            		var lng2 = "${product.hardness}";
	                            		var range = "${searchNameVO.range}";
	                            		var result=getDistanceFromLatLonInKm(lat2,lng2);
	                            		
	                            		if(range<= result){
	                            			$("#${product.pro_no}no").parent().parent().parent().css("display","none");
	                            		}else{
		                            		$("#${product.pro_no}no").html(result.toFixed(2)+"km");	                            			
	                            		}
                            		</script>
                                <span>${product.basic_address}</span>
                            </p>
                        </div>
                        <div class="pro-right">
                            <p>
                                <span style="background-color: rgb(243, 162, 162); color: white;">예약</span> 
                                <span>대실</span>
                                <strong>${product.half_price}</strong>
                            </p>
                            <p>
                                <span style="background-color: rgb(243, 162, 162); color: white;">예약</span>
                                <span>숙박</span>
                                <strong>${product.rental_price}</strong>
                            </p>
                        </div>
                    </div>
                   
                    </c:forEach>
                    
                </div>

            </div>
        </div>
    </div>
    
    <script>
       
        $(function(){
            $("#datepicker1").datepicker();
            $("#datepicker1").datepicker("option","dateFormat","yy-mm-dd")
            $("#datepicker2").datepicker();
            $("#datepicker2").datepicker("option","dateFormat","yy-mm-dd")
        })
        
    </script>
    <script>
        $( function() {
          $( "#slider-range" ).slider({
            range: true,
            min: 0,
            max: 30,
            values: [ 0, 30 ],
            slide: function( event, ui ) {
              $( "#amount" ).val( ui.values[ 0 ] + "만원 ~ " + ui.values[ 1 ] +"만원");
            }
          });
          $( "#amount" ).val($( "#slider-range" ).slider( "values", 0 ) +
            "만원 ~ " + $( "#slider-range" ).slider( "values", 1 )+"만원" );
        } );

        
    </script>
    
    <script>
      	
    	$("#btn1").click(select);
    	function select(){
    		
    		var result=$("#amount").val().split(" ~ ")
    		var price1=result[0].substring(0,result[0].indexOf("만"))*10000
            var price2=result[1].substring(0,result[1].indexOf("만"))*10000
            
            $("input[name='price1']").val(price1);
            $("input[name='price2']").val(price2);
            
            document.searchform.submit();
    	} 
    	
    	$(document).ready(function(){
	    	
    		
    	})
    	
    </script>
    