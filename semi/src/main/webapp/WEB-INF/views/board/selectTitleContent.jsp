<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <link rel="stylesheet" href="resources/css/selectTitleContent.css?after">
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
            <!-- content main -->
			<form action="${ contextPath }/selectLocation.bo" method="POST" enctype="multipart/form-data">
				<input type="hidden" name="category" value="${ category }">
	            <div class="content_img_ctn">
	                <img src="resources/img/add-photo.png" id="profile_picture">
	            	<input type="file" name="file" style="display: none;" accept="image/png, image/jpeg, image/jpg">
	            </div>
	
	            <div class="content_text1">소셜링 제목을 작성해볼까요?</div>
	            <input type="text" name="clubName" id="title" placeholder="예) 연희동으로 카페 투어가요" required maxlength="80" minlength="5">
	            <div class="textNo_ctn">
	                <div class="text_no"><span id="text_length">0</span>/80</div>
	            </div>
	
	            <div class="content_text2">소셜링을 소개해볼까요?</div>
	            <textarea class="content_content" id="content" name="content" placeholder="소개글을 입력해주세요 (선택)" spellcheck="true"></textarea>
            </form>
        </div>
    </div>

    <script>
        
        $("#title")[0].addEventListener("keyup", function () {
        	const length = $(this).val().length;
            $("#text_length").text(length);
            
            if (length < 5) {
            	$("#text_length").css('color', 'red');
            } else {
            	$("#text_length").css('color', 'green');
            }
            	
            
            
        });
        
        $('#profile_picture').click(function(){
        	$(this).next().click();
        })
        
        const file = document.querySelector('input[type=file]');
        file.addEventListener('input', function () {
        	$('#profile_picture')[0].src = "resources/img/" + this.files[0].name;
        	$('#profile_picture').css("width", "500px");
        	$('#profile_picture').css("height", "auto");
        	$('#profile_picture').css("background-size", "cover");
        })
        
        const form = document.querySelector('form');
        $('#next_btn').click(() => {
        	
        	if ($('#title').val() == "") {
        		alert("제목을 입력해주세요");
        	} else if ($('#title').val().length < 5) {
				alert("제목을 5자이상 써주세요");
        	} else {
	        	form.submit();
        	}
        })
    </script>
</body>
</html>