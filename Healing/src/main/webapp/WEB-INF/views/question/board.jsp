<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/style2.css">
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

    <section>
        <div class="container-fluid">
            <div class="row">
                <!--lg에서 9그리드, xs에서 전체그리드-->   
                <div class="col-lg-9 col-xs-12 board-table">
                    <div class="titlebox">
                        <h2>고객센터</h2>
                    </div>
                    <hr>
                    
                    <!--form select를 가져온다 -->
					<form action="board" >
						<div class="search-wrap">
							<button type="submit" class="btn btn-info search-btn">검색</button>
							<input type="text" class="form-control search-input" name="searchName" value="${pagevo.cri.searchName}"> <select
								class="form-control search-select" name="searchType">
								<option value="title" ${pagevo.cri.searchType=='title'?'selected':'' }>제목</option>
								<option value="content" ${pagevo.cri.searchType=='content'?'selected':'' }>내용</option>
								<option value="writer" ${pagevo.cri.searchType=='writer'?'selected':'' }>작성자</option>
								<option value="titcont" ${pagevo.cri.searchType=='titcont'?'selected':'' }>제목+내용</option>
							</select>
						</div>
						<!-- <input type="submit" name="pageNum" value="1">
						<input type="submit" name="amount" value="10"> -->
					</form>

				<table class="table table-bordered">
                        <thead>
                            <tr>
                                <th>번호</th>
                                <th class="board-title">제목</th>
                                <th>작성자</th>
                                <th>등록일</th>
                                <th>수정일</th>
                            </tr>
                        </thead>
                        <tbody style="text-align: center;">
                        	<c:forEach var="vo" items="${list }">
                            <tr>
                                <td>${vo.qno }</td>
                                <td><a href="detail?qno=${vo.qno }">${vo.qtitle }</a></td>
                                <td>${vo.qid }</td>
                                <td><fmt:formatDate value="${vo.regdate }" pattern="yyyy년MM월dd일"/></td>
                                <td><fmt:formatDate value="${vo.updatedate }" pattern="yyyy년MM월dd일"/></td>
                            </tr>
							</c:forEach>
                        </tbody>
                        
                    </table>


                    <!--페이지 네이션을 가져옴-->
		    		<form action="board" name="pageform">
                    <div class="text-center">
                    <hr>
                    <ul class="pagination pagination-sm">
                        <c:if test="${pagevo.prev}">
                        	<li><a href="#" data-page="${pagevo.startPage-1}">이전</a></li>
                        </c:if>
                        <c:forEach begin="${pagevo.startPage}" end="${pagevo.endPage}" var="num">
                        	<li  class="${pagevo.pageNum == num?'active':''}"><a href="#" data-page="${num}">${num}</a></li>
                        </c:forEach>
                        <c:if test="${pagevo.next}">
                        	<li><a href="#" data-page="${pagevo.endPage+1}">다음</a></li>
                        </c:if>
                    </ul>
                    <c:if test="${userVO != null}">
                    <button type="button" class="btn btn-info" onclick="location.href='write' ">글쓰기</button>
                    </c:if>
                    </div>
                    <input type="hidden" name="pageNum">
                    <input type="hidden" name="amount">
                    <input type="hidden" name="searchType" value="${pagevo.cri.searchType}">
                    <input type="hidden" name="searchName" value="${pagevo.cri.searchName}">
		    		</form>

                </div>
            </div>
        </div>
	</section>
	
	
	<script type="text/javascript">
	
	var pagination=document.querySelector(".pagination");
	pagination.onclick = function () {
		event.preventDefault();
		
		if(event.target.localName !== 'a') return;
		console.log(event.target.dataset.page);
		
		document.pageform.pageNum.value = event.target.dataset.page;
		document.pageform.amount.value = 10;
		document.pageform.submit();
	}

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
			
			
			
			
			
			
			

	</script>