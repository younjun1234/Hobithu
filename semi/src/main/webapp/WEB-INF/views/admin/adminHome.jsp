<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<link href = "resources/css/indexstyle.css" rel = "stylesheet">
<c:set  var = "contextPath" value = "${pageContext.request.contextPath }" scope="application"/>
<style>
#timedate {
  font: small-caps lighter 43px/150% "Segoe UI", Frutiger, "Frutiger Linotype", "Dejavu Sans", "Helvetica Neue", Arial, sans-serif;
  font-size: 18px;
  position: absolute;
  top:0%;
  left: 500px;
  text-align:left;
  width: 10%;
  color: white;
}
.header_bar_menu a {
	color:gray;
	font-size: 15px;
	text-decoration: none;
}
</style>
</head>
<body onLoad="initClock()">

	<header>
		<div>
			<nav id="header_bar">
				<div>
				
					<span>
						<a href="${pageContext.request.contextPath}/"><img src="resources/img/logo.png"></a>
							<a href="${pageContext.request.contextPath}/" id="home"><span>ADMIN MANAGEMENT SYSTEM</span></a>
					</span>
						 <div id="timedate">
					    <a id="mon">January</a>
					    <a id="d">1</a>,
					    <a id="y">0</a><br />
					    <a id="h">12</a> :
					    <a id="m">00</a>:
					    <a id="s">00</a>:
					    <a id="mi">000</a>
					  </div>
					
					<span id="status">
						<span class="status">오늘 :${today}</span>
						<span class="status">어제 :${yesterday}</span>
						<span class="status">전체 :${total}</span>
					</span>
					<span class="header_bar_menu">
						<span>
							<a href="${ contextPath }/">메인화면</a>
						</span>
						<span>
							<a href="${ contextPath }/myPage.me">관리자 정보</a>
						</span>
						<span>
							<a href="${ contextPath }/logout.me">로그아웃</a>
						</span>
					</span>
				</div>
			</nav>
			<nav id="header_menu">
				<div>
					<a href = "${pageContext.request.contextPath}/member.me">
						<div class="header_menu_menu">
							회원관리
						</div>
					</a>
					<a href = "${contextPath}/board.bo">
						<div class="header_menu_menu">
							게시물 관리
						</div>
					</a>
					<a href = "${pageContext.request.contextPath}/customer.cu">
						<div class="header_menu_menu">
							고객지원
						</div>
					</a>
				</div>
			</nav>
		</div>
	</header>

	
	<article>
		<div>
			<section>
				<div>
					<span class="section_title">최근 회원가입</span>
					<br><br>
					<div id = "result">
					<table>
						<tr>
							<th>이름</th>
							<th>닉네임</th>
							<th>아이디</th>
							<th>가입일</th>
						</tr>
					<c:forEach items = "${mlist}" var = "m">
						<tr>
							<td>${m.userName}</td>
							<td>${m.nickName}</td>
							<td>${m.userId}</td>
							<td>${m.createDate}</td>
						</tr>
					</c:forEach>
					</table>
					</div>
					<a href = "${contextPath}/member.me" class = "barogagi" style = "position: absolute; top: 320px; right: 70px;">회원관리 바로가기</a>
				</div>
			</section>
			<section>
				<div>
					<span class="section_title">최근 게시물</span>
					<br><br>
					<table>
						<tr>
							<th>번호</th>
							<th>클럽명</th>
							<th>카테고리</th>
							<th>생성일</th>
						</tr>
					<c:forEach items = "${blist}" var = "b">
						<tr>
							<td>${b.clubNo}</td>
							<td>${b.clubName}</td>
							<td>${b.categoryName}</td>
							<td>${b.clubCreateDate}</td>
						</tr>
					</c:forEach>
					
					</table>
					
					<a href = "${contextPath}/adminBoard.ad" class = "barogagi">게시물관리 바로가기</a>
				</div>
			</section>
			<section>
				<div>
					<span class="section_title">최근 알림</span>
					<br><br>
					<table>
						<tr>
							<th>번호</th>
							<th>클럽명</th>
							<th>카테고리</th>
							<th>생성일</th>
						</tr>
					<c:forEach items = "${alist}" var = "a">
						<tr>
							<td>${a.noticeNo}</td>
							<td>${a.noticeTitle}</td>
							<td>${a.noticeContent}</td>
							<td>${a.noticeDate}</td>
						</tr>
					</c:forEach>
					
					</table>
					<a href = "${contextPath}/customer.cu" class = "barogagi">고객지원 바로가기</a>
				</div>
			</section>
		</div>
	</article>
	<footer>
		<div>
			<div>
				All right reserved 하비드
			</div>
		</div>
	</footer>
	
	<script>
	
	Number.prototype.pad = function(n) {
		  for (var r = this.toString(); r.length < n; r = 0 + r);
		  return r;
		};

		function updateClock() {
		  var now = new Date();
		  var milli = now.getMilliseconds(),
		    sec = now.getSeconds(),
		    min = now.getMinutes(),
		    hou = now.getHours(),
		    mo = now.getMonth(),
		    dy = now.getDate(),
		    yr = now.getFullYear();
		  var months = ["January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"];
		  var tags = ["mon", "d", "y", "h", "m", "s", "mi"],
		    corr = [months[mo], dy, yr, hou.pad(2), min.pad(2), sec.pad(2), milli];
		  for (var i = 0; i < tags.length; i++)
		    document.getElementById(tags[i]).firstChild.nodeValue = corr[i];
		}

		function initClock() {
		  updateClock();
		  window.setInterval("updateClock()", 1);
		}	
	
	
	</script>
</body>

</html>