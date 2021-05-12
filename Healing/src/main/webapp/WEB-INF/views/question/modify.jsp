<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>    
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/style2.css">
    <section>
        <div class="container">
            <div class="row">
                <div class="col-xs-12 col-md-9 write-wrap">
                        <div class="titlebox">
                            <p>수정하기</p>
                        </div>
                        
                        <form action="freeUpdate" method="post" name="update">
                            <div>
                                <label>DATE</label>
                                <p><fmt:formatDate value="${vo.regdate }" pattern="yyyy년MM월dd일"/></p>
                            </div>   
                            <div class="form-group">
                                <label>번호</label>
                                <input class="form-control" name='qno' value="${vo.qno }" readonly>
                            </div>
                            <div class="form-group">
                                <label>작성자</label>
                                <input class="form-control" name='qid' value="${vo.qid }" readonly>
                            </div>    
                            <div class="form-group">
                                <label>제목</label>
                                <input class="form-control" name='qtitle' value="${vo.qtitle }">
                            </div>

                            <div class="form-group">
                                <label>내용</label>
                                <textarea class="form-control" rows="10" name='qcontent'>${vo.qcontent }</textarea>
                            </div>

                            <button type="button" class="btn btn-dark" id="listBtn">목록</button>    
                            <button type="button" class="btn btn-primary" id="updateBtn">변경</button>
                            <button type="button" class="btn btn-info" id="deleteBtn">삭제</button>
                    </form>
                </div>
            </div>
        </div>
   </section>
	
	
	
	
	
	<script type="text/javascript">
	
	var updatebtn = document.getElementById("updateBtn");
	updatebtn.onclick = function(){

			if (document.update.qtitle.value === '') {
				alert("제목은 필수 입니다");
				document.update.ntitle.focus();
				return;
			} else if (document.update.qcontent.value === '') {
				alert("제목은 필수 입니다");
				document.update.ncontent.focus();
				return;
			} else {
				document.update.action = "update"; 
				document.update.submit(); 
			}
		}
	
	var deletebtn = document.getElementById("deleteBtn");
		deletebtn.onclick = function() {
			
			document.update.action = "delete"; 
			document.update.submit(); 
		}
	
	
	</script>	
	
	
	
	