<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>취미 선택</title>
    <link href="resources/css/hobby.css" rel="stylesheet">
</head>
<body>
    <div class="logo_area">
        <img src="resources/img/hobithu.png">
    </div>
    <div class="content">
        <form action="insert.me" method="post" onsubmit="return test()">
            <div class="content">
            	<input type="hidden" value="${ m.userId }" name="userId">
            	<input type="hidden" value="${ m.userName }" name="userName">
            	<input type="hidden" value="${ m.userPwd }" name="userPwd">
            	<input type="hidden" value="${ m.email }" name="email">
            	<input type="hidden" value="${ m.gender }" name="gender">
            	<input type="hidden" value="${ m.nickName }" name="nickName">
            	<input type="hidden" value="${ m.birthDate }" id="birth" name="birthDate">
            	<input type="date" id="birthDate" name="birthDate" style="display:none;">
                <div class="content_intro">관심 주제 3개를 선택해주세요!</div>
    			
                <!-- category card 1 -->
                <div class="category_card">
    
                    <div class="main_category">
                        <img src="resources/img/theater.png">
                        <div class="category_info">
                            <div class="cateogy_text">문화﹒예술</div>
                            <div class="category_detail">전시﹒영화﹒뮤지컬﹒공연﹒박물관﹒연극</div>
                        </div>
                        <div class="show"><img src="resources/img/down.png"></div>
                    </div>
    
                    <!-- show hidden unless .show clicked -->
                    <div class="sub_category">
                        <input type="radio" id="r1" value="r1" name="select" value=><label for="r1">전시</label>
                        <input type="radio" id="r2" value="r2" name="select"><label for="r2">영화</label>
                        <input type="radio" id="r3" value="r3" name="select"><label for="r3">연극</label>
                        <input type="radio" id="r4" value="r4" name="select"><label for="r4">공연</label>
                        <input type="radio" id="r5" value="r5" name="select"><label for="r5">뮤지컬</label>
                        <input type="radio" id="r6" value="r6" name="select"><label for="r6">콘서트</label>
                        <input type="radio" id="r7" value="r7" name="select"><label for="r7">페스티벌</label>
                        <input type="radio" id="r8" value="r8" name="select"><label for="r8">연주회</label>
                        
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
                        <div class="show"><img src="resources/img/down.png"></div>
                    </div>
    
                    <!-- show hidden unless .show clicked -->
                    <div class="sub_category">
                        <input type="radio" id="r9" name="select" value="r9"><label for="r9">등산</label>
                        <input type="radio" id="r10" name="select" value="r10"><label for="r10">산책</label>
                        <input type="radio" id="r11" name="select" value="r11"><label for="r11">다이어트</label>
                        <input type="radio" id="r12" name="select" value="r12"><label for="r12">클라이밍</label>
                        <input type="radio" id="r13" name="select" value="r13"><label for="r13">배드민턴</label>
                        <input type="radio" id="r14" name="select" value="r14"><label for="r14">러닝</label>
                        <input type="radio" id="r15" name="select" value="r15"><label for="r15">헬스</label>
                        <input type="radio" id="r16" name="select" value="r16"><label for="r16">볼링</label>
                        <input type="radio" id="r17" name="select" value="r17"><label for="r17">요가</label>
                        <input type="radio" id="r18" name="select" value="r18"><label for="r18">야구</label>
                        <input type="radio" id="r19" name="select" value="r19"><label for="r19">필라테스</label>
                        <input type="radio" id="r20" name="select" value="r20"><label for="r20">서핑</label>
                        <input type="radio" id="r21" name="select" value="r21"><label for="r21">축구</label>
                        <input type="radio" id="r22" name="select" value="r22"><label for="r22">농구</label>
                        <input type="radio" id="r23" name="select" value="r23"><label for="r23">수영</label>
                        <input type="radio" id="r24" name="select" value="r24"><label for="r24">플로깅</label>
                        <input type="radio" id="r25" name="select" value="r25"><label for="r25">다이빙</label>
                        <input type="radio" id="r26" name="select" value="r26"><label for="r26">자전거</label>
                        <input type="radio" id="r27" name="select" value="r27"><label for="r27">골프</label>
                        <input type="radio" id="r28" name="select" value="r28"><label for="r28">풋살</label>
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
                        <div class="show"><img src="resources/img/down.png"></div>
                    </div>
    
                    <!-- show hidden unless .show clicked -->
                    <div class="sub_category">
                        <input type="radio" id="r29" name="select" value="r29"><label for="r29">맛집투어</label>
                        <input type="radio" id="r30" name="select" value="r30"><label for="r30">카페</label>
                        <input type="radio" id="r31" name="select" value="r31"><label for="r31">요리</label>
                        <input type="radio" id="r32" name="select" value="r32"><label for="r32">와인</label>
                        <input type="radio" id="r33" name="select" value="r33"><label for="r33">맥주</label>
                        <input type="radio" id="r34" name="select" value="r34"><label for="r34">칵테일</label>
                        <input type="radio" id="r35" name="select" value="r35"><label for="r35">위스키</label>
                        <input type="radio" id="r36" name="select" value="r36"><label for="r36">전통주</label>
                        <input type="radio" id="r37" name="select" value="r37"><label for="r37">커피</label>
                        <input type="radio" id="r38" name="select" value="r38"><label for="r38">디저트</label>
                        <input type="radio" id="r39" name="select" value="r39"><label for="r39">페어링</label>
                        <input type="radio" id="r40" name="select" value="r40"><label for="r40">파인다이닝</label>
                        <input type="radio" id="r41" name="select" value="r41"><label for="r41">티룸</label>
                        <input type="radio" id="r42" name="select" value="r42"><label for="r42">비건</label>
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
                        <div class="show"><img src="resources/img/down.png"></div>
                    </div>
    
                    <!-- show hidden unless .show clicked -->
                    <div class="sub_category">
                        <input type="radio" id="r43" name="select" value="r43"><label for="r43">보드게임</label>
                        <input type="radio" id="r44" name="select" value="r44"><label for="r44">사진</label>
                        <input type="radio" id="r45" name="select" value="r45"><label for="r45">공예</label>
                        <input type="radio" id="r46" name="select" value="r46"><label for="r46">드로잉</label>
                        <input type="radio" id="r47" name="select" value="r47"><label for="r47">댄스</label>
                        <input type="radio" id="r48" name="select" value="r48"><label for="r48">노래</label>
                        <input type="radio" id="r49" name="select" value="r49"><label for="r49">방탈출</label>
                        <input type="radio" id="r50" name="select" value="r50"><label for="r50">글쓰기</label>
                        <input type="radio" id="r51" name="select" value="r51"><label for="r51">봉사활동</label>
                        <input type="radio" id="r52" name="select" value="r52"><label for="r52">게임</label>
                        <input type="radio" id="r53" name="select" value="r53"><label for="r53">악기연주</label>
                        <input type="radio" id="r54" name="select" value="r54"><label for="r54">명상</label>
                        <input type="radio" id="r55" name="select" value="r55"><label for="r55">음악감상</label>
                        <input type="radio" id="r56" name="select" value="r56"><label for="r56">캘리그라피</label>
                        <input type="radio" id="r57" name="select" value="r57"><label for="r57">반려동물</label>
                        <input type="radio" id="r58" name="select" value="r58"><label for="r58">만화</label>
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
                        <div class="show"><img src="resources/img/down.png"></div>
                    </div>
    
                    <!-- show hidden unless .show clicked -->
                    <div class="sub_category">
                        <input type="radio" id="r59" name="select" value="r59"><label for="r59">파티</label>
                        <input type="radio" id="r60" name="select" value="r60"><label for="r60">소개팅</label>
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
                        <div class="show"><img src="resources/img/down.png"></div>
                    </div>
    
                    <!-- show hidden unless .show clicked -->
                    <div class="sub_category">
                        <input type="radio" id="r61" name="select" value="r61"><label for="r61">국내여행</label>
                        <input type="radio" id="r62" name="select" value="r62"><label for="r62">해외여행</label>
                        <input type="radio" id="r63" name="select" value="r63"><label for="r63">캠핑</label>
                        <input type="radio" id="r64" name="select" value="r64"><label for="r64">드라이브</label>
                        <input type="radio" id="r65" name="select" value="r65"><label for="r65">피크닉</label>
                        <input type="radio" id="r66" name="select" value="r66"><label for="r66">복합문화공간</label>
                        <input type="radio" id="r67" name="select" value="r67"><label for="r67">테마파크</label>
                    </div>
                </div>
                
                <!-- category card 7  -->
                <div class="category_card">
    
                    <div class="main_category">
                        <img src="resources/img/studying.png">
                        <div class="category_info">
                            <div class="cateogy_text">자기계발</div>
                            <div class="category_detail">습관만들기﹒스터디﹒커리어</div>
                        </div>
                        <div class="show"><img src="resources/img/down.png"></div>
                    </div>
    
                    <!-- show hidden unless .show clicked -->
                    <div class="sub_category">
                        <input type="radio" id="r68" name="select" value="r68"><label for="r68">독서</label>
                        <input type="radio" id="r69" name="select" value="r69"><label for="r69">스터디</label>
                        <input type="radio" id="r70" name="select" value="r70"><label for="r70">대화</label>
                        <input type="radio" id="r71" name="select" value="r71"><label for="r71">브랜딩</label>
                        <input type="radio" id="r72" name="select" value="r72"><label for="r72">커리어</label>
                        <input type="radio" id="r73" name="select" value="r73"><label for="r73">사이드프로젝트</label>
                        <input type="radio" id="r74" name="select" value="r74"><label for="r74">창작</label>
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
                        <div class="show"><img src="resources/img/down.png"></div>
                    </div>
    
                    <!-- show hidden unless .show clicked -->
                    <div class="sub_category">
                        <input type="radio" id="r75" name="select" value="r75"><label for="r75">관심사</label>
                        <input type="radio" id="r76" name="select" value="r76"><label for="r76">동네</label>
                        <input type="radio" id="r77" name="select" value="r77"><label for="r77">또래</label>
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
                        <div class="show"><img src="resources/img/down.png"></div>
                    </div>
    
                    <!-- show hidden unless .show clicked -->
                    <div class="sub_category">
                        <input type="radio" id="r78" name="select" value="r78"><label for="r78">재테크</label>
                        <input type="radio" id="r79" name="select" value="r79"><label for="r79">N잡</label>
                        <input type="radio" id="r80" name="select" value="r80"><label for="r80">부동산</label>
                        <input type="radio" id="r81" name="select" value="r81"><label for="r81">창업</label>
                        <input type="radio" id="r82" name="select" value="r82"><label for="r82">주식</label>
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
                        <div class="show"><img src="resources/img/down.png"></div>
                    </div>
    
                    <!-- show hidden unless .show clicked -->
                    <div class="sub_category">
                        <input type="radio" id="r83" name="select" value="r83"><label for="r83">영어</label>
                        <input type="radio" id="r84" name="select" value="r84"><label for="r84">언어교환</label>
                        <input type="radio" id="r85" name="select" value="r85"><label for="r85">일본어</label>
                        <input type="radio" id="r86" name="select" value="r86"><label for="r86">중국어</label>
                    </div>
                </div>
                <div>
                    <input type="submit" id="fin_btn" value="완료!">
                </div>
            </div>
        </form>
    </div>

	<script>
		window.onload = () =>{
			const birthDateValue = document.getElementById('birth').value;
			const newBirthDate = new Date(birthDateValue);
		    const formattedBirthDate = new Date(birthDateValue);
		    const formattedISODate = formattedBirthDate.toISOString().split('T')[0];

		    document.getElementById('birthDate').value = formattedISODate;
		    
		    const imgs = document.querySelectorAll('.main_category img');
		    const checkboxes = document.querySelectorAll('.category_card input[type="radio"]');
		
		    imgs.forEach((img) => {
		        img.addEventListener('click', () => {
		            const categoryCard = img.closest('.category_card');
		            const subCategory = categoryCard.querySelector('.sub_category');
		
		            if (subCategory.style.display === 'block') {
		                subCategory.style.display = 'none';
		                img.src = 'resources/img/down.png';
		            } else {
		                subCategory.style.display = 'block';
		                img.src = 'resources/img/up.png';
		            }
		        });
		    });
		
		    checkboxes.forEach((checkbox) => {
		        checkbox.addEventListener('click', () => {
		        });
		    });
		
		    function test() {
		        const checkedCheckboxes = document.querySelectorAll('.category_card input[type="radio"]:checked');
		        if (checkedCheckboxes.length < 1) {
		            alert('취미를 선택하셔야 합니다!');
		            return false;
		        } else {
		            alert('회원가입을 환영합니다!');
		            return true;
		        }
		    }
		}
	    
	    
	</script>


</body>
</html>