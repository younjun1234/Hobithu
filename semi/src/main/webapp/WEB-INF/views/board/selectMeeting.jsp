<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
     <link rel="stylesheet" href="resources/css/selectMeeting.css?after">
    <script src="http://code.jquery.com/jquery-3.7.1.min.js"></script>
</head>

<body>
    <div class="wrap">
        <jsp:include page="../common/selectNav.jsp"></jsp:include>
        <hr>
        <div class="content">
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
            <form action="${ contextPath }/selectPeopleType.bo" method="POST">
            	<input type="hidden" name="category" value="${ category }">
            	<input type="hidden" name="clubName" value="${ club.clubName }">
            	<input type="hidden" name="content" value="${ club.content }">
           		<input type="hidden" name="clubScheduleOG" value="${ club.clubSchedule }">
            	<input type="hidden" name="backgroundImage" value="${ club.backgroundImage }">
            	<input type="hidden" name="addr" value="${ club.addr }">
            	<input type="hidden" name="clubAccess" value="" id="clubAccess">
	            <div class="content_text">어디서 만날까요?</div>
	            <div class="content_box">
	                <input type="radio" name="onlineYN" id="offline" value="N">
	                <label for="offline">오프라인</label>
	                <input type="radio" name="onlineYN" id="online" value="Y">
	                <label for="online">온라인</label>
	            </div>
	            <div class="content_text">어떻게 멤버를 모집할까요?</div>
	            <div class="content_box">
	                <div class="auth_type" id="at1">
	                    <img src="resources/img/clock.png" id="ati1">
	                    <div>
	                        <div class="auth_type_header" id="ath1">선착순</div>
	                        <br>
	                        <div class="auth_type_content" id="atc1">
	                            멤버들의 신청과 동시에 참여가 완료돼요.
	                            누구나 참여할 수 있어서 신청률이 높아요.
	                        </div>
	                    </div>
	                </div>
	                <div class="auth_type" id="at2">
	                    <img src="resources/img/search.png" id="ati2">
	                    <div>
	                        <div class="auth_type_header" id="ath2">승인제</div>
	                        <br>
	                        <div class="auth_type_content" id="atc2">
	                            호스트가 직접 멤버를 수락하거나 거절 할 수 있어요.
	                            질문을 통해 취향이 통하는 사람들과 만날 수 있어요.
	                        </div>
	                    </div>
	                </div>
	            </div>
         	</form>
            


        </div>
    </div>

    <script>
        window.onload = () => {
            const auth_types = document.getElementsByClassName('auth_type');
            for (const auth_type of auth_types) {
                auth_type.addEventListener('click', function() {
                    for(const auth_type_check of auth_types) {
                        if (this == auth_type_check) {
                            $(this)[0].classList.add('clicked');
                            $('#ath1')[0].classList.add('clicked');
                            $('#atc1')[0].classList.add('clicked');
                            $('#ati1')[0].src = "resources/img/clock_white.png";
                            $('#at2')[0].classList.remove('clicked');
                            $('#ath2')[0].classList.remove('clicked');
                            $('#atc2')[0].classList.remove('clicked');
                            $('#ati2')[0].src = "resources/img/search.png";

                            break;
                        } else {
                            $(this)[0].classList.add('clicked');
                            $('#ath2')[0].classList.add('clicked');
                            $('#atc2')[0].classList.add('clicked');
                            $('#ati2')[0].src = "resources/img/search_white.png";
                            $('#at1')[0].classList.remove('clicked');
                            $('#ath1')[0].classList.remove('clicked');
                            $('#atc1')[0].classList.remove('clicked');
                            $('#ati1')[0].src = "resources/img/clock.png";

                            break;
                        }
                    }
                });
            }
            $('#next_btn').click(() => {
            	if (document.querySelector('input[type=radio]:checked') == null ||
            			document.querySelector('.clicked') == null) {
            		alert("모든 항목을 선택해주세요");
            	} else {
            		if (document.querySelector('.clicked').id == 'at1') {
            			document.getElementById('clubAccess').value = 'N';
            		} else  {
            			document.getElementById('clubAccess').value = 'Y';
            		}
            		const form = document.querySelector('form');
            		form.submit();
            	}
            })

            
        }

    </script>
</body>

</html>