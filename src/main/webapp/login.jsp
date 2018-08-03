<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>login</title>
    <link rel="stylesheet" href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css">  
	<script src="https://cdn.bootcss.com/jquery/2.1.1/jquery.min.js"></script>
	<script src="https://cdn.bootcss.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
<style>
body,html{
      margin: 0;
      padding: 0;
      height: 100%;
      color: #fff;
}
body{
     background:url("image/logo1.jpg");
}
p{
    margin-top:2%;
    text-align:center;
    font-size:15px;
    font-style:italic;
}
input{
     height:20px;
}
input::-webkit-input-placeholder{
     color:white;
     font-family:"楷体"STHeiti,"Microsoft YaHei",微软雅黑,"MicrosoftJhengHei",华文细黑,MingLiu;
     font-size:15px;
}
.left-text{
     text-align:center;
     font-size:25px;
     margin-top:20px;
     margin-left:2%;
}
.left {
      float:left;
      width: 33%;
      height: 85%;
}
.center {
      -moz-opacity:0.9;
      opacity:0.9;
      -khtml-opacity: 0.9;
      float:left;
      width: 33%;
      height: 85%;
}
.right {
      float:left;
      width:33%;
      height:85%;
}
.bottom{
      float:left;
      width:100%;
      height:15%;
      background-color:	#585858;
      -moz-opacity:0.7;
      opacity:0.7;
      -khtml-opacity: 0.7;
}
.login{
     margin-top:2%;
     margin-left:2%;
     color:white;
     font-size:20px;
     font-style:italic;
}
.logintext{
      display:none;
      margin-top:30%;
      margin-left:2%;
      margin-right:2%;
      height:80%;
}
.logintext-input{
      margin-top:2%;
      color:white;
      border:none #FFFFFF;
	  border-bottom:#777777 solid 1px;
      background:transparent;
      width:70%;
      height:30px;
}
.verify{
      margin-top:2%;
      color:white;
      border:none #FFFFFF;
	  border-bottom:#777777 solid 1px;
      background:transparent;
      width:42%;
      height:30px;
}
.inputstyle{
      margin-top:8%;
      margin-left:10%;
}
.logintext-submit{
     margin-top:10%;
     margin-left:10%;
}
.logintext-create{
     margin-top:8%;
     margin-left:50%;
     font-size:15px;
}
a{
     text-decoration: none;
}
a:link{
     color: blue;
}
a:visited{
    color: blue;
}
a:hover{
    color: gray;
}
a:active{
    color: red;
}
.back{
    margin-top:10%;
    margin-left:60%;
}
  </style>

<body onload="add()">
<!-- 布局分为4块 上面分为3块底部1块  上面高度85%底部高度15% 上面平分为3块 左中右-->
<!-- 布局左边  -->
<div class="left">
   &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
   <img src = "image/logo.png" style= "width:82px; heigth:70px">
   <span class="left-text"><br>XDrive Disk</span>
</div>
<!-- 中间布局 -->
<div class="center">
   <form id="login" class="logintext" name="myForm">
         <!-- 邮箱 -->
       <div class="inputstyle">
          <span class="glyphicon glyphicon-user"></span>&nbsp;&nbsp;
          <input type="text" name="email" placeholder="邮箱" id="email" class="logintext-input" onBlur="validateForm()" />
       </div>
       <p id="checkEmailInputResult"></p>
       <div class="inputstyle">
          <span class="glyphicon glyphicon-lock"style="color:white"></span>&nbsp;&nbsp;
          <input type="password" placeholder="密码" name="password" class="logintext-input"></input>
       </div>
          <!-- 验证码 -->
       <div class="inputstyle">
          <input type="text" placeholder="验证码" name="verifycode" class="verify" />&nbsp;&nbsp;
		  <a href="javascript:change()"><img src="VerifyCodeServlet" id="verify" border="0">
		  </a>
       </div>
       <div class="logintext-submit"><input type="submit" value="Sign up" class="btn btn-danger"
            style="width:310px;box-shadow: 0px 10px 5px #888888;height:100%;"/> 
          <p id="msg"></p>
       </div>
       <div class="logintext-create">
          <a href="sign.jsp">没有账号 ？ 立即注册！</a>
       </div>
   </form>   
</div>
<!-- 右边布局 -->
<div class="right">
   <div class="back">
      <a href="aboutUs.jsp"style="color:white">关于我们</a>&nbsp;&nbsp;&nbsp;&nbsp;
      <a href="#"style="color:white">项目介绍</a>
   </div>
</div>
<!-- 底部布局  -->
<div class="bottom">
   <p>@2018 Xdrive <a href="http://iss.whu.edu.cn/">武汉大学计算机学院</a><br>
	    @一切解释权归第六队所有
   </p>
</div>
</body>

<script type="text/javascript">

//延迟出现登录界面
$(function () { $("[data-toggle='tooltip']").tooltip(); });
function add(){
	//延迟0.5秒弹出登录页面
	setTimeout("add1()", 500);
}
function add1(){
	 var temp = document.getElementById('login');
	 temp.style.display = 'block';
}
//浏览器刷新验证码
function changeImg(img){
	img.src = img.src+"?time="+new Date().getTime();
}
//邮箱验证
function validateForm(){
	  var x=document.forms["myForm"]["email"].value;
	  var atpos=x.indexOf("@");
	  var dotpos=x.lastIndexOf(".");
	  if (atpos<1 || dotpos<atpos+2 || dotpos+2>= x.length){
		document.getElementById("checkEmailInputResult").style.color='red';
		document.getElementById("checkEmailInputResult").innerHTML="不是正确的邮箱类型!";
	  }
}
</script>
</html>