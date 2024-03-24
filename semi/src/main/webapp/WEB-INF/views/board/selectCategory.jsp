<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<script src="http://code.jquery.com/jquery-3.7.1.min.js"></script>
<link rel="stylesheet" href="resources/css/selectCategory.css?after">
</head>
<body>
	<div class="wrap">
		<jsp:include page="../common/selectNav.jsp"></jsp:include>
		<hr>
		<!-- content start -->
		<div class="content">
		<form action="${ contextPath }/selectTitleContent.bo" method="post">
			<!-- content header -->
			<div class="btn_cont">
				<a href="javascript:history.back()">
					<div>
						<img src="resources/img/back_page.png">
						<div>BACK</div>
					</div>
				</a> 
				<div id="next_btn">
					<div>NEXT</div>
					<img src="resources/img/next_page.png">
				</div>
			</div>
			<div class="content_intro">소셜링 주제를 선택해볼까요?</div>

			<!-- category card 1 -->
			<div class="category_card">

				<div class="main_category">
					<img src="resources/img/theater.png">
					<div class="category_info">
						<div class="cateogy_text">문화﹒예술</div>
						<div class="category_detail">전시﹒영화﹒뮤지컬﹒공연﹒박물관﹒연극</div>
					</div>
					<div class="show">
						<img src="resources/img/down.png">
					</div>
				</div>

				<!-- show hidden unless .show clicked -->
				<div class="sub_category">
					<input type="radio" id="r1" name="category" value="전시"><label for="r1">전시</label>
					<input type="radio" id="r2" name="category" value="영화"><label for="r2">영화</label>
					<input type="radio" id="r3" name="category" value="연극"><label for="r3">연극</label>
					<input type="radio" id="r4" name="category" value="공연"><label for="r4">공연</label>
					<input type="radio" id="r5" name="category" value="뮤지컬"><label for="r5">뮤지컬</label>
					<input type="radio" id="r6" name="category" value="콘서트"><label for="r6">콘서트</label>
					<input type="radio" id="r7" name="category" value="페스티벌"><label for="r7">페스티벌</label>
					<input type="radio" id="r8" name="category" value="연주회"><label for="r8">연주회</label>

				</div>
			</div>
			<!-- category card 2 -->
			<div class="category_card">

				<div class="main_category">
					<img src="resources/img/smartwatch.png">
					<div class="category_info">
						<div class="cateogy_text">액티비티</div>
						<div class="category_detail">러닝﹒등산﹒클라이밍﹒헬스﹒서핑﹒산책</div>
					</div>
					<div class="show">
						<img src="resources/img/down.png">
					</div>
				</div>

				<!-- show hidden unless .show clicked -->
				<div class="sub_category">
					<input type="radio" id="r9" name="category" value="등산"><label for="r9">등산</label>
					<input type="radio" id="r10" name="category" value="산책"><label for="r10">산책</label>
					<input type="radio" id="r11" name="category" value="다이어트"><label for="r11">다이어트</label>
					<input type="radio" id="r12" name="category" value="클라이밍"><label for="r12">클라이밍</label>
					<input type="radio" id="r13" name="category" value="배드민턴"><label for="r13">배드민턴</label>
					<input type="radio" id="r14" name="category" value="러닝"><label for="r14">러닝</label>
					<input type="radio" id="r15" name="category" value="헬스"><label for="r15">헬스</label>
					<input type="radio" id="r16" name="category" value="볼링"><label for="r16">볼링</label>
					<input type="radio" id="r17" name="category" value="요가"><label for="r17">요가</label>
					<input type="radio" id="r18" name="category" value="야구"><label for="r18">야구</label>
					<input type="radio" id="r19" name="category" value="필라테스"><label for="r19">필라테스</label>
					<input type="radio" id="r20" name="category" value="서핑"><label for="r20">서핑</label>
					<input type="radio" id="r21" name="category" value="축구"><label for="r21">축구</label>
					<input type="radio" id="r22" name="category" value="농구"><label for="r22">농구</label>
					<input type="radio" id="r23" name="category" value="수영"><label for="r23">수영</label>
					<input type="radio" id="r24" name="category" value="플로깅"><label for="r24">플로깅</label>
					<input type="radio" id="r25" name="category" value="다이빙"><label for="r25">다이빙</label>
					<input type="radio" id="r26" name="category" value="자전가"><label for="r26">자전거</label>
					<input type="radio" id="r27" name="category" value="골프"><label for="r27">골프</label>
					<input type="radio" id="r28" name="category" value="풋살"><label for="r28">풋살</label>
				</div>
			</div>
			<!-- category card 3 -->
			<div class="category_card">
				<div class="main_category">
					<img src="resources/img/fast-food.png">
					<div class="category_info">
						<div class="cateogy_text">푸드﹒드링크</div>
						<div class="category_detail">맛집투어﹒카페﹒디저트﹒티룸﹒와인﹒비건</div>
					</div>
					<div class="show">
						<img src="resources/img/down.png">
					</div>
				</div>

				<!-- show hidden unless .show clicked -->
				<div class="sub_category">
					<input type="radio" id="r29" name="category" value="맛집투어"><label for="r29">맛집투어</label>
					<input type="radio" id="r30" name="category" value="카페"><label for="r30">카페</label>
					<input type="radio" id="r31" name="category" value="요리"><label for="r31">요리</label>
					<input type="radio" id="r32" name="category" value="와인"><label for="r32">와인</label>
					<input type="radio" id="r33" name="category" value="맥주"><label for="r33">맥주</label>
					<input type="radio" id="r34" name="category" value="칵테일"><label for="r34">칵테일</label>
					<input type="radio" id="r35" name="category" value="위스키"><label for="r35">위스키</label>
					<input type="radio" id="r36" name="category" value="전통주"><label for="r36">전통주</label>
					<input type="radio" id="r37" name="category" value="커피"><label for="r37">커피</label>
					<input type="radio" id="r38" name="category" value="디저트"><label for="r38">디저트</label>
					<input type="radio" id="r39" name="category" value="페어링"><label for="r39">페어링</label>
					<input type="radio" id="r40" name="category" value="파인다이닝"><label for="r40">파인다이닝</label>
					<input type="radio" id="r41" name="category" value="티룸"><label for="r41">티룸</label>
					<input type="radio" id="r42" name="category" value="비건"><label for="r42">비건</label>
				</div>
			</div>
			<!-- category card 4 -->
			<div class="category_card">

				<div class="main_category">
					<img src="resources/img/chess-piece.png">
					<div class="category_info">
						<div class="cateogy_text">취미</div>
						<div class="category_detail">보드게임﹒방탈출﹒사진﹒댄스﹒연기﹒컬러링</div>
					</div>
					<div class="show">
						<img src="resources/img/down.png">
					</div>
				</div>

				<!-- show hidden unless .show clicked -->
				<div class="sub_category">
					<input type="radio" id="r43" name="category" value="보드게임"><label for="r43">보드게임</label>
					<input type="radio" id="r44" name="category" value="사진"><label for="r44">사진</label>
					<input type="radio" id="r45" name="category" value="공예"><label for="r45">공예</label>
					<input type="radio" id="r46" name="category" value="드로잉"><label for="r46">드로잉</label>
					<input type="radio" id="r47" name="category" value="댄스"><label for="r47">댄스</label>
					<input type="radio" id="r48" name="category" value="노래"><label for="r48">노래</label>
					<input type="radio" id="r49" name="category" value="방탈출"><label for="r49">방탈출</label>
					<input type="radio" id="r50" name="category" value="글쓰기"><label for="r50">글쓰기</label>
					<input type="radio" id="r51" name="category" value="봉사활동"><label for="r51">봉사활동</label>
					<input type="radio" id="r52" name="category" value="게임"><label for="r52">게임</label>
					<input type="radio" id="r53" name="category" value="악기연주"><label for="r53">악기연주</label>
					<input type="radio" id="r54" name="category" value="명상"><label for="r54">명상</label>
					<input type="radio" id="r55" name="category" value="음악감상"><label for="r55">음악감상</label>
					<input type="radio" id="r56" name="category" value="캘리그라피"><label for="r56">캘리그라피</label>
					<input type="radio" id="r57" name="category" value="반려동물"><label for="r57">반려동물</label>
					<input type="radio" id="r58" name="category" value="만화"><label for="r58">만화</label>
				</div>
			</div>
			<!-- category card 5 -->
			<div class="category_card">

				<div class="main_category">
					<img src="resources/img/party-popper.png">
					<div class="category_info">
						<div class="cateogy_text">파티﹒소개팅</div>
						<div class="category_detail">파티﹒소개팅</div>
					</div>
					<div class="show">
						<img src="resources/img/down.png">
					</div>
				</div>

				<!-- show hidden unless .show clicked -->
				<div class="sub_category">
					<input type="radio" id="r59" name="category" value="파티"><label for="r59">파티</label>
					<input type="radio" id="r60" name="category" value="소개팅"><label for="r60">소개팅</label>
				</div>
			</div>
			<!-- category card 6 -->
			<div class="category_card">

				<div class="main_category">
					<img src="resources/img/travel-luggage.png">
					<div class="category_info">
						<div class="cateogy_text">여행﹒동행</div>
						<div class="category_detail">복합문화공간﹒피크닉﹒드라이브﹒캠핑</div>
					</div>
					<div class="show">
						<img src="resources/img/down.png">
					</div>
				</div>

				<!-- show hidden unless .show clicked -->
				<div class="sub_category">
					<input type="radio" id="r61" name="category" value="국내여행"><label for="r61">국내여행</label>
					<input type="radio" id="r62" name="category" value="해외여행"><label for="r62">해외여행</label>
					<input type="radio" id="r63" name="category" value="캠핑"><label for="r63">캠핑</label>
					<input type="radio" id="r64" name="category" value="드라이브"><label for="r64">드라이브</label>
					<input type="radio" id="r65" name="category" value="피크닉"><label for="r65">피크닉</label>
					<input type="radio" id="r66" name="category" value="복합문화공간"><label for="r66">복합문화공간</label>
					<input type="radio" id="r67" name="category" value="테마파크"><label for="r67">테마파크</label>
				</div>
			</div>
			<!-- category card 7  -->
			<div class="category_card">

				<div class="main_category">
					<img src="resources/img/open-book.png">
					<div class="category_info">
						<div class="cateogy_text">자기계발</div>
						<div class="category_detail">습관만들기﹒스터디﹒커리어</div>
					</div>
					<div class="show">
						<img src="resources/img/down.png">
					</div>
				</div>

				<!-- show hidden unless .show clicked -->
				<div class="sub_category">
					<input type="radio" id="r68" name="category" value="독서"><label for="r68">독서</label>
					<input type="radio" id="r69" name="category" value="스터디"><label for="r69">스터디</label>
					<input type="radio" id="r70" name="category" value="대화"><label for="r70">대화</label>
					<input type="radio" id="r71" name="category" value="브랜딩"><label for="r71">브랜딩</label>
					<input type="radio" id="r72" name="category" value="커리어"><label for="r72">커리어</label>
					<input type="radio" id="r73" name="category" value="사이드프로젝트"><label for="r73">사이드프로젝트</label>
					<input type="radio" id="r74" name="category" value="창작"><label for="r74">창작</label>
				</div>
			</div>
			<!-- category card 8 -->
			<div class="category_card">

				<div class="main_category">
					<img src="resources/img/share.png">
					<div class="category_info">
						<div class="cateogy_text">동네﹒친목</div>
						<div class="category_detail">관심사﹒동네﹒또래</div>
					</div>
					<div class="show">
						<img src="resources/img/down.png">
					</div>
				</div>

				<!-- show hidden unless .show clicked -->
				<div class="sub_category">
					<input type="radio" id="r75" name="category" value="관심사"><label for="r75">관심사</label>
					<input type="radio" id="r76" name="category" value="동네"><label for="r76">동네</label>
					<input type="radio" id="r77" name="category" value="또래"><label for="r77">또래</label>
				</div>
			</div>
			<!-- category card 9  -->
			<div class="category_card">

				<div class="main_category">
					<img src="resources/img/savings.png">
					<div class="category_info">
						<div class="cateogy_text">재테크</div>
						<div class="category_detail">N잡﹒창업﹒부동산﹒주식﹒재테크</div>
					</div>
					<div class="show">
						<img src="resources/img/down.png">
					</div>
				</div>

				<!-- show hidden unless .show clicked -->
				<div class="sub_category">
					<input type="radio" id="r78" name="category" value="재테크"><label for="r78">재테크</label>
					<input type="radio" id="r79" name="category" value="N잡"><label for="r79">N잡</label>
					<input type="radio" id="r80" name="category" value="부동산"><label for="r80">부동산</label>
					<input type="radio" id="r81" name="category" value="창업"><label for="r81">창업</label>
					<input type="radio" id="r82" name="category" value="주식"><label for="r82">주식</label>
				</div>
			</div>
			<!-- category card 10 -->
			<div class="category_card">

				<div class="main_category">
					<img src="resources/img/translation.png">
					<div class="category_info">
						<div class="cateogy_text">외국어</div>
						<div class="category_detail">영어﹒중국어﹒일본어﹒언어교환</div>
					</div>
					<div class="show">
						<img src="resources/img/down.png">
					</div>
				</div>

				<!-- show hidden unless .show clicked -->
				<div class="sub_category">
					<input type="radio" id="r83" name="category" value="영어"><label for="r83">영어</label>
					<input type="radio" id="r84" name="category" value="언어교환"><label for="r84">언어교환</label>
					<input type="radio" id="r85" name="category" value="일본어"><label for="r85">일본어</label>
					<input type="radio" id="r86" name="category" value="중국어"><label for="r86">중국어</label>
				</div>
			</div>
		</form>
		</div>
	</div>
	  
	<script>
        window.onload = () => {
            
            $(".main_category").click(function() {
                const categories = $(".category_card");
                for(const category of categories) {
                    if (category != $(this).parent()[0]) {
                        $(category.children[1]).slideUp();
                    } else {
                        $(this).next().slideToggle();
                    }
                }
            });
			
            $("#next_btn").click(function() {
            	const form = document.querySelector('form');
            	const checked = document.querySelector('input[type=radio]:checked');
            	if(checked != null) {
	            	form.submit();
            	} else {
            		alert("취미를 선택해주세요");
            	}
            })
        }
    </script>
</body>
</html>