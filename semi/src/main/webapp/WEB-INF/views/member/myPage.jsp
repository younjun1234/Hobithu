<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="resources/css/mypage.css" rel="stylesheet" type="text/css">
</head>
<body>
	<!-- header -->
	<div class="header">
		<div class="nav_bar">
			<ul>
				<li><a href="${ contextPath }/">HOME</a></li>
				<li><a href="${ contextPath }/search.bo">SEARCH</a></li>
				<li><a href="${ contextPath }/about.do">ABOUT</a></li>
			</ul>
		</div>
		
			<div class="bell">
				<div id="bellB_tn">
						<button type = "button" style="background: none; border: none; cursor: pointer;" onclick="popUp();">
							<img src="https://cdn-icons-png.flaticon.com/512/2088/2088595.png"
								 alt="Image" style="width: 30px; height: 30px;"></img>
						</button>
				</div>
			</div>
		
		<div class="login">
			<a href="${ contextPath }/logout.me">SIGN OUT</a>
		</div>
		<div id="backgroundImage" style="background-image: url('resources/img/background.jpg');"></div>
	</div>
	
	<!-- 마이페이지 테두리 창-->
	<fieldset style="width: 1000px; height: 1350px; margin: auto; background-color: white; box-shadow: 5px 5px 3px 1px black;">
	
	<!-- 알림창 -->
	
		<div id="bell_screen">
			<c:forEach items="${ alarmList }" var="a">
				<br>
					<div id="bellSquare">
						<p><b>[공지사항]</b></p><br>
						<p>${ a.noticeTitle }</p>
	        			<p>${ a.noticeContent }</p>
					</div>
			</c:forEach>
				<br>
		</div>
		
	<!-- 개인 정보 및 비밀번호 변경 -->
		<br>
		<div style="width: 1000px; border-radius: 16px; margin : auto">
		<div id="upside">
			<span class="row">
				<span class="line">
					<br>
					<span>
			    		<h3><a id="nameEdit" href="${ contextPath }/editMyInformation.me">개인정보 변경</a></h3>
			    	</span>
			    	<br>
			    	<span>
			    		<h3><a id="pwdEdit" href="${ contextPath }/editPwd.me">비밀번호 변경</a></h3>
			    	</span>
		    	</span>
		    
		    	<!-- 프로필 -->
		    	<br>
		    	<div id="profile" style="background-image: url('${contextPath}/resources/uploadFiles/${loginUser.profile}')";></div>
		    	
		    	<!-- 내 정보가 보이는 Box-->
		    	<table style="position: relative; left: 200px; top: 20px; font-size: 20px;">
					<tr>
						<td><b>아이디</b></td>
						<td>&nbsp;&nbsp;${ loginUser.userId }</td>
					</tr>
					<tr>
						<td><b>닉네임</b></td>
						<td>&nbsp;&nbsp;${ loginUser.nickName }</td>
					</tr>
					<tr>
						<td><b>이메일</b></td>
						<td>&nbsp;&nbsp;${ loginUser.email }</td>
					</tr>
					<tr>
						<td><b>생년월일</b></td>
						<td>&nbsp;&nbsp;${ loginUser.birthDate }</td>
					</tr>
				</table>
		    	<br><br><br>
		    	
		    	<!-- 게시판/모임/좋아요 버튼 구현-->
				<div id="action">
						<button type="button" id="게시물" style="background: none; border: none; cursor: pointer;" onclick="postBoard();" >
							<b>게시물</b>
						</button>
						<button type="button" id="모임" style="background: none; border: none; cursor: pointer;" onclick="notiBoard();">
							<b>모임</b>
						</button>
						<button type="button" id="좋아요" style="background: none; border: none; cursor: pointer;" onclick="likeBoard();">
							<b>좋아요</b>
						</button>
						
				</div>
		    	
		    	<!-- 게시판/모임/좋아요 창 구현-->
						
			    	<!-- 첫 번째 : 작성한 게시물 -->
			    	
				    	<div id="postBoard"><br>
							<p style="text-align: left; margin: 20px;"><b>내가 만든 모임</b></p>
							<c:forEach items="${ clubList }" var="c">
								<c:if test="${ c.creator == loginUser.userNo }">
									<div id="squareBack">
										<div id="square">
											<img src="resources/uploadFiles/${ c.backgroundImage }" 
												 alt="Image"></img>
											<div id="clubInfo">							
												<p><b>${ c.clubName }</b></p>
												<p><fmt:formatDate value="${ c.clubSchedule }" pattern="MM.dd(E) a hh:mm"></fmt:formatDate></p>
											</div>
										</div>
									</div>
								</c:if>
							</c:forEach>
							<br>	
						</div>
							
			    	
			    	<!-- 두 번째 : 참여 중인 모임 -->
			    	
				    	<div id="notiBoard"><br>
							<p style="text-align: left; margin: 20px;"><b>참여 중인 모임</b></p>
							<c:forEach items="${ clubList }" var="c">
								<c:if test="${ loginUser.userNo != c.creator }">
									<div id="squareBack">
										<div id="square">
											<img src="resources/uploadFiles/${ c.backgroundImage } 
												 alt="Image"></img>
											<div id="clubInfo">
												<p><b>${ c.clubName }</b></p>
												<p><fmt:formatDate value="${ c.clubSchedule }" pattern="MM.dd(E) a hh:mm"></fmt:formatDate></p>
											</div>
										</div>
									</div>
								</c:if>
							</c:forEach>
								<br>	
						</div>
					
					<!-- 세 번째 : 좋아요한 멤버 및 댓글 -->
			    	
				    	<div id="likeBoard"><br>
							<p style="text-align: left; margin: 20px;"><b>좋아요</b></p>
							<c:forEach items="${ likeList }" var="k">
								<div id="squareBack">
									<div id="square">
										<img src="https://cdn-icons-png.flaticon.com/512/7579/7579706.png" 
											 alt="Image"></img>
										<div id="likeInfo">
											<p><b>${ k.sendLikeUserId }님이 ${ k.receiveLikeUserId }님의 활동을 좋아합니다.</b></p>
										</div>
									</div>
								</div>
								<br>
							</c:forEach>
							<c:forEach items="${ replyList }" var="r">
								<div id="squareBack">
									<div id="square">
										<img src="https://cdn-icons-png.flaticon.com/512/7579/7579706.png" 
											 alt="Image"></img>
										<div id="likeInfo">
											<p><b>${ r.likeUserId }님이 ${ r.writerUserId }님의 ${ r.clubName } 모임 댓글에 공감합니다.</b></p>
										</div>
									</div>
								</div>
								<br>	
							</c:forEach>
						</div>
					</div>		
					
			    	<h3><a id="saygoodbye">회원 탈퇴</a></h3>
			    	<br>
				<div class="line" style="border-left: 5px solid black"></div>
			
				</div>
			</span>
		</fieldset>
		
		
		<script>
			var notiBoards = document.getElementById('notiBoard');
		    var postBoards = document.getElementById('postBoard');
		    var likeBoards = document.getElementById('likeBoard');
		    
		    function notiBoard() {
		        // 모임 라디오 버튼을 클릭했을 때
		        notiBoards.style.display = "block";
		        postBoards.style.display = "none";
		        likeBoards.style.display = "none";
		    }

		    function postBoard() {
		        // 게시물 라디오 버튼을 클릭했을 때
		        notiBoards.style.display = "none";
		        postBoards.style.display = "block";
		        likeBoards.style.display = "none";
		    }
			
		    function likeBoard() {
		        // 게시물 라디오 버튼을 클릭했을 때
		        notiBoards.style.display = "none";
		        postBoards.style.display = "none";
		        likeBoards.style.display = "block";
		    }
		    
			 var bellScreen = document.getElementById("bell_screen");
			 bellScreen.style.display = "none";
			
			 function popUp() {
				// 메뉴창에 bell을 클릭했을 때
		        bellScreen.style.display = (bellScreen.style.display == "none") ? "block" : "none";
		   	}
			 
			// 회원 탈퇴 경고 메시지
	        const bye = document.getElementById('saygoodbye');
	        bye.addEventListener('click', () => {
	            if (confirm('정말로 탈퇴하시겠습니까?')) {
	            	window.location.href = "${ pageContext.servletContext.contextPath }/deleteMember.me";
	                alert('탈퇴되었습니다.');
	            }else {
			        alert('탈퇴가 취소되었습니다.');
		        }
	        });
		 
		</script>
	
</body>
</html>