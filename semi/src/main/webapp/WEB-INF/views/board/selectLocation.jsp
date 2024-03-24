<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="resources/css/selectLocation.css?after">
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
            <div class="content_text">어디서 만날까요?</div>
			<form action="${ contextPath }/selectDateTime.bo" method="POST">
				<input type="hidden" name="category" value="${ category }">
				<input type="hidden" name="clubName" value="${ club.clubName }">
				<input type="hidden" name="backgroundImage" value="${ club.backgroundImage }">
				<input type="hidden" name="content" value="${ club.content }">
				<input type="hidden" name="addr" value="" id="addr">
				
				<div id="layer" style="display:none;overflow:hidden; border: 1px solid black">
					<img src="//t1.daumcdn.net/postcode/resource/images/close.png" id="btnCloseLayer" style="cursor:pointer;position:absolute;right:-3px;top:-3px;z-index:1" onclick="closeDaumPostcode()" alt="닫기 버튼">
				</div>
				<div id="map" style="width:300px;height:300px;margin-top:10px;display:none"></div>
				
			</form>
		</div>
		
	</div>
	<script src="//dapi.kakao.com/v2/maps/sdk.js?appkey=9c62ca505829e0dd7e63dce27d3b4eae&libraries=services"></script>
	<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
    <script>
		    var element_layer = document.getElementById('layer');
		    var mapContainer = document.getElementById('map'), // 지도를 표시할 div
	        mapOption = {
	            center: new daum.maps.LatLng(37.537187, 127.005476), // 지도의 중심좌표
	            level: 5 // 지도의 확대 레벨
	        };

		    //지도를 미리 생성
		    var map = new daum.maps.Map(mapContainer, mapOption);
		    //주소-좌표 변환 객체를 생성
		    var geocoder = new daum.maps.services.Geocoder();
		    //마커를 미리 생성
		    var marker = new daum.maps.Marker({
		        position: new daum.maps.LatLng(37.537187, 127.005476),
		        map: map
		    });
		    let addr = "";
	        new daum.Postcode({
	            oncomplete: function(data) {
					addr = data.address;
					let extraAddr = "";
					if(data.buildingName !== "") {
						extraAddr = data.buildingName;
					}
					addr += " (" + extraAddr + ")";
					document.getElementById('addr').value = addr;
	            	// 주소로 상세 정보를 검색
	                geocoder.addressSearch(data.address, function(results, status) {
	                    // 정상적으로 검색이 완료됐으면
	                    if (status === daum.maps.services.Status.OK) {

	                        var result = results[0]; //첫번째 결과의 값을 활용

	                        // 해당 주소에 대한 좌표를 받아서
	                        var coords = new daum.maps.LatLng(result.y, result.x);
	                        // 지도를 보여준다.
	                        mapContainer.style.display = "block";
	                        map.relayout();
	                        // 지도 중심을 변경한다.
	                        map.setCenter(coords);
	                        // 마커를 결과값으로 받은 위치로 옮긴다.
	                        marker.setPosition(coords)
	                    }
	                })
	            },
	        }).embed(element_layer, {
	        	autoClose: false
	        });

	        element_layer.style.display = 'block';
			
	        document.getElementById('next_btn').addEventListener('click', () => {
	        	if(addr !== "") {
		        	document.querySelector('form').submit();
	        	} else {
	        		alert("만날 위치를 선택해주세요");
	        	}
	        
	        })
	        	
    </script>
</body>
</html>