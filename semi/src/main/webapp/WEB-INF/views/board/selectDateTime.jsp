<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <link rel="stylesheet" href="resources/css/selectDateTime.css?after">
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
            <form action="${ contextPath }/selectMeeting.bo" method="POST">
            	<input type="hidden" name="clubScheduleOG" value="" id="clubScheduleOG">
            	<input type="hidden" name="category" value="${ category }">
            	<input type="hidden" name="clubName" value="${ club.clubName }">
            	<input type="hidden" name="content" value="${ club.content }">
            	<input type="hidden" name="backgroundImage" value="${ club.backgroundImage }">
            	<input type="hidden" name="addr" value="${ club.addr }">
            	
	            <div class="content_text">언제 만날까요?</div>
	            <div class="calendar_ctn">
	                <div class="ctn_heading">
	                    <img src="resources/img/calendar.png">
	                    <div id="date">yyyy-mm-dd</div>
	                </div>
	                <div class="calendar">
	                    <table>
	                        <div id="cal_select">
	                            <div id="year_month">11</div>
	                            <div><img src="resources/img/back_page_disabled.png" id="back" class="disabled"></div>
	                            <div><img src="resources/img/next_page.png" id="next"></div>
	                        </div>
	                    </table>
	                </div>
	            </div>
	            <div class="calendar_ctn">
	                <div class="ctn_heading">
	                    <img src="resources/img/clock.png">
	                    <span id="am_pm"></span>
	                    <div id="time">11:11</div>
	                </div>
	                <div class="time_select">
	                    <input type="radio" name="am_pm" id="am" value="오전"></radio>
	                    <label for="am">오전</label>
	                    <input type="radio" name="am_pm" id="pm" value="오후"></radio>
	                    <label for="pm">오후</label>
	
	
	                    <input type="number" name="hour" id="hour" min="1" max="12" maxlength="2">시
	                    <input type="number" name="mins" id="mins" min="0" max="50" step="10" value="0" maxlength="2">분
	                </div>
	            </div>
     	    </form>
        </div>

    </div>

    <script>
        window.onload = () => {
            $("#hour").val((date.getHours() % 12));
            if (date.getHours() / 12 > 1) {
                $("#pm").prop("checked", true);
                $("#am_pm").text("오후");
            } else {
                $("#am").prop("checked", true);
                $("#am_pm").text("오전");

            }
            setMonthAndDate(date);
            setYearAndMonth(date);
            setTime(date);
            setCalendar(date);
            disableTds();
            $(".ctn_heading").click(function () {
                $(this).nextAll().slideToggle(200);
            });
        }

        let date = new Date();
        date.setMinutes(0);
        date.setHours(date.getHours() + 1);
        let finalDate = date;
        console.log("처음 날짜 : " + finalDate);
        
        let maxDate = new Date();
        maxDate.setDate(maxDate.getDate() + 60);

        const getDaysInMonth = (date) => {
            return new Date(date.getFullYear(), date.getMonth() + 1, 0).getDate();
        }

        const setCalendar = (date) => {
            const calendarMonth = new Date(date.getFullYear(), date.getMonth(), 1);
            const firstDay = calendarMonth.getDay();
            daysInMonth = getDaysInMonth(date);
            let innnerHTML = "<tr><th>일</th><th>월</th><th>화</th><th>수</th><th>목</th><th>금</th><th>토</th></tr >";
            const trsNeeded = Math.floor((daysInMonth + firstDay) / 7) + 1;
            let count = 1;
            let start = false;
            for (let i = 1; i <= trsNeeded; i++) {
                innnerHTML += "<tr>";
                for (let j = 0; j < 7; j++) {
                    innnerHTML += "<td>";
                    if (start && count <= daysInMonth) {
                        innnerHTML += count++;
                    } else {
                        if (j == firstDay && count <= daysInMonth) {
                            innnerHTML += count++;
                            start = true;
                        }
                    }
                    innnerHTML += "</td>";
                }
                innnerHTML += "</tr>";
            }
            $("table")[0].innerHTML = innnerHTML;
        }

        const getYoil = (weekday) => {
            let yoil;
            switch (weekday) {
                case 0: yoil = "일"; break;
                case 1: yoil = "월"; break;
                case 2: yoil = "화"; break;
                case 3: yoil = "수"; break;
                case 4: yoil = "목"; break;
                case 5: yoil = "금"; break;
                case 6: yoil = "토"; break;
            }
            return yoil;
        }

        const setMonthAndDate = (date) => {
            const monthAndDate = date.getMonth() + 1 + "." + date.getDate() + "(" + getYoil(date.getDay()) + ")";
            $("#date").text(monthAndDate);
        }

        const setYearAndMonth = (date) => {
            const yearAndMonth = date.getFullYear() + " " + (date.getMonth() + 1) + "월";
            $("#year_month").text(yearAndMonth);
        }

        const disableTds = () => {
            const tds = document.querySelectorAll("td");
            const today = new Date();
            for (const td of tds) {
                const tdText = $(td).text();
                if(tdText != ""){
                    const tdDate = new Date(date.getFullYear(), date.getMonth(), tdText);
                    if (tdDate.toDateString() == today.toDateString()) {
                        $(td)[0].classList.add("today");
                        $(td).click(function() {
                            for(const checkTd of tds) {
                                if (checkTd == this) {
                                    finalDate.setDate($(this).text());
                                    finalDate.setMonth(date.getMonth());
                                    setMonthAndDate(finalDate);
                                    $(this)[0].classList.add("selected");
                                } else {
                                    $(checkTd)[0].classList.remove("selected");
                                }
    
                            }
                        });
                    } else if (tdDate < today) {
                        $(td)[0].classList.add("disabled");
                    } else if (tdDate > maxDate) {
                        $(td)[0].classList.add("disabled");
                    } else {
                        $(td).click(function() {
                            for(const checkTd of tds) {
                                if (checkTd == this) {
                                    finalDate.setDate($(this).text());
                                    finalDate.setMonth(date.getMonth());
                                    setMonthAndDate(finalDate);
                                    $(this)[0].classList.add("selected");
                                } else {
                                    $(checkTd)[0].classList.remove("selected");
                                }
    						
                            }
                        });
                    }
                } else {
                    $(td)[0].classList.add("disabled");
                }
            }
        }

        // change arrow event
        $("#next")[0].addEventListener("click", function () {
            if (!$(this).hasClass("disabled")) {
                $("#back")[0].src = "resources/img/back_page.png";
                $("#back")[0].classList.remove("disabled");
                date.setMonth(date.getMonth() + 1);
                setCalendar(date);
                disableTds();
                setYearAndMonth(date);
            }

            if (date.getMonth() == maxDate.getMonth()) {
                $(this)[0].classList.add("disabled");
                $(this)[0].src = "resources/img/next_page_disabled.png";
            }
        });

        $("#back")[0].addEventListener("click", function () {
            if (!$(this).hasClass("disabled")) {
                $("#next")[0].src = "resources/img/next_page.png";
                $("#next")[0].classList.remove("disabled");
                date.setMonth(date.getMonth() - 1);
                setCalendar(date);
                disableTds();
                setYearAndMonth(date);
            }

            if (date.getMonth() == new Date().getMonth()) {
                $(this)[0].classList.add("disabled");
                $(this)[0].src = "resources/img/back_page_disabled.png";
            }
        });

        // time // 
        const setTime = (date) => {
            $("#time").text($("#hour").val() + ":" + String(date.getMinutes()).padStart(2, '0'));
        }

        $("input[type=number]").change(() => {
        	finalDate.setHours($("#hour").val());
        	finalDate.setMinutes($("#mins").val());
            setTime(finalDate);
        });

        $("input[type=radio]").click(function () {
        	if($(this).val() == '오후') {
        		if(finalDate.getHours() <  12) {
        			finalDate.setHours(finalDate.getHours() + 12);
        		}
        	} else {
        		if(finalDate.getHours() > 12) {
        			finalDate.setHours(finalDate.getHours() - 12);
        		}
        	}
            $("#am_pm").text($(this).val());
            
        });

        $("input[type=number]").keyup(function () {
            const max = $(this).attr("max");
            if (parseInt($(this).val()) > parseInt(max)) {
                $(this).val($(this).val().slice(0, -1));
            }
            if(this.id == 'hour'){
            	finalDate.setHours($(this).val());
            } else {
            	finalDate.setMinutes($(this).val());
            }
            if(document.querySelector('input[type=radio]:checked').value == '오후' && $(this).val() < 12) {
            	finalDate.setHours(finalDate.getHours() + 12);
            }
        }).click(function () {
        	 if(this.id == 'hour'){
             	finalDate.setHours($(this).val());
             } else {
             	finalDate.setMinutes($(this).val());
             }
             if(document.querySelector('input[type=radio]:checked').value == '오후' && $(this).val() < 12) {
             	finalDate.setHours(finalDate.getHours() + 12);
             }
        });
        
        
        $("#next_btn").click(()=>{
        	if(finalDate < new Date()) {
        		alert('날짜를 다시 선택해주세요');
        	} else {
        		const form = document.querySelector('form');
        		document.getElementById('clubScheduleOG').value = finalDate.toISOString().replace('T', ' ').substring(0, 19);
        		console.log(document.getElementById('clubScheduleOG').value);
        		form.submit();
        	}
        })

    </script>
</body>

</html>