<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>회원 정보 입력</title>
    <link rel="stylesheet" href="resources/css/signUp.css">
    <script src="https://code.jquery.com/jquery-3.6.1.min.js"></script>
</head>
<body>
    <div class="logo_area">
        <img src="resources/img/hobithu.png" id="logo">
    </div>
    <div class="content">
        <form action="selectHobby.me" method="POST" onsubmit="return test()">
            <div class="form_list" id="up_form_list">
                <div class="form_item user" id="divId">
                    <input type="text" id="id" name="userId" placeholder="아이디" class="input" value="" maxlength="20" autocapitalize="off">
                </div>
                <!-- 비밀번호 둘이 일치 확인 버튼 클릭시 type text로 변경 -->
                <div class="form_item lock password" id="divPasswd1">
                    <input type="password" id="pswd1" name="userPwd" placeholder="비밀번호" class="input" value="" maxlength="20" autocomplete="new-password">
                    <div class="password_info_btn">
                        <em class="how_secure" id="secureLevel"></em>
                        <button type="button" class="btn show_hide">
                            <span class="blind"><img class="eye" src="resources/img/eye.png"></span>
                        </button>
                    </div>
                </div>
                <div class="form_item lock password" id="divPasswd2">
                    <input type="password" id="pswd2" name="pswd2" placeholder="비밀번호 재입력" class="input" value="" maxlength="20" autocomplete="new-password">
                    <div class="password_info_btn">
                        <em class="how_secure" id="secureLevel"></em>
                        <button type="button" class="btn show_hide">
                            <span class="blind"><img class="eye" src="resources/img/eye.png"></span>
                        </button>
                    </div>
                </div>
                
            </div>
            <!-- 중복 검사후 출력되는 결과값 -->
            <div class="error_text item_style" id="idMsg" style="display: none"></div>
            <div class="error_text item_style" id="pwdMsg" style="display: none;">비밀번호: 8~16자의 영문 대/소문자, 숫자, 특수문자를 사용해 주세요.</div>

            <div class="down form_list">
                <div class="form_item user" id="divName">
                    <input type="text" id="name" name="userName" placeholder="이름" class="input" maxlength="40">
                </div>
                <div class="form_item calendar" id="divBirthday">
                    <input type="date" id="birthdayInput" placeholder="생년월일 8자리(YYYYMMdd)" name="birthDate" class="input" value="" maxlength="10">
                </div>
                <!-- 이메일 발송 -->
                <div class="form_item email" id="divEmail">
                    <input type="email" id="email" name="email" placeholder="인증할 이메일을 입력해주세요." class="email" value="" maxlength="100">
                    <div class="email_info_btn">
                        <em class="how_secure" id="secureLevel"></em>
                        <button type="button" class="btn btn_email" id="send-email">
                            <span class="blind">발송</span>
                        </button>
                    </div>
                </div>
                <!-- 인증번호 확인 -->
                <div class="form_item email" id="divEmailAuthentication">
                    <input type="text" id="authentication" readonly placeholder="전송 받은 인증코드를 입력해주세요." class="input" value="" maxlength="100" style="background-color : lightgray;">
                    <div class="email_info_btn">
                        <em class="how_secure" id="secureLevel"></em>
                        <button type="button" id="check" class="btn btn_email">
                            <span class="blind">확인</span>
                        </button>
                    </div>
                </div>
            </div>

            <!-- 이름은 비어있을경우만 -->
            <div class="error_text item_style" id="nameMsg" style="display: none"></div>
            <!-- 양식 + 23년보다 멀리있으면 에러 출력 -->
            <div class="error_text item_style" id="birthdayMsg" style="display: none"></div>
            <!-- 이메일 양식 오류 -->
            <div class="error_text item_style" id="emailMsg" style="display: none"></div>
            
            <div class="form_list">
                <input type="text" name="nickName" id="nickName" placeholder="닉네임을 입력해주세요">
                <div id="gender_area">
                    <input type='radio' id='male' checked='checked' name='gender' value="M">
                    <label for='male'>남자</label>
                    <input type='radio' id='female' name='gender' value="F">
                    <label for='female'>여자</label>
                </div>
            </div>
            
            <div class="error_text item_style" id="nickNameMsg" style="display: none"></div>

            <div>
                <input type="submit" id="next_btn" value="다음">
            </div>
        </form>
    </div>
    <script>
	    window.onload = function() {
	        var buttons = document.querySelectorAll('.btn.show_hide');
	        var checkTrim = { id: false, name: false, pswd: false, birthday: false, nickName: false };
	
	        buttons.forEach(function(button) {
	            var img = button.querySelector('img');
	
	            img.addEventListener('click', function(event) {
	                var parentDiv = button.closest('.form_item.lock.password');
	                var inputs = parentDiv.getElementsByTagName('input');
	
	                for (var i = 0; i < inputs.length; i++) {
	                    if (inputs[i].type === 'password') {
	                        inputs[i].type = inputs[i].type === 'password' ? 'text' : 'password';
	                    }
	                }
	
	                img.setAttribute('src', inputs[0].type === 'password' ? 'resources/img/eye.png' : 'resources/img/hide.png');
	            });
	        });
	
	        // 아이디 입력란 유효성 검사
	        var idInput = document.getElementById('id');
	        var idMsg = document.getElementById('idMsg');
	
	        idInput.addEventListener('blur', function() {
	            var id = idInput.value.trim();
	            var onlyLetters = /^[a-zA-Z0-9]{4,19}$/;
	
	            if(id === ''){
	            	checkTrim.id = false;
	                displayErrorMessage(idMsg, "아이디를 입력해주세요", "14px", 'red');
	                idInput.style.border = '1px solid red';
	            }else if (!onlyLetters.test(id)) {
	                checkTrim.id = false;
	                displayErrorMessage(idMsg, "영문자 및 숫자로만 입력해주세요", "14px", 'red');
	                idInput.style.border = '1px solid red';
	            }else {
	            	$.ajax({
	            		url : 'checkId.me',
	            		data : {checkId : id},
	            		success: (data) =>{
	            			if (data === 'yes') {
	            				checkTrim.id = true;
	        	                hideErrorMessage(idMsg, idInput);
	        	                idInput.style.border = '1px solid green';
	        	            } else {
	        	            	checkTrim.id = false;
	        	                displayErrorMessage(idMsg, "이미 사용중인 아이디 입니다.", "14px", 'red');
	        	                idInput.style.border = '1px solid red';
	        	            }
	            		},
	            		error: data => console.log('오류남! ㅋㅋ')
	            	});
	            }
	        });
	
	        // 이름 입력란 유효성 검사
	        var nameInput = document.getElementById('name');
	        var nameMsg = document.getElementById('nameMsg');
	
	        nameInput.addEventListener('blur', function(event) {
	            var name = nameInput.value.trim();
	
	            if (name === '') {
	                checkTrim.name = false;
	                displayErrorMessage(nameMsg, "이름을 입력해주세요", "14px", 'red');
	                nameInput.style.border = '1px solid red';
	            } else {
	            	
					checkTrim.name = true;
					hideErrorMessage(nameMsg, nameInput);
					nameInput.style.border = '1px solid green';
	            }
	        });
	
	        // 비밀번호 입력란 및 비밀번호 재입력 입력란 유효성 검사
	        var pswd1Input = document.getElementById('pswd1');
	        var pswd2Input = document.getElementById('pswd2');
	        var pswdMsg = document.getElementById('pwdMsg');
	
	        pswd1Input.addEventListener('blur', function(event) {
	            var pswd1 = pswd1Input.value.trim();
	            var pswd2 = pswd2Input.value.trim();
	            var onlyLetters = /^[0-9a-zA-Z]{4,15}$/;
	
	            if (pswd1 === '' || pswd2 === '') {
	                checkTrim.pswd = false;
	                displayErrorMessage(pswdMsg, "비밀번호를 입력해주세요", "14px", 'red');
	                pswd1Input.style.border = '1px solid red';
	                pswd2Input.style.border = '1px solid red';
	            } else if (!onlyLetters.test(pswd2)) {
	                checkTrim.pswd = false;
	                displayErrorMessage(pswdMsg, "영문자와 숫자로만 작성해주세요", "14px", 'red');
	                pswd1Input.style.border = '1px solid red';
	                pswd2Input.style.border = '1px solid red';
	            } else if (pswd1 !== pswd2) {
	                checkTrim.pswd = false;
	                displayErrorMessage(pswdMsg, "비밀번호가 일치하지 않습니다", "14px", 'red');
	                pswd1Input.style.border = '1px solid red';
	                pswd2Input.style.border = '1px solid red';
	            } else {
	                checkTrim.pswd = true;
	                hideErrorMessage(pswdMsg, pswd1Input);
	                hideErrorMessage(pswdMsg, pswd2Input);
	                pswd1Input.style.border = '1px solid green';
	                pswd2Input.style.border = '1px solid green';
	            }
	        });
	
	        pswd2Input.addEventListener('blur', function(event) {
	            var pswd1 = pswd1Input.value.trim();
	            var pswd2 = pswd2Input.value.trim();
	            var onlyLetters = /^[0-9a-zA-Z]{4,15}$/;
	
	            if (pswd1 === '' || pswd2 === '') {
	                checkTrim.pswd = false;
	                displayErrorMessage(pswdMsg, "비밀번호를 입력해주세요", "14px", 'red');
	                pswd1Input.style.border = '1px solid red';
	                pswd2Input.style.border = '1px solid red';
	            } else if (!onlyLetters.test(pswd2)) {
	                checkTrim.pswd = false;
	                displayErrorMessage(pswdMsg, "영문자와 숫자로만 작성해주세요", "14px", 'red');
	                pswd1Input.style.border = '1px solid red';
	                pswd2Input.style.border = '1px solid red';
	            } else if (pswd1 !== pswd2) {
	                checkTrim.pswd = false;
	                displayErrorMessage(pswdMsg, "비밀번호가 일치하지 않습니다", "14px", 'red');
	                pswd1Input.style.border = '1px solid red';
	                pswd2Input.style.border = '1px solid red';
	            } else {
	                checkTrim.pswd = true;
	                hideErrorMessage(pswdMsg, pswd1Input);
	                hideErrorMessage(pswdMsg, pswd2Input);
	                pswd1Input.style.border = '1px solid green';
	                pswd2Input.style.border = '1px solid green';
	            }
	        });
	
	        // 닉네임 입력란 유효성 검사
	        var nickNameInput = document.getElementById('nickName');
	        var nickNameMsg = document.getElementById('nickNameMsg');
	
	        nickNameInput.addEventListener('blur', function(event) {
	            var nickName = nickNameInput.value.trim();
	
	            if (nickName === '') {
	                checkTrim.nickName = false;
	                displayErrorMessage(nickNameMsg, "닉네임을 입력해주세요", "14px", 'red');
	                nickNameInput.style.border = '1px solid red';
	            } else {
	            	$.ajax({
	            		url : 'checkNick.me',
	            		data : {nickName : nickName},
	            		success: (data) =>{
	            			if (data === 'yes') {
	            				checkTrim.nickName = true;
	        	                hideErrorMessage(nickNameMsg, nickNameInput);
	        	                nickNameInput.style.border = '1px solid green';
	        	            } else {
	        	            	checkTrim.id = false;
	        	            	displayErrorMessage(nickNameMsg, "이미 사용중인 닉네임 입니다.", "14px", 'red');
	        	            	nickNameInput.style.border = '1px solid red';
	        	            }
	            		},
	            		error: data => console.log(data)
	            	});
	                
	            }
	        });
			
	        var birthdayInput = document.getElementById('birthdayInput');
	        var birthdayMsg = document.getElementById('birthdayMsg');

	        birthdayInput.addEventListener('blur', function(event) {
	            var enteredDate = birthdayInput.value;
	            var enteredYear = parseInt(enteredDate.substr(0, 4));
	            var enteredMonth = parseInt(enteredDate.substr(5, 2));
	            var enteredDay = parseInt(enteredDate.substr(8, 2));
	            var currentYear = new Date().getFullYear();
	            var currentMonth = new Date().getMonth() + 1;
	            var currentDay = new Date().getDate();

	            if (
	                enteredDate.length !== 10 || 
	                enteredYear < 1900 || // 1900년 이후의 연도여야 함
	                enteredYear > currentYear - 18 || // 18세 이상이어야 함
	                enteredMonth < 1 || enteredMonth > 12 || // 1부터 12 사이의 월이어야 함
	                enteredDay < 1 || enteredDay > 31 || // 1부터 31 사이의 일이어야 함
	                (enteredMonth === 2 && enteredDay > 29) || // 2월은 최대 29일까지
	                ((enteredMonth === 4 || enteredMonth === 6 || enteredMonth === 9 || enteredMonth === 11) && enteredDay > 30) // 해당 월은 최대 30일까지
	            ) {
	            	checkTrim.birthday = false;
	                displayErrorMessage(birthdayMsg, "올바른 생년월일을 입력하세요 (YYYY-MM-DD)", "14px", 'red');
	                birthdayInput.style.border = '1px solid red';
	            } else {
	            	checkTrim.birthday = true;
	                hideErrorMessage(birthdayMsg, birthdayInput);
	                birthdayInput.style.border = '1px solid green';
	            }
	        });
	
	        // 이메일 입력란 유효성 검사
	        let code = "";
	        let checkBtn = false;
	        
	        var emailInput = document.getElementById('email');
	        var emailMsg = document.getElementById('emailMsg');
	
	        emailInput.addEventListener('blur', function(event) {
	            var email = emailInput.value.trim();
	            const regex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
	
	            if (!regex.test(email)) {
	                displayErrorMessage(emailMsg, "올바른 이메일 주소를 입력하세요.", "14px", 'red');
	                emailInput.style.border = '1px solid red';
	            } else {
	            	document.getElementById('send-email').addEventListener('click', function(event) {
	                    event.preventDefault();
	                    const checkInput = document.getElementById('authentication'); //이메일 인증 입력 부분
	                    const checkButton= document.getElementById('check');
	                    const emailValue = emailInput.value;

						checkInput.removeAttribute('readonly');
						checkInput.style.backgroundColor = 'white';
						checkButton.style.cursor = "pointer";
						checkBtn = true;
	        				
						$.ajax({
							type : 'get',
							url : 'mailCheck.me', // GET방식이라 Url 뒤에 email을 뭍힐수있다.
							data: {email:document.getElementById('email').value},
							success : function (data) {
								code = data;
								alert('인증번호가 전송되었습니다.')
							},
							error: function(xhr, status, error) {
								console.error("오류다!", error);
							}        
						}); 
	                });
	            }
	        });
	        
	        $('#check').click(function () {
	        	const emailInput = document.getElementById('authentication');
	        	const inputCode = document.getElementById('authentication').value;
	            const resultMsg = document.getElementById('emailMsg');
	            if(checkBtn){
					if(inputCode == code){
						displayErrorMessage(resultMsg, "인증번호가 일치합니다.", "14px", 'green');
		                emailInput.style.border = '1px solid green';
						$('#send-email').attr('disabled',true);
						$('#mail').attr('readonly',true);
						$('#userEamil2').attr('readonly',true);
						$('#userEmail2').attr('onFocus', 'this.initialSelect = this.selectedIndex');
						$('#userEmail2').attr('onChange', 'this.selectedIndex = this.initialSelect');
						checkBtn=true;
	               }else{
	            	  	displayErrorMessage(resultMsg, "인증번호가 불일치 합니다. 다시 확인해주세요!", "14px", 'red');
		                emailInput.style.border = '1px solid red';
						checkBtn=false;
	               }
	            }
	         });
	        function validateEmail(email) {
	            const regex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
	            return regex.test(email);
	        }
	
	        function displayErrorMessage(msgElement, message, fontSize, color) {
	            msgElement.style.display = 'block';
	            msgElement.innerHTML = message;
	            msgElement.style.color = color;
	            msgElement.style.fontSize = fontSize;
	        }
	
	        function hideErrorMessage(msgElement, inputElement) {
	            msgElement.style.display = 'none';
	        }
	
	        function test() {
	            if (checkTrim.id && checkTrim.name && checkTrim.pswd && checkTrim.birthday && checkTrim.nickName && checkBtn) {
	                return true;
	            }else if(!checkBtn){
	            	alert('이메일 인증을 완료해주세요')
	            	return false;
	        	}else {
	                alert('정보들을 입력해주세요.');
	                return false;
	            }
	        }

        	document.querySelector('form').addEventListener('submit', function(event) {
            	if (!test()) {
            	    event.preventDefault();
            	}
			});
		};
	</script>


</body>
</html>