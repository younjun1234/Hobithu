<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>비밀번호 변경</title>
    <link href="resources/css/newpassword.css" rel="stylesheet">
    <script src="https://code.jquery.com/jquery-3.6.1.min.js"></script>
</head>
<body>
    <div class="content">
        <form>
            <div class="form_list" id="form_list">
                <div class="form_item lock password" id="divPasswd1">
                	<input type="hidden" id="id" name="userId" value="${ m.userId }">
                	<input type="hidden" id="email" name="email" value="${ m.email }">
                    <input type="password" id="pswd1" name="userPwd" placeholder="비밀번호" class="input" value="" maxlength="16" autocomplete="new-password">
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
            <div class="error_text item_style" id="pwdMsg" style="display: none;">비밀번호: 8~16자의 영문 대/소문자, 숫자, 특수문자를 사용해 주세요.</div>
            <div>
                <input type="button" id="next_btn" value="변경">
            </div>
        </form>
        
        <script>
        var checkTrim = false;
        
        document.addEventListener('DOMContentLoaded', function() {
            var buttons = document.querySelectorAll('.btn.show_hide');

            buttons.forEach(function(button) {
                var img = button.querySelector('img');

                img.addEventListener('click', function(event) {
                    if (img.getAttribute('src') === 'resources/img/eye.png') {
                        img.setAttribute('src', 'resources/img/hide.png');

                        var parentDiv = button.closest('.form_item.lock.password');

                        var inputs = parentDiv.getElementsByTagName('input');

                        for (var i = 0; i < inputs.length; i++) {
                            if (inputs[i].type === 'password') {
                                inputs[i].type = 'text';
                            }
                        }
                    } else {
                        img.setAttribute('src', 'resources/img/eye.png');

                        var parentDiv = button.closest('.form_item.lock.password');

                        var inputs = parentDiv.getElementsByTagName('input');

                        for (var i = 0; i < inputs.length; i++) {
                            if (inputs[i].type === 'text') {
                                inputs[i].type = 'password';
                            }
                        }
                    }
                });
            });
        });

        document.addEventListener('DOMContentLoaded', function() {
            var pswd1Input = document.getElementById('pswd1');
            var pswd2Input = document.getElementById('pswd2');
            var pswdMsg = document.getElementById('pwdMsg');
            var nextButton = document.getElementById('next_btn');

            pswd1Input.addEventListener('blur', function(event) {
                validatePassword(pswd1Input, pswd2Input, pswdMsg);
            });

            pswd2Input.addEventListener('blur', function(event) {
                validatePassword(pswd1Input, pswd2Input, pswdMsg);
            });

            function validatePassword(pswd1Input, pswd2Input, pswdMsg) {
                var pswd1 = pswd1Input.value.trim();
                var pswd2 = pswd2Input.value.trim();

                var strongRegex =  /^[0-9a-zA-Z]{4,15}$/;

                if (pswd1 === '' || pswd2 === '') {
                    displayErrorMessage("비밀번호를 입력해주세요", "14px", 'red', pswdMsg);
                    checkTrim = false;
                } else if (!strongRegex.test(pswd1) || !strongRegex.test(pswd2)) {
                	checkTrim = false;
                    displayErrorMessage("영문자와 숫자로만 작성해주세요", "14px", 'red', pswdMsg);
                } else if (pswd1 !== pswd2) {
                	checkTrim = false;
                    displayErrorMessage("비밀번호가 일치하지 않습니다", "14px", 'red', pswdMsg);
                } else {
                	checkTrim = true;
                    hideErrorMessage(pswdMsg);
                }
            }

            function displayErrorMessage(message, fontSize, color, pswdMsg) {
                pswdMsg.style.display = 'block';
                pswdMsg.innerHTML = message;
                pswdMsg.style.color = color;
                pswdMsg.style.fontSize = fontSize;
                pswd1Input.style.border = '1px solid ' + color;
                pswd2Input.style.border = '1px solid ' + color;
            }

            function hideErrorMessage(pswdMsg) {
                pswdMsg.style.display = 'none';
                pswd1Input.style.border = '1px solid green';
                pswd2Input.style.border = '1px solid green';
            }
        });
        
        document.getElementById('next_btn').addEventListener('click', function() {

        	var idInput = document.getElementById('id').value;
            var emailInput = document.getElementById('email').value;
            var pswdInput = document.getElementById('pswd1').value;

            if (checkTrim) { 
                $.ajax({
                    url: 'updatePWD.me', 
                    data: { 
                        userId: idInput,
                        email: emailInput,
                        userPwd: pswdInput
                    },
                    success: function(data) { 
                        if (data === 'yes') {
                            alert('비밀번호 변경을 성공하셨습니다!');
                            window.close();
                        } else {
                            alert('비밀번호 변경을 실패하셨습니다!'); 
                        }
                    },
                    error: function(data) { 
                        console.log(data); 
                    }
                });
            } else { 
                return false;
            }
        });
        </script>
	</div>
</body>
</html>