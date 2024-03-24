<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>아이디 찾기</title>
    <link href="resources/css/searchId.css" rel="stylesheet">
    <script src="https://code.jquery.com/jquery-3.6.1.min.js"></script>
</head>
<body>
    <div class="logo_area">
        <img src="resources/img/hobithu.png">
    </div>
    <div class="content">
        <form>
            <div class="form_list" id="form_list">
                <div class="form_item user" id="divId">
                    <input type="text" id="name" name="name" placeholder="이름 입력" class="input" value="" maxlength="20" autocapitalize="off">
                </div>
                <div class="email-group">
                    <input type="email" class="email" id="email" name="email" placeholder="이메일 입력">
                    <input type="button" value="전송" class="email_btn" id="send-email">
                </div>
                <div class="AuthenticationEmail">
                    <input type="text" readonly placeholder="인증번호 입력" id="authentication">
                    <input type="button" class="email_btn" value="확인" id="check">
                </div>
                <div>
                    <input type="submit" id="next_btn" value="찾기">
                </div>
                <div class="error_text item_style" id="emailMsg" style="display: none;"></div>
            </div>
        </form>
    </div>

    <div id="myModal" class="modal">
        <!-- 모달 내용 -->
        <div class="modal-content">
            	<h4 id="modalContent"></h4>
            	<span id="modalResult"></span>
        </div>
    </div>
    <script>
    window.onload = () => {
    	let code="";
    	let checkBtn = false;
    	
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

        document.getElementById('next_btn').addEventListener('click', function(event) {
            event.preventDefault();
            const name = document.getElementById('name').value.trim();
            if (checkBtn && name !== '') {
                const modal = document.getElementById('myModal');
                const modalContent = document.getElementById('modalContent');

                modalContent.textContent = name + '님의 아이디입니다.';
                
                $.ajax({
                    url : 'searchId.me',
                    data: {
                    	email:document.getElementById('email').value,
                    	userName:document.getElementById('name').value
                    },
                    success : function (data) {
                    	const modalContent = document.querySelector('.modal-content');
                    	const spanContainer = modalContent.querySelector('span');
                    	spanContainer.innerHTML = ''; 
                    	let count = 1; //카운팅
                    	if(data != null){
	                    	for (const item of data) {
	                    	    const ulItem = document.createElement('ul'); 
	                    	    const liItem = document.createElement('li'); 
	                    	    const spanItem = document.createElement('span'); 
	
	                    	    spanItem.textContent = count + ": " + item.userId; 
	                    	    liItem.appendChild(spanItem); 
	                    	    ulItem.appendChild(liItem); 
	                    	    ulItem.style.padding = '8px 0';
	                    	    ulItem.style.listStyle = 'none'; 
	
	                    	    spanContainer.appendChild(ulItem); 
	                    	    count++; // 카운트 증가
	                    	}
                    	}else{
                    		modalContent.textContent = name + '님은 등록된 아이디가 없습니다!';
                    	}
                       
                    	const homepageButton = document.createElement('button');
                        homepageButton.textContent = '홈페이지';
                        homepageButton.className = 'homepage-btn';
                        homepageButton.addEventListener('click', function() {
                            window.location.href = '${ contextPath }/';
                        });
                        
                        
                        modalContent.appendChild(homepageButton);

                        modal.style.display = 'block';
                    },
                    error: function(xhr, status, error) {
                        console.error("에러남!:", error);
                    }        
                 }); 
                
                
            }else if (!checkBtn){
            	alert('이메일 인증을 완료해주세요')
            }else if(userName === ''){
            	alert('이름을 입력해 주세요')
            }
        });
    };

    </script>
</body>
</html>
