<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<style>
input[type="text"]{
   padding: 8px;
   border: solid 1px #E5E5E5;
   outline: 0;
   font: normal 13px/100% Verdana, Tahoma, sans-serif;
   width: 200px;
   background: #FFFFFF;
   color:#000000;
   box-shadow: rgba(0, 0, 0, 0.1) 0px 0px 8px;
   -moz-box-shadow: rgba(0, 0, 0, 0.1) 0px 0px 8px;
   -webkit-box-shadow: rgba(0, 0, 0, 0.1) 0px 0px 8px;    
}
input[type="button"]{
   width:auto;
   padding: 9px 30px;
   background: #617798;
   border: 0;
   font-size: 14px;
   color: #FFFFFF;
}
input:hover,input:focus { 
   border-color: #8470FF; 
}
.content{
   margin-left:30%;
   margin-top:5%;
}
</style>
<body>

<div class="content">
   <p> 输入新密码：</p>
   <form id="password" action="" method="post">
      <input type="text" name="name"/>
     
   </form> 
   <br>
   <input type="button" onclick="passwordSubmit()" value="提交">
</div>
</body>
<script>
function jumpsafe4(){
	parent.jumpsafe4();
}
function passwordSubmit(){
	document.getElementById("password").submit();
	alert("密码设置成功！即将返回登录界面");
	parent.location.href = '../login.jsp';
	
}
</script>
</html>