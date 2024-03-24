<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<c:set var = "contextPath" value = "${pageContext.request.contextPath }"/>
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
    
    
 #lastman{
 border: none;
	cursor: pointer;
	width: 80px;
	height: 30px;
	background-color: #555;
	color: white;
	position: absolute;
	top:370px;
	right:100px; 
 
 }
    


</style>
</head>
<body onLoad="initClock()">
	<header>
		<div>
			<nav id="header_bar">
				<div>
					<span> 
						<a href="${contextPath}">
							<img src="${contextPath}/resources/img/logo.png">
						</a>
						<a href="${contextPath}" id="home">
						<span>ADMIN MANAGEMENT SYSTEM</span>
						</a>
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
						<span> <a href="">메인화면</a></span> 
					<span><a href="">관리자 정보</a></span> 
					<span><a href="">로그아웃</a></span>
					</span>
				</div>
			</nav>
			<nav id="header_menu">
				<div>
					<a href="${contextPath}/adminMember.ad">
						<div class="header_menu_menu">회원관리</div>
					</a> 
					<a href = "${contextPath}/adminBoard.ad">
						<div class="header_menu_menu" style ="background-color: white !important; color: black !important;">게시물 관리</div>
					</a> 
					<a href = "${contextPath}/adminCustomer.ad">
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
					<a style = "color: red; font-weight: 900;"><em> 회원검색</em></a>
				</dd>
				<dd>
					<a>카테고리 관리</a>
				</dd>
				<dd>
					
				</dd>
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
				<h2>모임 검색</h2>
				<hr>
			</div>


	<section class="notice">
    <div id="filter">
        <div id="filter_title">
            <br><br><br><br>필터검색
        </div>
        <div class="filter_kind" style= "position: absolute; left: 217px; top: 167px; margin-left: 0px; margin-top:0px; padding: 0px; ">
            <form id = "largeform">
            	<table id = "largefilter">
            		<tr>
				<td><button class = "large  ${CLUB_CATEGORY_KIND == '문화예술' ? 'selected' : 'unselected'}" type ="button">ART</button></td>				
				<td><button class = "large ${CLUB_CATEGORY_KIND == '액티비티' ? 'selected' : 'unselected'}" type ="button">EXERCISE</button></td>				
				<td><button class = "large ${CLUB_CATEGORY_KIND == '푸드드링크' ? 'selected' : 'unselected'}" type ="button">FOOD</button></td>				
				<td><button class = "large ${CLUB_CATEGORY_KIND == '취미' ? 'selected' : 'unselected'}" type ="button">HOBBY</button></td>				
				<td><button class = "large ${CLUB_CATEGORY_KIND == '파티소개팅' ? 'selected' : 'unselected'}" type ="button">PARTY</button></td>				
				<td><button  class = "large ${CLUB_CATEGORY_KIND == '여행동행' ? 'selected' : 'unselected'}" type ="button">TRAVEL</button></td>				
				<td><button class = "large ${CLUB_CATEGORY_KIND == '자기계발' ? 'selected' : 'unselected'}" type ="button">DEVELOP</button></td>				
				<td><button  class = "large ${CLUB_CATEGORY_KIND == '동네친목' ? 'selected' : 'unselected'}" type ="button">COUNTRY</button></td>				
				<td><button  class = "large ${CLUB_CATEGORY_KIND == '재테크' ? 'selected' : 'unselected'}" type ="button">INVESTMENT</button></td>				
				<td><button  class = "large ${CLUB_CATEGORY_KIND == '외국어' ? 'selected' : 'unselected'}" type ="button">LANGUAGE</button></td>
					</tr>
				</table>
				<br>
					<table>
					<tr>
						<c:forEach items = "${categorylist }" var = "clist">
							<td><input type = "checkbox" class = "clist" name = "categoryNames" id = "${clist.categoryName}" value = "${clist.categoryName}"><label for = "${clist.categoryName}">${clist.categoryName}</label>
							</td>
						</c:forEach>
					</tr>
					</table>
            </form>
        </div>
    </div>
    <div style ="text-align: center;">
    <button id = "submitfilter" type = "button">검색</button>
     <button id = "resetfilter" type = "button">초기화</button>
     </div>
</section>

<section>
    <div>
      <div id="boardlist" class="photo-board">
    <c:forEach items="${list}" var="b" varStatus="loop">
        <c:if test="${loop.index % 3 == 0}">
            <div class="board-row">
        </c:if>

        <div class="board-item" style = "cursor: pointer;" onclick = "location.href = '${contextPath}/adminDetail.ad?CLUB_NO=${b.clubNo}&page=${pi.currentPage}'">
            <img src="${contextPath}/resources/uploadFiles/${b.backgroundImage}" alt="Club Image">
            <div class="board-details">
                <p>${b.clubName}</p>
                <p>${b.clubCreateDate}</p>
            </div>
        </div>

        <c:if test="${loop.index % 3 == 2 or loop.last}">
            </div>
        </c:if>
    </c:forEach>
</div>

	


        <c:url value="board.bo" var="backlist">
            <c:param name="page" value="${pi.currentPage - 1}"/>
            <c:param name = "CATEGORY_NAME" value = "cate"/>
        </c:url>
        <a href="${backlist}">이전</a>

        <c:forEach begin="${pi.startPage}" end="${pi.endPage}" var="p">
            <c:url var="goNum" value="board.bo">
                <c:param name="page" value="${p}" />
                <c:param name = "categoryNames" value = "${categoryNames}"/>
            </c:url>
            <a class="page-link ${p == pi.currentPage ? 'current-page' : ''}"  href="${goNum}">
            	 <span class="${p == pi.currentPage ? 'current-page' : ''}">${p}</span>
            </a>
        </c:forEach>

        <c:url value="board.bo" var="forwardlist">
            <c:param name="page" value="${pi.currentPage + 1}"></c:param>
            <c:param name = "categoryNames" value = "${categoryNames}"/>
        </c:url>
        <a href="${forwardlist}">다음</a>
    </div>
    <button type = "button" id = "lastman" onclick = "location.href = '${contextPath}/insertBoardview.bo?'">모임추가</button>
</section>
		
	</main>
	
	
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
		
	
		//소분류 나타내기 스크립트
		const trs = document.getElementById('largefilter').querySelectorAll('tr');
		let tds = trs[0].querySelectorAll('td');
		let largeform = document.getElementById('largeform');
		
		for(let td of tds){
			td.addEventListener('click', ()=>{
				
				
				
				
				let hiddenInput = document.createElement("input");

	            hiddenInput.type = "hidden";

	            hiddenInput.name = "CLUB_CATEGORY_KIND";

	            hiddenInput.value = td.innerText.toLowerCase();
				
	            largeform.appendChild(hiddenInput);
				
	            largeform.action = "${contextPath}/adminCategory.ad";
	            largeform.submit();
				
				
			});
		}
		
		
		
		//검색 스크립트
		document.getElementById('submitfilter').addEventListener('click', ()=>{
			
			
			let checkboxes = document.querySelectorAll('input[name="categoryNames"]:checked');
			
			
			
// 			 checkboxes.forEach(function(checkbox) {
// 				 let hiddenInputcheck = document.createElement('input');
// 				 hiddenInputcheck.type = 'hidden';
// 				 hiddenInputcheck.name = 'CATEGORY_NAME[]'; // Use an array to pass multiple values
// 				 hiddenInputcheck.value = checkbox.value;
// 				 console.log(hiddenInputcheck);
// 				 largeform.appendChild(hiddenInputcheck);
// 		        });

			 
			largeform.action = "${contextPath}/adminBoard.ad";
			largeform.submit();
			
			
		});
		
		
	</script>
</body>
</html>