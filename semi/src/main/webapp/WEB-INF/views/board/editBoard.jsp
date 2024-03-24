<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판 수정</title>
<link href="resources/css/editBoard.css" rel="stylesheet">
</head>
<body>
	<div class="wrap">
			<!-- 1. 인트로-->
				<div class="intro">
					<!--[1-1] nav바(HOME, SEARCH, ABOUT, SIGN IN)-->
					<jsp:include page="/WEB-INF/views/common/selectNav.jsp"></jsp:include>
				</div>
				
	    <h1>게시판 수정</h1>
	
	        <div class='form-0'>
	
	            <form class='form-1' action="write_process_board.php" method="POST" enctype="multipart/form-data"> 
	                <input class='write-1' type="text" name="title" maxlength="44" value="글 제목" placeholder="제목 입력, 최대 44자까지 가능합니다">
	                <hr>
	                <textarea class='write-2' name="detail" rows="20" cols="20" maxlength="3000" placeholder="내용 작성,최대 3000자 가능합니다">글 내용</textarea>
	                <hr>
	                <input class='write-3' type="file" name="file" id="fileToUpload">
	                <hr>
	
	                <input class='write-4' type="submit" value="수정하기">
	                <input type="hidden" name='board_id' value="<?php echo $row['board_id']; ?>"><!--글번호 가져오기-->
	            
	            </form>
	        </div>
		</div><!--'class="wrap"'닫는 div-->
</body>
</html>