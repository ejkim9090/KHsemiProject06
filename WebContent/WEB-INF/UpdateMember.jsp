<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>
<body>
    <form action="update.do" method="POST" id="updatefrm">
        <div>
	        <h1>회원정보 수정</h1>
	        <label>아이디</label><br>
	        <input type="text" value="사용자ID" readonly><br>
	        <label>비밀번호</label><br>
	        <input type="password"><br>
	        <label>비밀번호 확인</label><br>
	        <input type="password"><br>
	        <label>이름</label><br>
	        <input type="text"><br>
	        <label>전화번호</label><br>
	        <input type="text">
	        <input type="button" value="인증"><br>
	        <input type="text">
	        <input type="button" value="확인"><br>
	        <label>이메일</label><br>
	        <input type="email"><br>
	        <input type="checkbox">예약/이벤트 메일을 수신하시겠습니까?<br>
	        <label>주소</label><br>
	        <input type="text" placeholder="우편번호"><br>
	        <input type="text" placeholder="상세주소"><br>
	        <input type="text" placeholder="나머지"><br>
	        <!-- 카카오맵 api -->
			
			<!-- 
	        <p>관심운동선택</p>
	        <input type="radio" value="aaa">
	        <input type="radio" value="aaa">
	        <input type="radio" value="aaa"><br>
	        <input type="radio" value="aaa">
	        <input type="radio" value="aaa">
	        <input type="radio" value="aaa"><br>
	        <input type="radio" value="aaa">
	        <input type="radio" value="aaa">
	        <input type="radio" value="aaa"><br>
	        <input type="radio" value="aaa">
	        <input type="radio" value="aaa">
	        <input type="radio" value="aaa">
	        <a>radio모양변경 및 버튼안에 내용추가</a><br>
	         --> 
	
	        <input type="button" value="수정">
	        <!-- 수정후 마이페이지 -->
        </div>
    </form>

</body>
</html>