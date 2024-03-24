<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>로그인 페이지</title>
    <link rel="stylesheet" href="resources/css/loginPage.css">
</head>
<body>
	<jsp:include page="/WEB-INF/views/common/selectNav.jsp"></jsp:include>
    <div class="logo">
        <img src="resources/img/hobithu.png">
    </div>
    <div class="container" id="container">
        <div class="form-container">
            <form action="${ contextPath }/signIn.me" method="post">
                <div class="id_pw_wrap">
                    <input type="text" class="input" placeholder="아이디를 입력해주세요" name="userId"/>
                    <hr>
                    <input type="password" class="input" placeholder="비밀번호를 입력해주세요" name="userPwd"/>
                </div>
                <button>로그인</button>
                
            </form>
        </div> 
    </div>
    <div class="find-container">
        <span id="find-id">아이디 찾기</span>
        <span> &nbsp;|&nbsp; </span>
        <span id="find-pwd">비밀번호 찾기</span>
        <span> &nbsp;|&nbsp; </span>
        <span id="sing-up">회원 가입</span>
    </div>
    
    <script>
    window.onload = () =>{

        const findId = document.getElementById('find-id');
        findId.addEventListener('mouseover', function() {
            findId.style.cursor = "pointer";
        });
        
        findId.addEventListener('click', function() {
            console.log('아이디 찾기 클릭됨');
            window.location.href = "${ contextPath }/findId.me";
        });
        
        // 비밀번호 찾기를 클릭했을 때의 동작을 처리하는 함수
        const findPwd = document.getElementById('find-pwd');
        findPwd.addEventListener('mouseover', function() {
            findPwd.style.cursor = "pointer";
        });
        
        findPwd.addEventListener('click', function() {
            console.log('비밀번호 찾기 클릭됨');
            window.location.href = "${ contextPath }/findPwd.me";
        });
        
        const signUp = document.getElementById('sing-up');
        signUp.addEventListener('mouseover', function() {
            signUp.style.cursor = "pointer";
        });
        
        signUp.addEventListener('click', function() {
            console.log('회원 가입 클릭됨');
            window.location.href = "signUp.me";
        });

        document.querySelector('button').addEventListener('click', function(event) {
            event.preventDefault(); 
        
            const usernameInput = document.querySelector('input[type="text"]');
            const passwordInput = document.querySelector('input[type="password"]');
        
            const username = usernameInput.value.trim();
            const password = passwordInput.value.trim();
            
            if (username === '' && password === '') {
                alert('아이디와 비밀번호를 입력해주세요.');
            } else if (username === '') {
                alert('아이디를 입력해주세요.');
            } else if (password === '') {
                alert('비밀번호를 입력해주세요.');
            } else {
				document.querySelector("form").submit();
            }
        
            console.log('아이디:', username);
            console.log('비밀번호:', password);
        
        });
    }
    </script>
</body>
</html>
