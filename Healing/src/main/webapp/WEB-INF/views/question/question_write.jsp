<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/board.css">
	
	<section>
		<div class="container">
			<div class="row">
				<div class="board-title">
					<p>질문작성</p>
				</div>
				<div class="write-wrap">
					<div class="write-box">
						<div class="write-title">
							<dl>
								<dt class="title-dt">제목</dt>
								<dd>
									<input type="text" placeholder="제목입력">
								</dd>
							</dl>
						</div>
						<div class="write-info">
							<dl>
								<dt class="info-dt">내용</dt>
							</dl>
						</div>
						<!-- <div class="write-info">
	                            <dl>
	                                <dt>아이디</dt>
	                                <dd><input type="text" placeholder="사용자아이디"></dd>
	                            </dl>
	                            <dl>
	                                <dt>비밀번호</dt>
	                                <dd><input type="password" placeholder="비밀번호입력"></dd>
	                            </dl>
	                        </div>
	                        </div> -->
						<div class="write-content">
							<textarea placeholder="내용입력"></textarea>
	
						</div>
	
						<div class="write-button">
							<button type="button" class="btn btn-info">질문 등록</button>
							<button type="button" class="btn btn-info">목록</button>
						</div>
					</div>
				</div>
			</div>
	
		</div>
		</div>
	</section>