<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="resources/css/selectPeopleType.css?after">
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
			<div class="select_ctn">
			<form action="${ contextPath }/preview.bo" method="POST">
	         	<input type="hidden" name="category" value="${ category }">
            	<input type="hidden" name="clubName" value="${ club.clubName }">
            	<input type="hidden" name="content" value="${ club.content }">
           		<input type="hidden" name="clubScheduleOG" value="${ club.clubSchedule }">
            	<input type="hidden" name="backgroundImage" value="${ club.backgroundImage }">
            	<input type="hidden" name="onlineYN" value="${ club.onlineYN }">
            	<input type="hidden" name="clubAccess" value="${ club.clubAccess }">
        	    <input type="hidden" name="addr" value="${ club.addr }">
            	
				<div class="content_text">어떤 멤버를 모집할까요?</div>
				<div class="gender_select_ctn">
					<div class="gender_select_header select_header">
						<img src="resources/img/equality.png">
						<div class="header_text">성별</div>
						<div id="show_gender_select">누구나</div>
						<img src="resources/img/down.png">
					</div>
					<div class="gender_select">
						<input type="radio" name="selectGender" id="all" value="A" checked>
						<label for="all">누구나</label> <input type="radio" name="selectGender"
							id="female" value="F">
						<label for="female">여자만</label> <input type="radio" name="selectGender"
							id="male" value="M">
						<label for="male">남자만</label>
					</div>
				</div>
				<div class="age_select_ctn">
					<div class="age_select_header select_header">
						<img src="resources/img/age-group.png">
						<div class="header_text">나이</div>
						<div id="show_age_select">누구나</div>
						<img src="resources/img/down.png">
					</div>
					<div class="age_select">
						<div class="multi-range-slider">
							<!-- 진짜 슬라이더 -->
							<input type="range" id="input-left" min="20" max="50" value="0" step="5" name="low_range">
							<input type="range" id="input-right" min="20" max="50" value="50" step="5" name="upp_range">
							<!-- 커스텀 슬라이더 -->
							<div class="slider">
								<div class="track"></div>
								<div class="range"></div>
								<div class="thumb left"></div>
								<div class="thumb right"></div>
							</div>
						</div>
						<div class="range_text">
							<div>20</div>
							<div>25</div>
							<div>30</div>
							<div>35</div>
							<div>40</div>
							<div>45</div>
							<div>50+</div>
						</div>
					</div>
				</div>
				<div class="content_text">참가비가 있나요?</div>
				<div class="payment_select_ctn">
					<div class="payment_select_header select_header">
						<img src="resources/img/free-icon-money-icons-351769.png">
						<div class="header_text" id="payment_header_text">참가비</div>
						<img src="resources/img/down.png">
					</div>
					<div class="payment_select">
						<input type="radio" name="paymentYN" id="yes" value="Y">
						<label for="yes">있음</label> <input type="radio" name="paymentYN" id="no" value="N">
						<label for="no">없음</label>
					</div>
				</div>
				<div class="content_text">몇 명과 함게 할까요?</div>
				<div class="capacity_select_ctn">
					<div class="capacity_select_header select_header">
						<img src="resources/img/capacity.png">
						<div class="header_text">인원</div>
						<img src="resources/img/down.png">
					</div>
					<div class="capacity_select">
						<input type="number" name="clubCapacity" id="capacity" min="3"
							max="30" value="3">

					</div>
				</div>
			</form>
			</div>
		</div>
	</div>

	<script>
        window.onload = () => {
            const select_headers = document.getElementsByClassName('select_header');
            for (const select_header of select_headers) {
                select_header.addEventListener('click', function () {
                    $(this).next().slideToggle(200);
                })
            }

            const buttons = document.getElementsByClassName('gender_select')[0].querySelectorAll('label');
            for (const button of buttons) {
                const button_val = button.textContent;
                button.addEventListener('click', () => {
                    button.parentElement.parentElement.children[0].children[2].innerHTML = button.innerText;
                })
            }
            
            document.getElementById('next_btn').addEventListener('click', () => {
	            const form = document.querySelector('form');
	            form.submit();
            })
        }

        const inputLeft = document.getElementById("input-left");
        const inputRight = document.getElementById("input-right");

        const thumbLeft = document.querySelector(".slider > .thumb.left");
        const thumbRight = document.querySelector(".slider > .thumb.right");
        const range = document.querySelector(".slider > .range");

        const setLeftValue = () => {
            const _this = inputLeft;
            const [min, max] = [parseInt(_this.min), parseInt(_this.max)];

            // 교차되지 않게, 1을 빼준 건 완전히 겹치기보다는 어느 정도 간격을 남겨두기 위해.
            _this.value = Math.min(parseInt(_this.value), parseInt(inputRight.value) - 5);

            // input, thumb 같이 움직이도록
            const percent = ((_this.value - min) / (max - min)) * 100;
            thumbLeft.style.left = percent + "%";
            range.style.left = percent + "%";
        };

        const setRightValue = () => {
            const _this = inputRight;
            const [min, max] = [parseInt(_this.min), parseInt(_this.max)];

            // 교차되지 않게, 1을 더해준 건 완전히 겹치기보다는 어느 정도 간격을 남겨두기 위해.
            _this.value = Math.max(parseInt(_this.value), parseInt(inputLeft.value) + 5);

            // input, thumb 같이 움직이도록
            const percent = ((_this.value - min) / (max - min)) * 100;
            thumbRight.style.right = 100 - percent + "%";
            range.style.right = 100 - percent + "%";
        };


        inputLeft.addEventListener("input", setLeftValue);
        inputRight.addEventListener("input", setRightValue);

        const setRangeValue = () => {
            const [min, max] = [parseInt(inputLeft.min), parseInt(inputRight.max)];
            if (inputLeft.value == min && inputRight.value == max) {
                $('#show_age_select').text('누구나');
            } else {
                $('#show_age_select').text(inputLeft.value + "~" + inputRight.value);
            }
        }

        inputLeft.addEventListener("input", setRangeValue);
        inputRight.addEventListener("input", setRangeValue);

    </script>
</body>

</html>