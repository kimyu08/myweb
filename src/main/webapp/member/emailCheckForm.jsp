<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>emailCheckForm.jsp</title>
</head>
<body>
	<div style="text-align: center">
		<h3>* 이메일 중복확인 *</h3>
		<form action="emailCheckProc.jsp" onsubmit="return blankCheck()">
			이메일: <input type="email" name="email" id="email" maxlength="20" autofocus>
				  <input type="submit" value="중복확인">
		</form>
	</div>
	
	<script>
		function blankCheck(){
			var id=document.getElementById("email").value;
			id=id.trim();
			if(id.length<5){
				alert("이메일은 5글자 이상 입력해 주세요");
				return false;
			}//if end
			return true;
		}//blankCheck end
	</script>
</body>
</html>