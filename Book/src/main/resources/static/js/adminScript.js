

//도서 등록 유효성 검사
	function bookInsertCheck(){
	
 		if(document.getElementById("title").value == ""){
 			alert("책 제목을 입력하세요");
 			document.getElementById("title").focus();
 			return false;
 		}if(document.getElementById("writer").value == ""){
 			alert("저자를 입력하세요");
 			document.getElementById("writer").focus();
 			return false;
 		}if(document.getElementById("publisher").value == ""){
 			alert("출판사를 입력하세요");
 			document.getElementById("publisher").focus();
 			return false;
 		}if(document.getElementById("reg_date").value == ""){
 			alert("출판일을 입력하세요");
 			document.getElementById("reg_date").focus();
 			return false;
 		}
 		
 		return true;
 	}
 	

function allCheck(){
	if(document.getElementById("totalCheck").checked == true){
		for(var i = 0; i < document.getElementsByName("rcheck").length; i++){
			document.getElementsByName("rcheck")[i].checked = true;
		}
	}else{
		for(var i = 0; i < document.getElementsByName("rcheck").length; i++){
			document.getElementsByName("rcheck")[i].checked = false;
		}
	}
	
}
