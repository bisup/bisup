function writeSave() {
	
	if (document.writeform.title.value == "") {
		alert("제목을 입력하십시요.");
		document.writeform.subject.focus();
		return false;
	}
	
	if (document.writeform.pw.value == "") {
		alert("비밀번호를 입력하십시요.");
		document.writeform.content.focus();
		return false;
	}
	 
	if (document.writeform.address.value == "") {
		alert("주소를 입력하십시요.");
		document.writeform.kind.focus();
		return false;
	}
}