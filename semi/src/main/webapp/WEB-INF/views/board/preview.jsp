<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>사용자 참가 게시판</title>
<link rel="stylesheet" type="text/css" href="resources/css/preview.css?after">
</head>
<body>
	<div class="wrap">
			<div class="intro">
				<div class="intro_bg">
					<jsp:include page="/WEB-INF/views/common/selectNav.jsp"></jsp:include>
  				</div>
			<div class="bg"></div>	
				<form action="${ contextPath }/insertClub.bo" method="post">
					<div class="intro_button">
						<input type="hidden" name="categoryName" value="${ category }">
		            	<input type="hidden" name="clubName" value="${ club.clubName }">
		            	<input type="hidden" name="content" value="${ club.content }">
		           		<input type="hidden" name="clubScheduleOG" value="${ club.clubSchedule }">
		            	<input type="hidden" name="backgroundImage" value="${ club.backgroundImage }">
		            	<input type="hidden" name="onlineYN" value="${ club.onlineYN }">
		            	<input type="hidden" name="clubAccess" value="${ club.clubAccess }">
		        	    <input type="hidden" name="addr" value="${ club.addr }">
		        	    <input type="hidden" name="ageRange" value="${ club.ageRange }">
		        	    <input type="hidden" name="selectGender" value="${ club.selectGender }">
		        	    <input type="hidden" name="paymentYN" value="${ club.paymentYN }">
		        	    <input type="hidden" name="clubCapacity" value="${ club.clubCapacity }">
		        	    <input type="hidden" name="creator" value="${ loginUser.userNo }">
						<button class="out">등록하기</button>
					</div>
				</form>
			</div>
			
			<div class="content">
				<div class="content_header">
					<div class="content_img"><img alt="" src="resources/uploadFiles/${ loginUser.profile }"></div>
					<div class="content_title_writer">
						<div class="title">${ club.clubName }</div>
						<div class="writer">호스트 ${ loginUser.nickName }</div>
					</div>
				</div>
				<div class="write_content">
					${ club.content }
				</div>
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
			</div><!--'2. 내용'의 div 닫음-->
		</div><!--'class="wrap"'의 div 닫음-->
		
		<script>
			
		</script>
			
</body>
</html>