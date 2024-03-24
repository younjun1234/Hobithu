<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.6.1.js"></script>
 
<link href="resources/css/editMyInformation.css" rel="stylesheet" type="text/css">
</head>
<body>
		<!-- header start -->
		<div class="header">
			<div class="nav_bar">
				<ul>
					<li><a href="${ contextPath }/">HOME</a></li>
					<li><a href="${ contextPath }/search.bo">SEARCH</a></li>
					<li><a href="${ contextPath }/about.do">ABOUT</a></li>
				</ul>
			</div>
			<c:if test="${ empty loginUser }">
				<div class="profile">
					<a href="${ contextPath }/signUp.me">SIGN UP</a>
				</div>
				<div class="login">
					<a href="${ contextPath }/goToSignIn.me">SIGN IN</a>
				</div>
			</c:if>
			<c:if test="${ !empty loginUser }">
				<div class="profile">
					<a href="${ contextPath }/myPage.me">PROFILE</a>
				</div>
				<div class="login">
					<a href="${ contextPath }/logout.me">LOGOUT</a>
				</div>
			</c:if>
		</div>
		<!-- header end -->
		
		<form action="${ contextPath }/insertProfile.me" method = "post" enctype="multipart/form-data" id = "upform">
		<!-- 개인 정보 변경란 -->
		
		<div id="border" class="changeList" style="width: 600px; height: 1050px;">
		<h2 id="edit">Edit My Information</h2>
			<!-- 프로필 사진 -->
			<div id="changePro">
			    <img src="${contextPath}/resources/uploadFiles/${loginUser.profile}" id="myProfile"/> <br>	  
			        <input type="file"  name="editprofile" >
			</div>
			
			<!-- 개인 정보 변경 건 -->
			
			<div>
				<p id="textId"><b>아이디 *</b></p>
				<input type="text" id="userId" class="changeList" name="userId" style="background-color: lightgrey;" value="${ loginUser.userId }" readonly>
			</div>
			<br><br>
			<div>
				<p id="textName"><b>성 명</b></p>
				<input type="text" id="name" class="changeList" name="userName" value="${ loginUser.userName }" required>
			</div>
			<br><br>
			<div>
				<p id="textGender"><b>생년월일*</b></p>
				<input type="text" id="birth" class="changeList" name="birthDate" style="background-color: lightgrey;" value="${ loginUser.birthDate }" readonly>
			</div>
			<br><br>
			<div>
				<p id="textNickName"><b>닉네임</b></p>
				<input type="text" id="nickName" class="changeList" name="nickName" value="${ loginUser.nickName }" required>
			</div>
			<br><br>
			<div>
				<p id="textEmail"><b>이메일</b></p>
				<input type="email" id="email" name="email" value="${ loginUser.email }" required>
				<input type ="text" id="email_check" placeholder="인증코드 입력" required>
				<input type="button" id="email_check_btn" value="확인">
			</div>
				<button type = "submit" id="submit">확인</button>
			 </div>
			 
			 
			 
			 
			 
			 </form>
		
		
		<script>
		// 정보 변경 경고 메시지
// 	    const editConfirm = document.getElementById('submit');
	    
// 	    editConfirm.addEventListener('click', () => {
// 	        if (confirm('수정하시겠습니까?')) {
// 	        	document.getElementById('upform').submit;
	        	
// 	        }else {
// 		        // Optional: Do something if the user clicks "Cancel"
// 		        alert('수정에 실패하였습니다.');
// 	        }
// 	    });
	    
// 	    const myProfile = document.getElementById("myProfile");
// 	    console.log(myProfile);
// 	    const file = document.querySelector('input[type=file]');
// 	    var fReader = new FileReader();
	   
// 	    file.addEventListener('input', function () {
// 		    fReader.readAsDataURL(file.files[0]);
// 	    	 fReader.onloadend = function(event){
// 	 	        var img = document.getElementById("myProfile");
// 	 	        img.src = event.target.result;
// 	 	        console.log("path: ", event.target.result);

// 	 	    }
// 	    })
		window.onload=()=> {	
		
		  let code="";
          /*누른경우에만  체크 해줘야 함*/
          let check_button=false;
          /*인증체크하는곳*/
        	$('#email_check_btn').click(function() {
            const checkInput = $('#email_check'); // 인증번호 입력하는곳 
            check_button=true;
            console.log(document.getElementById('email').value);
            $.ajax({
               type : 'get',
               url : '${contextPath}/mailCheck.me', 
               data: {email:document.getElementById('email').value},
               success : function (data) {
                  console.log("data : " +  data);
                  checkInput.attr('disabled',false);
                  code =data;
                  alert('인증번호가 전송되었습니다.')
               }         
            }); 
         }); 
         
         /* 받아온 랜덤 코드를 비교하는 부분 인증코드 input에서 포커스를 잃었을시 확인*/
         $('#email_check').blur(function () {
            const inputCode = $(this).val();
            const $resultMsg = $('#email_check_btn');
            console.log(code);
            if(check_button){
               if(inputCode == code){
                  $resultMsg.html('인증번호가 일치합니다.');
                  $resultMsg.css('color','green');
                  $('#mail-Check-Btn').attr('disabled',true);
                  $('#email').attr('readonly',true);
                  $('#email').attr('onFocus', 'this.initialSelect = this.selectedIndex');
                     $('#email').attr('onChange', 'this.selectedIndex = this.initialSelect');
                      check_mail=true;
               }else{
                  $resultMsg.html('인증번호가 불일치 합니다. 다시 확인해주세요!.');
                  $resultMsg.css('color','red');
                   check_mail=false;
               }
            }
         });
		}
		</script>
</body>
</html>