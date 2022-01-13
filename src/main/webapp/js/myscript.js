/* myscript.js */

function bbsCheck(){//게시판 유효성 검사
	//1)작성자 2글자 이상 입력
	var wname=document.getElementById("wname").value;//작성자 가져오기
	wname=wname.trim(); //좌우 공백 제거
	if(wname.length<2){
		alert("작성자 2글자 이상 입력해주세요");
		document.getElementById("wname").focus();//작성자 칸에 커서
		return false;//전송하지 않음
	}//if end
	//2)제목 2글자 이상 입력
	var subject=document.getElementById("subject").value;//제목 가져오기
	subject=subject.trim(); //좌우 공백 제거
	if(subject.length<2){
		alert("제목을 2글자 이상 입력해주세요");
		document.getElementById("subject").focus();//제목 칸에 커서
		return false;//전송하지 않음
	}//if end
	
	//3)내용 2글자 이상 반드시 입력
	var content=document.getElementById("content").value;//내용 가져오기
	content=content.trim(); //좌우 공백 제거
	if(content.length<2){
		alert("내용을 2글자 이상 입력해주세요");
		document.getElementById("content").focus();//내용 칸에 커서
		return false;//전송하지 않음
	}//if end
	
	//4)비밀번호 4글자 이상이면서 숫자형 기호만 입력.
	var passwd=document.getElementById("passwd").value;//비밀번호 가져오기
	passwd=passwd.trim(); //좌우 공백 제거
	if(passwd.length<4 || isNaN(passwd)){
		alert("비밀번호를 4글자 이상 숫자로 입력 해주세요");
		document.getElementById("passwd").focus();//비밀번호 칸에 커서
		return false;//전송하지 않음
	}//if end
	
}

function pwCheck(){
	//비밀번호 4글자 이상이면서 숫자형 기호만 입력.
	var passwd=document.getElementById("passwd").value;//비밀번호 가져오기
	passwd=passwd.trim(); //좌우 공백 제거
	if(passwd.length<4 || isNaN(passwd)){
		alert("비밀번호를 4글자 이상 숫자로 입력 해주세요");
		document.getElementById("passwd").focus();//비밀번호 칸에 커서
		return false;//전송하지 않음
	}//if end
	
	var message="진행된 내용은 복귀되지 않습니다.\n계속 진행할까요?";
	if(confirm(message)){//확인을 누르면 true, 취소 false
		return true; //서버로 전송		
	}else{
		return false;
	}//if end
}//pwcheck end


 function searchCheck(){
	//검색어를 입력해야만 서버로 전송
	var word=document.getElementById("word").value;
	word=word.trim();
	if(word.length==0){
		alert("검색어를 입력해 주세요");
		return false;
	}//if end
	return true;
}//searchCheck end
        
function loginCheck(){
	//로그인에 관련된 유효성 검사.
	
	//아이디 5~10글자 이냉니지 검사
	var id=document.getElementById("id").value;//내용 가져오기
	id=id.trim(); //좌우 공백 제거
	if(!(id.length>=5 && id.length<=10)){
		alert("아이디를 5~10자리 입력해주세요");
		document.getElementById("id").focus();//내용 칸에 커서
		return false;//전송하지 않음
	}//if end
	
	//비밀번호 5~10글자 이냉니지 검사
	var passwd=document.getElementById("passwd").value;//내용 가져오기
	passwd=passwd.trim(); //좌우 공백 제거
	if(!(passwd.length>=5 && passwd.length<=10)){
		alert("비밀번호를 5~10자리 입력해주세요");
		document.getElementById("passwd").focus();//내용 칸에 커서
		return false;//전송하지 않음
	}//if end
	return true;
}//loginCheck end


function idCheck(){//아이디 중복 확인
	//bootstrap 모달창
	//부모창과 자식창이 한몸으로 구성되어 있음
	//참조: https://www.w3schools.com/bootstrap/bootstrap_modal.asp
	
	//새창 만들기
	//부모창과 자식창이 별개로 구성되어있다.
	//모바일에 기반을 둔 frontend 단에는 사용하지 말것.
	//window.open("파일명","새창이름","다양한 옵션들")
	window.open("idCheckForm.jsp","idwin","width=400,height=350");
	
	
}//idCheck end


function emailCheck(){//이메일 중복 확인
	//새창 만들기
	//부모창과 자식창이 별개로 구성되어있다.
	//모바일에 기반을 둔 frontend 단에는 사용하지 말것.
	//window.open("파일명","새창이름","다양한 옵션들")
	window.open("emailCheckForm.jsp","emailwin","width=400,height=350");
	
	
}//emailcheck end

function memberCheck(){ //회원가입 유효성 검사
  //1)아이디 5~10글자 인지?
	var id=document.getElementById("id").value;//내용 가져오기
	id=id.trim(); //좌우 공백 제거
	if(!(id.length>=5 && id.length<=10)){
		alert("아이디를 5~10자리 입력해주세요");
		document.getElementById("id").focus();//내용 칸에 커서
		return false;//전송하지 않음
	}//if end
  //2)비밀번호 5~10글자 인지?
  var passwd=document.getElementById("passwd").value;//내용 가져오기
	passwd=passwd.trim(); //좌우 공백 제거
	if(!(passwd.length>=5 && passwd.length<=10)){
		alert("비밀번호를 5~10자리 입력해주세요");
		document.getElementById("passwd").focus();//내용 칸에 커서
		return false;//전송하지 않음
	}//if end
  //3)비밀번호와 비밀번호확인이 서로 일치하는지?
	var repasswd=document.getElementById("repasswd").value;//내용 가져오기
	repasswd=repasswd.trim(); //좌우 공백 제거
	if(passwd!=repasswd){
		alert("비밀번호 2개를 똑같이 입력해 주세요.");
		document.getElementById("passwd").focus();//내용 칸에 커서
		return false;//전송하지 않음
	}//if end

  //4)이름 두글자 이상 인지?
  var mname=document.getElementById("mname").value;//작성자 가져오기
	mname=mname.trim(); //좌우 공백 제거
	if(mname.length<2){
		alert("이름을 2글자 이상 입력해주세요");
		document.getElementById("mname").focus();//작성자 칸에 커서
		return false;//전송하지 않음
	}//if end
  //5)이메일 5글자 인지?
	var email=document.getElementById("email").value;//내용 가져오기
	email=email.trim(); //좌우 공백 제거
	if(email.length<5){
		alert("email을 5글자 이상 입력해주세요");
		document.getElementById("email").focus();//내용 칸에 커서
		return false;//전송하지 않음
	}//if end
  //6)직업을 선택했는지?
	var job=document.getElementById("email").value;
	if(job=="0"){
		alert("직업 선택해 주세요");
		return false;
	}//if end
	
	return true;//서버로 전송
}//memberCheck end


function findIDCheck(){	//아이디/비번 찾기 유효성 검사
	//4)이름 두글자 이상 인지?
  var mname=document.getElementById("mname").value;//작성자 가져오기
	mname=mname.trim(); //좌우 공백 제거
	if(mname.length<2){
		alert("이름을 2글자 이상 입력해주세요");
		document.getElementById("mname").focus();//작성자 칸에 커서
		return false;//전송하지 않음
	}//if end
  //5)이메일 5글자 인지?
	var email=document.getElementById("email").value;//내용 가져오기
	email=email.trim(); //좌우 공백 제거
	if(email.length<5){
		alert("email을 5글자 이상 입력해주세요");
		document.getElementById("email").focus();//내용 칸에 커서
		return false;//전송하지 않음
	}//if end
	
	return true;
}


function pdsCheck(){
	//이름
	var wname=document.getElementById("wname").value;//작성자 가져오기
	wname=wname.trim(); //좌우 공백 제거
	if(wname.length<2){
		alert("작성자 2글자 이상 입력해 주세요.");
		document.getElementById("wname").focus();//작성자 칸에 커서
		return false;//전송하지 않음
	}//if end
	
	//제목
	var subject=document.getElementById("subject").value;//제목 가져오기
	subject=subject.trim(); //좌우 공백 제거
	if(subject.length<2){
		alert("제목을 2글자 이상 입력해주세요");
		document.getElementById("subject").focus();//제목 칸에 커서
		return false;//전송하지 않음
	}//if end
	
	//비밀번호
	var passwd=document.getElementById("passwd").value;//비밀번호 가져오기
	passwd=passwd.trim(); //좌우 공백 제거
	if(passwd.length<4 || isNaN(passwd)){
		alert("비밀번호를 4글자 이상 숫자로 입력 해주세요");
		document.getElementById("passwd").focus();//비밀번호 칸에 커서
		return false;//전송하지 않음
	}//if end
	
	//첨부파일
	//확장명이 이미지파일(png,jpg,gif만 허용)
	var filename=document.getElementById("filename").value;
	filename=filename.trim();
	if(filename.length==0){
		alert("첨부 파일을 선택하세요");
		return false;
	}else{
		//filename변수값에서 마지막.의 순서값을 알아와
		var dot=filename.lastIndexOf(".");
		//확장명: 마지막.이후 문자열 자르기
		var ext=filename.substr(dot+1);
		//확장명을 전부 소문자로 치환
		ext=ext.toLowerCase();
		
		if(ext=="png" || ext=="jpg" || ext=="gif"){
			return true;
		}else{
			alert("이미지 파일만 첨부 가능합니다.");
			return false;
		}//if end
		
	}//if end
	
	
	
}//pdsCheck() end





