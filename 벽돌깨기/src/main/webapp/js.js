alert("로그인 성공!");
window.location.href = "index2.jsp";


function bu2() {
	var test = document.data;
	if(test.pa1 == test.pa2){
		return true;
	}else{
		alert("비밀번호가 다릅니다");
		test.pa2.focus();
		return false;
	}
}
