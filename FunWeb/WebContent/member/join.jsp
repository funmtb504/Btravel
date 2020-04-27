<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="../css/default.css" rel="stylesheet" type="text/css">
<link href="../css/subpage.css" rel="stylesheet" type="text/css">
<!--[if lt IE 9]>
<script src="http://ie7-js.googlecode.com/svn/version/2.1(beta4)/IE9.js" type="text/javascript"></script>
<script src="http://ie7-js.googlecode.com/svn/version/2.1(beta4)/ie7-squish.js" type="text/javascript"></script>
<script src="http://html5shim.googlecode.com/svn/trunk/html5.js" type="text/javascript"></script>
<![endif]-->
<!--[if IE 6]>
 <script src="../script/DD_belatedPNG_0.0.8a.js"></script>
 <script>
   /* EXAMPLE */
   DD_belatedPNG.fix('#wrap');
   DD_belatedPNG.fix('#main_img');   

 </script>
 <![endif]-->
 <script type="text/javascript">
//  	function dupCheck() {
// 		// 아이디 상자가 비어있으면 "아이디 입력하세요" 포커스 
// 		if(document.fr.id.value==""){
// 			alert("아이디 입력하세요");
// 			document.fr.id.focus();
// 			return;
// 		}
// 		// 아이디 입력되어있으면  창열기 join_win.jsp 
// 		wid=document.fr.id.value;
// 		window.open("join_win.jsp?wid="+wid,"","width=300,height=200");
// 	}
 </script>
 <script src="../script/jquery-3.5.0.js"></script>
 <script type="text/javascript">
 $(document).ready(function(){
		$('#join').submit(function(){
			if($("#id").val()==""){
				alert("아이디입력하세요");
				$("#id").focus();
				return false;
			}
			if($("#pass").val()==""){
				alert("비밀번호입력하세요");
				$("#pass").focus();
				return false;
			}
			if($("#name").val()==""){
				alert("이름을 입력하세요");
				$("#name").focus();
				return false;
			}
			if($("#email").val()==""){
				alert("메일입력하세요");
				$("#email").focus();
				return false;
			}
			if($('#gman').is(":checked")==false  && $('#gwoman').is(":checked")==false){
				alert("성별선택하세요");
				$("#gman").focus();
				return false;
			}
			if($('#hob1').is(":checked")==false  && $('#hob2').is(":checked")==false && $('#hob3').is(":checked")==false){
				alert("취미선택하세요");
				$("#hob1").focus();
				return false;
			}
			if($("#age").val()==""){
				alert("나이선택하세요");
				$("#age").focus();
				return false;
			}
		});
		
		//아이디 중복 체크
		$('.dup').click(function(){
			if($('#id').val()==""){
				$('#dupCheck').html("아이디 입력하세요");
				return;
			}
			$.ajax('dupCheck.jsp',{
				data:{id:$('#id').val()},
				success:function(rdata){
					$('#dupCheck').html(rdata);
				}	
			});
		});
		
});
 </script>
</head>
<body>
<div id="wrap">
<!-- 헤더들어가는 곳 -->
<jsp:include page="../inc/top.jsp"/>
<!-- 헤더들어가는 곳 -->

<!-- 본문들어가는 곳 -->
<!-- 본문메인이미지 -->
<div id="sub_img_member"></div>
<!-- 본문메인이미지 -->
<!-- 왼쪽메뉴 -->
<nav id="sub_menu">
<ul>
<li><a href="#">Join us</a></li>
<li><a href="#">Privacy policy</a></li>
</ul>
</nav>
<!-- 왼쪽메뉴 -->
<!-- 본문내용 -->
<article>
<h1>Join Us</h1>
<form action="joinPro.jsp" id="join" name="fr" method="post">
<fieldset>
<legend>Basic Info</legend>
<label>User ID</label>
<input type="text" name="id" class="id" id="id">
<input type="button" value="dup. check" class="dup">
<!-- onclick="dupCheck()" -->
<div id="dupCheck"></div><br>
<label>Password</label>
<input type="password" name="pass"  id="pass"><br>
<label>Retype Password</label>
<input type="password" name="pass2"><br>
<label>Name</label>
<input type="text" name="name"  id="name"><br>
<label>E-Mail</label>
<input type="email" name="email"  id="email"><br>
<label>Retype E-Mail</label>
<input type="email" name="email2"><br>
<label>성별</label>
<input type="radio" name="gen" value="남" id="gman">남성
<input type="radio" name="gen" value="여" id="gwoman">여성<br>
<label>취미</label>
<input type="checkbox" name="hobby" value="여행" id="hob1">여행
<input type="checkbox" name="hobby" value="독서" id="hob2">독서
<input type="checkbox" name="hobby" value="게임" id="hob3">게임<br>
<label>나이</label>
<select name="age" id="age">
	<option value="">선택하세요</option>
	<option value="10">10대</option>
	<option value="20">20대</option>
	<option value="30">30대</option>
	<option value="40">40대 이상</option>
</select>
</fieldset>

<fieldset>
<legend>Optional</legend>
<label>Address</label>
<input type="text" name="address"><br>
<label>Phone Number</label>
<input type="text" name="phone"><br>
<label>Mobile Phone Number</label>
<input type="text" name="mobile"><br>
</fieldset>
<div class="clear"></div>
<div id="buttons">
<input type="submit" value="Submit" class="submit">
<input type="reset" value="Cancel" class="cancel">
</div>
</form>
</article>
<!-- 본문내용 -->
<!-- 본문들어가는 곳 -->

<div class="clear"></div>
<!-- 푸터들어가는 곳 -->
<jsp:include page="../inc/bottom.jsp" />
<!-- 푸터들어가는 곳 -->
</div>
</body>
</html>