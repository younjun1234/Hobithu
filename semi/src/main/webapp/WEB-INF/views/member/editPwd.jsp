<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="resources/css/editPwd.css" rel="stylesheet" type="text/css">
</head>
<body>
		<!-- header start -->
		<div class="header">
			<div class="nav_bar">
				<ul>
					<li><a href="${ contextPath }/">HOME</a></li>
					<li><a href="${ contextPath }/search.bo">SEARCH</a></li>
					<li><a href="${ contextPath }/about.do">ABOUT</a></li>
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
				<div class="profile">
					<a href="${ contextPath }/myPage.me">PROFILE</a>
				</div>
				<div class="login">
					<a href="${ contextPath }/logout.me">LOGOUT</a>
				</div>
			</c:if>
		</div>
	<!-- header end -->
			
		<!-- 비밀번호 변경란 -->	
		<form action="${ contextPath }/updatePassword.me" method="post">
		
		<div id="border" class="passwordList" style="width: 600px; height: 600px;">
		<h2 id="edit">Edit My Password</h2>
		<h5 id="edit">비밀번호는 주기적으로 변경해주시기 바랍니다.</h5>
			<div>
				<p id="textA"><b>현재 비밀번호</b></p>
				<input type="password" id="nowPassword" class="passwordList" name="currnetPwd" required>
			</div>
			<br><br>
			<div>
				<p id="textB"><b>새 비밀번호</b></p>
				<input type="password" id="newPassword" class="passwordList" name="newPwd" placeholder="영문/숫자/특수기호를 사용하여 10~16자리로 입력해주세요" required>
			</div>
			<br><br>
			<div>
				<p id="textC"><b>새 비밀번호 확인</b></p>
				<input type="password" id="newPassword_confirm" class="passwordList" name="newPwd_confirm" placeholder="비밀번호를 다시 입력해주세요" required>
			</div>
			<br><br>
			<input type="submit" id="submit" value="확인" onclick="password_confirm(event)">
			
		</div>
		
	</form>
	
	<script>
	 function password_confirm(event) {
	    var newPwd = document.getElementById("newPassword").value;
	    var newPwd_confirm = document.getElementById("newPassword_confirm").value;
	    const submitButton = document.getElementById('submit');

	    if (newPwd !== newPwd_confirm) {
	        alert('비밀번호가 일치하지 않습니다. 다시 확인해주세요');
	        event.preventDefault(); // 폼의 기본 동작 막음
	        return false;
	    } else {
	        submitButton.addEventListener('click', function() {
	            if (confirm('비밀번호를 수정하시겠습니까?')) {
	                // 수정 처리 로직을 여기에 추가
	                alert('수정 완료되었습니다. 다시 로그인해주세요.'); // 예시 메시지, 실제 수정 로직을 추가하세요.
	            } else {
	                // Optional: "취소"를 클릭했을 때의 동작
	                alert('수정에 실패하였습니다.');
	            }
	        });
	    }

	    return true;
	} 
		
	</script>	
	
</body>
</html>