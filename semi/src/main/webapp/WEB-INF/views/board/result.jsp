<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="resources/css/result.css?after" rel="stylesheet" type="text/css">
</head>
<body>

	<div class="intro_bg">
		<jsp:include page="/WEB-INF/views/common/selectNav.jsp"></jsp:include>
	</div>
	
	
	<hr>
		
	<div class="main">
					
		<div class="inmain"><img src="resources/img/search.png" width="70px" height="70px"></div>
		<br>
		<div class="inmain"><h1>검색하진 조건의 모임들입니다</h1> </div>
		<br>
		<div class="inmain"><h3>원하는 모임에서 새로운 만남을 가져보세요!</h3></div>
	</div>
	
	<div class="content_cards">
		<!-- card 1 -->
		<c:forEach items="${ list }" var="club" varStatus="club_status">
			<div class="card">
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
</body>
</html>