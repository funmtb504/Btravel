<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="../css/jquery-ui.min.css" type="text/css">
<script src="http://code.jquery.com/jquery-1.7.1.min.js"></script>
<script type="text/javascript" src="../js/jquery-ui.min.js"></script>
<script type="text/javascript">

    $(document).ready(function(){

        $("#mydate").datepicker({
        	
            dateFormat: 'yy-mm-dd',	//날짜 포맷이다. 보통 yy-mm-dd 를 많이 사용하는것 같다.
            prevText: '이전 달',	// 마우스 오버시 이전달 텍스트
            nextText: '다음 달',	// 마우스 오버시 다음달 텍스트
            closeText: '닫기', // 닫기 버튼 텍스트 변경
            currentText: '오늘', // 오늘 텍스트 변경
            monthNames: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],	//한글 캘린더중 월 표시를 위한 부분
            monthNamesShort: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],	//한글 캘린더 중 월 표시를 위한 부분
            dayNames: ['일', '월', '화', '수', '목', '금', '토'],	//한글 캘린더 요일 표시 부분
            dayNamesShort: ['일', '월', '화', '수', '목', '금', '토'],	//한글 요일 표시 부분
            dayNamesMin: ['일', '월', '화', '수', '목', '금', '토'],	// 한글 요일 표시 부분
            showMonthAfterYear: true,	// true : 년 월  false : 월 년 순으로 보여줌
            changeMonth: true,
            changeYear: true, // 년을 바꿀 수 있는 셀렉트 박스를 표시한다.
            yearSuffix: '년',	//
            showButtonPanel: true,	// 오늘로 가는 버튼과 달력 닫기 버튼 보기 옵션
            showOn: "button",
            showAnim: "slide",
          	buttonImage: "http://jqueryui.com/resources/demos/datepicker/images/calendar.gif",	// 조그만한 아이콘 이미지
            buttonImageOnly: true,	// input 옆에 조그만한 아이콘으로 캘린더 선택가능하게 하기
        });
    });

</script>
<script type="text/javascript">

function start() {
	
	var date = document.getElementById("mydate").value;
	var timeleft = 5;
	
	if(date == "") {
		alert("이벤트 기간을 선택하세요")
		return false;
	}
	
	$.ajax("adminPopStart.jsp", {
		data: {day: date},
		success: function() {
			
		}
	});
	
	var downloadTimer = setInterval(function(){
		
	  document.getElementById("countdown").innerHTML = "시작까지 "+timeleft+" 초 남았습니다!";
	  timeleft -= 1;
	  
	  if(timeleft <= -1){
	    clearInterval(downloadTimer);
	    document.getElementById("countdown").innerHTML = "START!"
	    opener.location.reload();
		setInterval(function () {
			close();
		},1000)		
	  }
	}, 1000);
	

	
		
	
 	
}
function end() {
	
	$.ajax("adminPopEnd.jsp", {
		success: function() {
			
		}
	});
	setInterval(function() {
		opener.location.reload();
		close();
	},1000)
	
}
</script>
</head>
<body>
<h1>관리자</h1>

이벤트기간(일) <input type="text" id="mydate" ><br><br>
<input type="button" value="시작" onclick="return start()">
<input type="button" value="종료" onclick="end()"><br><br>
<div id="countdown"></div>
</body>
</html>