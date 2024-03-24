<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<c:set var="contextPath" value="${pageContext.request.contextPath }" />
<link href="${contextPath}/resources/css/boardstyle.css"
	rel="stylesheet">
<script src="${contextPath}/resources/js/jquery-3.7.1.min.js"></script>

<style>
.header_bar_menu a {
	color: gray;
	font-size: 15px;
	text-decoration: none;
}

section {
	display: flex;
	flex-direction: column;
	align-items: center;
	text-align: center;
}

.w-100{
border: none;
	cursor: pointer;
	width: 80px;
	height: 30px;
	background-color: #555;
	color: white;

}

.w-101{
    border: none;
    cursor: pointer;
    width: 80px;
    height: 30px;
    background-color: lightgray;

}



</style>
</head>
<body onLoad="initClock()">
	<header>
		<div>
			<nav id="header_bar">
				<div>
					<span> <a href="${contextPath}"> <img
							src="${contextPath}/resources/img/logo.png">
					</a> <a href="${contextPath}" id="home"> <span>ADMIN
								MANAGEMENT SYSTEM</span>
					</a>
					</span>

					<div id="timedate">
						<a id="mon">January</a> <a id="d">1</a>, <a id="y">0</a><br /> <a
							id="h">12</a> : <a id="m">00</a>: <a id="s">00</a>: <a id="mi">000</a>
					</div>
					<span id="status"> <span class="status">오늘 :${today}</span>
						<span class="status">어제 :${yesterday}</span> <span class="status">전체
							:${total}</span>
					</span> <span class="header_bar_menu"> <span> <a href="">메인화면</a></span>
						<span><a href="">관리자 정보</a></span> <span><a href="">로그아웃</a></span>
					</span>
				</div>
			</nav>
			<nav id="header_menu">
				<div>
					<a href="${contextPath}/member.me">
						<div class="header_menu_menu">회원관리</div>
					</a> <a href="${contextPath}/board.bo">
						<div class="header_menu_menu">게시물 관리</div>
					</a> <a href="${contextPath}/customer.cu">
						<div class="header_menu_menu">고객지원</div>
					</a>
				</div>
			</nav>
		</div>
	</header>

	<aside>
		<div id="aside_logo">
			<img src="${contextPath }/resources/img/customer.png"><br>
			게시물 관리
		</div>
		<div id="asidemenudiv">
			<dl>
				<dt class="asidemenu">모임 관리</dt>
				<dd>
					<a style="color: red; font-weight: 900;"><em> 회원검색</em></a>
				</dd>
				<dd>
					<a>카테고리 관리</a>
				</dd>
				<dd></dd>
				<dt class="asidemenu">게시판 관리</dt>
				<dd>
					<a>댓글관리</a>
				</dd>
			</dl>
		</div>
	</aside>
	<main>
		<div>
			<div id="breadcrum">
				홈>고객지원>신고 관리 <a href="${loc}">클</a>
			</div>
			<div id="main_title">
				<h2>모임 상세</h2>
				<hr>
			</div>
		</div>

		<section>

			<form action = "${contextPath}/adminUpdateBoard.ad" id = "boardForm" method="POST" enctype = "multipart/form-data">
			<fieldset style = "position: absolute; top: 150px; right: 510px; width: 800px;">
			<input type = "hidden" name = "clubNo" value = "${b.clubNo }">
			<input type = "hidden" name = "page" value = "${page}">
			<input type = "hidden" name = "backgroundImage" value = "${b.backgroundImage}">
			<div
				style="margin-top: 100px; text-align: center; height: 500px; display: flex; flex-direction: column; align-items: center; justify-content: center;">
				<img
					src="${contextPath}/resources/uploadFiles/${b.backgroundImage}"
					alt="Club Image"
					style="max-width: 100%; max-height: 100%; object-fit: contain; max-width: 100%; max-height: 100%;">
				</fieldset>
				<div class="board-details">
				<fieldset style = "position: absolute; top: 150px; right: 60px; height: 600px;">
				<table>
				<br><br><br><br><br><br><br><br><br>
				<tr>
					<td>모임명</td>
					<td><input type = "text"  name = "clubName" value = "${b.clubName}"></td>
					</tr>
					<tr><td><br><br></td></tr>
					<tr>
						<td>모임내용</td>
						<td><input type = "text" name = "content" value = "${b.content}"></td>
					</tr>
					<tr><td><br><br></td></tr>
					<tr>
					
						<td>모임이미지</td>
						<td><input type = "file" name = "file"></td>
					</tr>
				
					<tr><td><br><br><br><br><br><br><br><br><br><br></td></tr>
						<tr>
					<td><button class="w-100 btn btn-success btn-lg" id = "submitBoard" type = "button">수정하기</button></td>
					<td><button class="w-101 btn btn-success btn-lg" id = "deleteBoard" type = "button">삭제하기</button></td>
					</tr>
					</table>
					</fieldset>
				</div>	
					

<!-- 				<button type="button" class="w-25 btn btn-outline-success" -->
<!-- 					id="addFile">+파일추가</button> -->
						
					
					
				</form>
		</section>
	
	</main>


	<footer>
		<div>
			<div>All right reserved 하비드</div>
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


		
// 		const fileArea = document.querySelector('#fileArea');
// 		document.getElementById('addFile').addEventListener('click', ()=>{
// 			const newDiv = document.createElement('div');
// 			newDiv.classList.add('mb-3');
// 			newDiv.innerHTML = '<input type = "file" class = "form-control form-control-lg" name = "file">';
			
// 			fileArea.append(newDiv);
// 		});
		
		
		
		
		
		
		
		
		//수정된 파일목록 넘기는 스크립트
		const form = document.getElementById('boardForm');
		document.getElementById('submitBoard').addEventListener('click', ()=>{
		
			//파일 인풋에 파일이 안들어가있는지 검사
			const files = document.getElementsByName('file');
			
			let isEmpty = true;
			for(const f of files){
				if(f.values != ''){
					isEmpty = false;
				}
			}
			
			// 삭제 버튼이 눌려져 있는지 검사
// 			let isAllRemove = true;
// 			for(const btn of delBtns){
// 				if(btn.innerText == '삭제 OFF'){
// 					isAllRemove = false;
// 				}
				
// 			}
			if(isEmpty){
				alert('파일을 넣어주세요')
			}else{
				if(confirm('정말 수정하시겠습니까?')){
				form.submit();
				}
			}
			
		});
		
		
		
		//삭제 버튼 스크립트
		document.getElementById('deleteBoard').addEventListener('click',()=>{
			if(confirm('정말 삭제하시겠습니까?')){
			form.action = '${contextPath}/adminDeleteBoard.ad';
			form.submit();
			}
		})
		
			
			
		
		
		
		
		
		
	
		
		
	</script>
</body>
</html>