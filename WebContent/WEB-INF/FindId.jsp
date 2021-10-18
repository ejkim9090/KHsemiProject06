<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <link rel="stylesheet" href="<%=request.getContextPath() %>/css/findIdPw.css" />
</head>
	<body>
	<%@ include file="./Header.jsp" %>
    	<form action="findId.do" id="frm">
        	<fieldset>
            	<div id="title">
                	<h1>ID/PW찾기</h1>
            </div>	
            	<div id="selectBtn">
                	<input type="button" id="findIdBtn" class="selectBtn" value="아이디" style="background-color: #95c2b7; color: oldlace;">
                	<input type="button" id="findPwBtn" class="selectBtn" value="비밀번호" onclick="location.href='findPw'"><br>
            	</div>	
            <div id="all">
                <div id="nameBox">
                    <label>이름</label><br>
                    <input type="text" id="uName" placeholder=" 이름을 입력하세요."><br>
                </div>
                <div id="cellNumBox">
                    <label>이메일 인증</label><br>
                    <input type="email" id="uEmail" placeholder=" 회원가입시 이메일을 입력하세요.">
                    <input type="button" id="send" value="전송"><br>
                    <input type="text" id="authentication" placeholder=" 인증코드를 입력하세요.">
                </div>
            </div>
            <div id="findBtn">
                <input type="button" id="find" value="찾기">
            </div>
            
        </fieldset>
    </form>
    <%@ include file="./Footer.jsp" %>
	</body>
	<script>
            $(function(){
                $("#send").on("click", function(){
                	if($("#uName").val()==""){
                        alert("이름을 입력해 주세요.");
                        $("#uName").focus;
                        return false;
                    }
                	if($("#uEmail").val()==""){
                        alert("이메일을 입력해 주세요.");
                        $("#uEmail").focus;
                        return false;
                    }
                	sendEmail();
                });
                function sendEmail() {
                    $.ajax({
                        type: "post",
                        url: "findId.do",
                        data: {
                            m_name: $("#uName").val(),
                            m_email: $("#uEmail").val()
                        },
                        dataType: "json",
                        success: function(data) {
                            if(data.result == "ok"){
                                console.log(data.result);
                                alert("인증메일이 발송되었습니다.")
                            }else{
                                console.log(data.result);
                                alert("회원정보가 맞지않습니다.")
                            }
                        },
                        error : function(request, status, error){
                            console.log(request)
                            console.log(status)
                            console.log(error)
                            
                            }
                    });
                };
            });
            $(function(){
                $("#find").on("click", function(){
                	if($("#authentication").val()==""){
                        alert("인증코드를 입력해주세요.");
                        $("#authentication").focus;
                        return false;
                    }
                	findId();
                });
                function findId() {
                	$.ajax({
                		type: "post",
                		url: "showId",
                		data: {
                			m_name: $("#uName").val(),
                			m_email: $("#uEmail").val(),
                			verCode: $("#authentication").val()
                		},
                		dataType: "json",
                		success: function(data) {
							if(data.result == "ok"){
								console.log(data.result);
								alert(data.msg);
								location.href="login";
							}else{
								console.log(data.msg);
								alert(data.msg);
								
							}
						},
						 error: function(request, status, error){
							 	console.log(request)
	                            console.log(status)
	                            console.log(error)
	                            alert("오류가 발생하였습니다.");
	                            
						 }
                	});
                };
            });
        </script>
</html>