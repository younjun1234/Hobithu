<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="resources/css/home.css?after">
</head>
<body>
	<c:set value="${ pageContext.servletContext.contextPath }" var="contextPath" scope="application"/>
	<div class="wrap" style="background: #e1e1e1;">
		<!-- 인트로 시작 -->
		<div class="intro_bg">
			<jsp:include page="/WEB-INF/views/common/selectNav.jsp"></jsp:include>
			<div class="intro_text">
				<h1>노는게 제일 좋아, 모여라 친구들</h1>
				<h4>뽀로로, 크롱, 에디, 로디, 루피, 패티, 포비, 해리</h4>
			</div>
		</div>
		<!-- 인트로 끝 -->

		<!-- 컨텐트 시작 -->
		<div class="content">
			<div class="content_intro">
				<div class="content_icon"></div>
				<div class="content_club">클럽</div>
			</div>
			<div class="content_text">
				<span>똑같은 일상을 다채롭게 만들어 줄 원데이 취향 모임</span>
			</div>
			<div class="content_cards">
				<!-- card 1 -->
				<c:forEach items="${ list }" var="club" varStatus="club_status">
					<div class="card">
						<input type="hidden" name="club_no" value="${ club.clubNo }">
						<div class="card_image"><img alt="" src="resources/uploadFiles/${ club.backgroundImage }"></div>
						<div class="card_info">
							<div class="card_icon">
								<div id="card_icon1">${ club.categoryName }</div>
								<div id="card_icon2">추천</div>
							</div>
							<div class="card_title" id="card_title1">${ club.clubName }</div>
							<div class="card_eta" id="card_eta1">${ club.addr }﹒<fmt:formatDate value="${ club.clubSchedule }" pattern="MM.dd(E) a hh:mm"></fmt:formatDate></div>
							<div class="card_capacity">
								<c:forEach items="${ mList }" var="mListRow" varStatus="row_status">
									<c:if test="${ club_status.index == row_status.index }">
										<c:forEach items="${ mListRow }" var="m">
											<div><img alt="" src="resources/uploadFiles/${ m.profile }"></div>
										</c:forEach>
										<div class="capacity">
											<div class="people_icon"></div>
											<div id="capacity1">${ mListRow.size() }/${ club.clubCapacity }</div>
										</div>
									</c:if>
								</c:forEach>
							</div>
						</div>
					</div>
				</c:forEach>
			</div>

			<div class="more">
				<div><a href="${ contextPath }/search.bo">더보기</a></div>
				<div class="more_icon"></div>
			</div>
		</div>
		<!-- 컨텐트 끝 -->

		<!-- footer 시작 -->
		<hr>
		<div class="footer">
			<div class="info_navigation">
				<div class="info_content">
					<p>이용약관｜ 개인정보처리방침｜ 인재 채용 문의｜ 구인</p>
				</div>
				<div class="info_top"></div>
			</div>
			<br>
			<p>호비드 주식회사 | 사업자등록번호 : 123-12-12345 | 서울 강남 제1234-12호</p>
			<p>
				조장 : 곽하은 | 조원: 김연준, 황유경, 박성운, 오선우, 윤아림 <br> 이메일 :
				hobithu@hobithu.kr | 대표번호 : 010-1234-1234 <br> 주소 : 서울시 강남구
				테헤란로 123 호비드빌딩 <br> 고객센터 : @카카오톡채널 | 운영 시간 : (월~일) 오전 11:00 ~
				오후 5:00 <br> <br>
			</p>
			<p>Copyright © 2023 Hobith All Right Reserved</p>
		</div>

		<!-- fixed -->
		<div class="add_image_container">
			<div class="add_image"></div>
		</div>
	</div>
	
 	<!-- <button onclick="kakaoLogin()" value="카카오 로그인">카카오로그인</button>
	
	<script src="https://developers.kakao.com/sdk/js/kakao.js"></script> -->
	<script>
/* 		 window.Kakao.init("9c62ca505829e0dd7e63dce27d3b4eae");
		
		function kakaoLogin() {
			window.Kakao.Auth.login({
				scope:'profile_nickname, profile_image',
				success: function(authObj) {
					console.log(authObj);
					window.Kakao.API.request({
						url: 'v2/user/me',
						success: res => {
							const kakao_account = res.kakao_account;
							console.log(kakao_account);
						}
					})
				}
			})
		}  */
		const add = document.getElementsByClassName('add_image_container')[0];
		add.addEventListener('click', () => {
			if(${ empty loginUser}) {
				alert("로그인 후에 사용해주세요.");
				window.location.href = "${ contextPath }/goToSignIn.me";
			} else {
				window.location.href = "${ contextPath }/selectCategory.bo";
			}
		})
		
		const toTop = document.getElementsByClassName('info_top')[0];
		toTop.addEventListener('click', () => {
			window.scrollTo(0, 0);
		})
		
		const cards = document.getElementsByClassName('card');
		for (const card of cards) {
			console.log(card);
			card.addEventListener('click', function () {
				const club_no = this.children[0].value;
				window.location.href = "${ contextPath }/viewBoard.bo?club_no=" + club_no;
			})
		}
	</script>
</body>
</html>