<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>사용자 생성 게시판</title>
<link rel="stylesheet" href="resources/css/boardview.css?after">
</head>
<body>
	<div class="wrap">
			<!-- 1. 인트로-->
			<div class="intro">
				<!--[1-1] nav바(HOME, SEARCH, ABOUT, SIGN IN)-->
				<jsp:include page="/WEB-INF/views/common/selectNav.jsp"></jsp:include>
				<!--[1-2] 배경사진(모임의 주제 나타낼 수 있는)-->
				<div class="bg"><img src="resources/uploadFiles/${ club.backgroundImage }"></div>	
				<!--[1-3] 인트로 버튼(글쓰기, 검색, 수정, 삭제)-->
				<c:if test="${ loginUser.userNo == club.creator }">
					<div class="intro_button">
	                	<span class="delete" id="delete">삭제</span>
		                <span class="update" id="edit">
							<input type="button">수정		
						</span>
	                </div>
				</c:if>
				<c:if test="${ loginUser.userNo != club.creator }">
					<c:set var="isInClub" value="false"></c:set>
					<c:forEach items="${ list }" var="m">
						<c:if test="${ m.userNo == loginUser.userNo }">
							<c:set var="isInClub" value="true"></c:set>
						</c:if>		
					</c:forEach>
					<c:if test="${ isInClub == false }">
						<div class="intro_button">
							<span class="update" id="join">
									<input type="button">참가
							</span>
						</div>
					</c:if>
					<c:if test="${ isInClub == true }">
						<div class="intro_button">
							<span class="update" id="leave">
									<input type="button">탈퇴
							</span>
						</div>
					</c:if>
				</c:if>
			</div>
			<!--2. 내용-->
			<div class="content">
            <!--[2-1] 게시물의 주 내용-->
           		<!--1)상단부(프로필사진, 제목, 작성자 닉네임)-->    
				<div class="content_header">
					<div class="content_img"><img src="resources/uploadFiles/${ clubOwner.profile }"></div>
					<div class="content_title_writer">
						<div class="title">${ club.clubName }</div>
						<div class="writer">호스트 ${ clubOwner.nickName }</div>
					</div>
				</div>
				<!--2)작성된 내용-->
				<div class="write_content">
					${ club.content }
				</div>
				<!--[2-2] 안내사항-->
				<div class="info">
					<div class="info_title"><b>안내사항</b></div>
					<br>
					<div class="info_title_explation">자세한 정보를 알려드릴게요</div>
					<br>
					<div class="info_title">${ category }</div>
					<br>
					<div class="info_title">${ club.clubCapacity }﹒${ club.clubAccess == 'Y' ? '승인제' : '선착순' }</div>
					<br>
					<div class="info_title">${ club.paymentYN == 'Y' ? '참가비 있음' : '참가비 없음' }</div>
					<br>
					<div class="info_title">${ club.onlineYN == 'Y' ? '온라인' : '오프라인' }</div>
					<br>
					<div class="info_title"><fmt:formatDate value="${ club.clubSchedule }" pattern="MM.dd(E) a hh:mm"></fmt:formatDate></div>
				</div>
				<!--[2-3] 비슷한 모임 추천(해시태그로)-->
				<div class="recommend">
					<div class="recommend_title"><b>비슷한 모임</b></div>
					<br>
					<div class="recommend_title_explation">이런 모임은 어때요</div>
					<div class="info_title">#음악감상&nbsp;#영화감상</div>
				</div>
				<!--3. 댓글-->
				<div class="reply_div">
					<div>
						<ul class="comment">
							<h4>댓글쓰기<span></span></h4>
							<li class="comment-form">
								<form id="commentFrm">
									<span class="ps_box">
										<input type="text" placeholder="댓글 내용을 입력해주세요." class="int" name="content"/>
									</span>
									<input type="submit" id="" class="btn" value="등록"/>
								</form>
							</li>
							<li id="comment-list"></li>
						</ul>
					</div>
				</div>
			</div><!--'2. 내용'의 div 닫음-->
		</div><!--'class="wrap"'의 div 닫음-->
			
			
		<script>
			// 게시물을 삭제할건지 묻는 것 //
			window.onload = () => {
				const join = document.getElementById("join");
				if (join != null) {
					join.addEventListener("click", () => {
						if(${ empty loginUser }) {
							alert("로그인 후에 사용해주세요");
							window.location.href = "${contextPath}/goToSignIn.me";
						} else {
							window.location.href= "${ contextPath}/joinClub.bo?clubNo=" + ${ club.clubNo };
						}
					});
				}

				const edit = document.getElementById("edit");
				if (edit != null) {
					edit.addEventListener("click", () => {
						window.location.href= "${ contextPath}/editClub.bo?clubNo=" + ${ club.clubNo };
					});
				}
				
				const deleteBtn = document.getElementById("delete");
				if (deleteBtn != null) {
					deleteBtn.addEventListener("click", () => {
						if(confirm("정말 삭제하시겠습니까?")){
							window.location.href= "${ contextPath}/deleteClub.bo?clubNo=" + ${ club.clubNo };
						}
					});
				}
				
				const leave = document.getElementById("leave");
				if (leave != null) {
					leave.addEventListener("click", () => {
						window.location.href= "${ contextPath}/leaveClub.bo?clubNo=" + ${ club.clubNo };
					});
				}
			}
			
			
			
		</script>
</body>
</html>