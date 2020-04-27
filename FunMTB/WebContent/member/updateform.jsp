<%@page import="member.MemberBean"%>
<%@page import="member.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>join page</title>
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
function check() {
			
	if(document.fr.pass.value.length<3){
		alert("비밀번호는 최소 3글자 이상입니다.");
		document.fr.pass.focus();
		return false;}
	
	if(document.fr.pass.value==""){
		alert("비밀번호를 입력하세요");
		document.fr.pass.focus();
		return false;}
				
	if(document.getElementById("pass1").value!=document.getElementById("pass2").value){
		alert("비밀번호 일치여부를 확인하세요 ");
		document.fr.pass.focus();
		return false;}
	
	if(document.fr.name.value==""){
		alert("이름를 입력하세요");
		document.fr.name.focus();
		return false;}
	
	if(document.fr.name.value.length<2){
		alert("이름은 최소 2글자 이상 입력하세요");
		document.fr.name.focus();
		return false;}
	
	if(document.fr.email.value==""){
		alert("이메일을 입력하세요");
		document.fr.email.focus();
		return false;}
	
	if(document.getElementById("email1").value!=document.getElementById("email2").value){
		alert("이메일 일치여부를 확인하세요 ");
		document.fr.email.focus();
		return false;}
	
	}

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
<jsp:include page="../inc/sub_menu_member.jsp"/>
</ul>
</nav>
<!-- 왼쪽메뉴 -->
<!-- 본문내용 -->
<article>
<h1>등록 정보 수정</h1>
<%
String id=(String)session.getAttribute("id");
MemberDAO mdao = new MemberDAO();
MemberBean mb = mdao.getMember(id);

%>
<form action="updatePro.jsp" id="join" name="fr" method="post" onsubmit="return check()">
<fieldset>
<legend>Basic Info</legend>
<label>User ID</label>
<input type="text" name="id" class="id" id="id" value="<%=mb.getId()%>" readonly> <br>
<label>Password</label>
<input type="password" name="pass" id="pass1"><br>
<label>Retype Password</label>
<input type="password" name="pass2" id="pass2"><br>
<label>Name</label>
<input type="text" name="name" value="<%=mb.getName()%>"><br>
<label>E-Mail</label>
<input type="text" name="email" id="email1" value="<%=mb.getEmail()%>"><br>
<label>Retype E-Mail</label>
<input type="email" name="email2" id="email2"><br>
</fieldset>

<fieldset>
<legend>Optional</legend>
<label>우편번호</label><input type="text" id="sample6_postcode" value="<%=mb.getPostcode()%>" name="postcode">
<input type="button" onclick="sample6_execDaumPostcode()" value="우편번호 찾기"><br>
<label>도로명주소</label><input type="text" id="sample6_address" value="<%=mb.getAddress()%>" name="address"><br>
<label>상세주소</label><input type="text" id="sample6_detailAddress" value="<%=mb.getAddress1()%>" name="address1"><br>
<label>참고사항</label><input type="text" id="sample6_extraAddress" value="<%=mb.getAddress2()%>" name="address2"><br>

<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
    function sample6_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var addr = ''; // 주소 변수
                var extraAddr = ''; // 참고항목 변수

                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    addr = data.roadAddress;
                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    addr = data.jibunAddress;
                }

                // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
                if(data.userSelectedType === 'R'){
                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                        extraAddr += data.bname;
                    }
                    // 건물명이 있고, 공동주택일 경우 추가한다.
                    if(data.buildingName !== '' && data.apartment === 'Y'){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                    if(extraAddr !== ''){
                        extraAddr = ' (' + extraAddr + ')';
                    }
                    // 조합된 참고항목을 해당 필드에 넣는다.
                    document.getElementById("sample6_extraAddress").value = extraAddr;
                
                } else {
                    document.getElementById("sample6_extraAddress").value = '';
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('sample6_postcode').value = data.zonecode;
                document.getElementById("sample6_address").value = addr;
                // 커서를 상세주소 필드로 이동한다.
                document.getElementById("sample6_detailAddress").focus();
            }
        }).open();
    }
</script>



<label>Phone Number</label>
<input type="text" name="phone" value="<%=mb.getPhone()%>"><br>
<label>Mobile Phone Number</label>
<input type="text" name="mobile" value="<%=mb.getMobile()%>"><br>
</fieldset>
<div class="clear"></div>
<div id="buttons">
<input type="submit" value="정보수정" class="submit">
<input type="reset" value="재입력" class="cancel">
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