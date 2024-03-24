<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>비밀번호 찾기</title>
    <link href="resources/css/searchPassword.css" rel="stylesheet">
    <script src="https://code.jquery.com/jquery-3.6.1.min.js"></script>
</head>
<body>
    <div class="logo_area">
        <img src="resources/img/hobithu.png">
    </div>
    <div class="content">
        <form action="${ contextPath }/" method="post" onsubmit="return test()">
            <div class="form_list" id="form_list">
                <div class="form_item user" id="divId">
                    <input type="text" id="id" name="id" placeholder="아이디" class="input" value="" maxlength="20" autocapitalize="off">
                </div>
                <div class="email-group">
                    <input type="email" class="email" id="email" name="email" placeholder="이메일 입력" >
                    <input type="button" value="전송" class="email_btn" id="send-email">
                </div>
                <div class="AuthenticationEmail">
                    <input type="text" readonly id="authentication"  placeholder="이메일인증 부분">
                    <input type="button" class="email_btn" value="확인" id="check">
                </div>
                <div>
                    <input type="submit" id="next_btn" value="찾기">
                </div>
                <div class="error_text item_style" id="emailMsg" style="display: none;"></div>
            </div>
        </form>
    </div>
    
    <script>
	    let code="";
	    let checkBtn = false;
	    let checkId = false;
	    
	    window.onload = () => {
	    	
	    	var idInput = document.getElementById('id');
	    	
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
	            			if (data === 'no') {
	            				checkId = true;
	        	            } else {
	        	            	checkId = false;
	        	            }
	            		},
	            		error: data => console.log('오류남! ㅋㅋ')
	            	});
	            }
	        });
	    	
	        function validateEmail(email) {
	            const regex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
	            return regex.test(email);
	        }
	
	        document.getElementById('send-email').addEventListener('click', function(event) {
	            event.preventDefault(); 
	            const checkInput = document.getElementById('authentication'); //이메일 인증 입력 부분
	            const checkButton= document.getElementById('check');
	            const emailInput = document.getElementById('email');
	            const emailValue = emailInput.value;
	
	            if (validateEmail(emailValue)) {
	                // 이메일이 유효한 경우
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
	                        console.error("AJAX 에러!:", error);
	                    }        
	                 }); 
	                
	            } else {
	                // 이메일이 유효하지 않은 경우
	                alert('유효한 이메일 주소를 입력하세요.');
	                checkInput.setAttribute('readonly', 'readonly');
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
						checkBtn =true;
	               }else{
	            	  	displayErrorMessage(resultMsg, "인증번호가 불일치 합니다. 다시 확인해주세요!", "14px", 'red');
		                emailInput.style.border = '1px solid red';
						checkBtn=false;
	               }
	            }
	         });
	        
	        function displayErrorMessage(msgElement, message, fontSize, color) {
	            msgElement.style.display = 'block';
	            msgElement.innerHTML = message;
	            msgElement.style.color = color;
	            msgElement.style.fontSize = fontSize;
	        }
			
	        
		}
    </script>
    
    
    <script >
	    function test() {
	    	const width = 1000;
	    	const height = 600;
	
	    	const left = (window.innerWidth - width) / 2;
	    	const top = (window.innerHeight - height) / 2;
			
			let idValue = document.getElementById('id').value; // 입력된 아이디
		    let emailValue = document.getElementById('email').value;
		    
			let popupOptions = "width=" + width + ",height=" + height + ",top=" + top + ",left=" + left;
			
	        if (checkId && checkBtn) {
		    	window.open("newPwd.me?userId=" + encodeURIComponent(idValue) + "&email=" + encodeURIComponent(emailValue), "newPwd.me", "_blank", popupOptions);
	            return true;
	        }else if(!checkId){
				alert('등록된 아이디가 없습니다.');
				return false;
			}else {
				alert('이메일 인증을 완료해 주세요.');
	            return false;
	        }
	    }
    </script>
    
    
    
    
    
</body>
</html>