<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<style>
body{
   width:100%;
   height:100%;
   position:absolute;
}


.content{
   height:100%;
   width:100%;
   margin-top:100px;
}

iframe{
   width:100%;
   height:500px;
   border:solid 0px;

}
</style>
<body>

<div class="content">
   <iframe src="safe2.jsp" id="iframe" name="i">
   
   </iframe>   
</div>
</body>
<script>
function jumpsafe2(){
	document.getElementById("iframe").src = "safe2.jsp"
}
function jumpsafe3(){
	document.getElementById("iframe").src = "safe3.jsp"
}
function jumpsafe4(){
	document.getElementById("iframe").src = "safe4.jsp"
}
</script>
</html>