<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="resources/css/selectNav.css">
</head>
<body>
	<c:set value="${ pageContext.servletContext.contextPath }" var="contextPath" scope="application" />
	<!-- header start -->
	<div class="header">
		<div class="nav_bar">
			<ul>
				<li><a href="${ contextPath }/">HOME</a></li>
				<li><a href="${ contextPath }/search.bo">SEARCH</a></li>
				<li><a href="${ contextPath }/notice.bo">NOTICE</a></li>
			</ul>
		</div>
		<c:if test="${ empty loginUser }">
			<div class="profile">
				<a href="${ contextPath }/signUp.me">SIGN UP</a>
			</div>
			<div class="login">
				<a href="${ contextPath }/goToSignIn.me">SIGN IN</a>
			</div>
		</c:if>
		<c:if test="${ !empty loginUser }">
			<c:if test="${ loginUser.isAdmin == 'Y' }">
				<div class="profile">
					<a href="${ contextPath }/admin.ad">ADMIN</a>
				</div>
			</c:if>
			<c:if test="${ loginUser.isAdmin == 'N' }">
				<div class="profile">
					<a href="${ contextPath }/myPage.me">PROFILE</a>
				</div>
			</c:if>
			<div class="login">
				<a href="${ contextPath }/logout.me">LOGOUT</a>
			</div>
		</c:if>
	</div>
	<!-- header end -->
</body>
</html>