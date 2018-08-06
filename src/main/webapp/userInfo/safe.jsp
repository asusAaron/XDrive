<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<style>
.content{
   padding:5%;
}
.block{
   margin-left:10%;
   padding:0% 0% 3% 0%;
}
input[type="password"]{
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
input[type="submit"]{
   width:auto;
   margin-left:200px;
   padding: 9px 30px;
   background: #617798;
   border: 0;
   font-size: 14px;
   color: #FFFFFF;
}
label {   
   color: #000000;
}
</style>
<body>
<div class="content">
<form>
   <div class="block">
      <label>修改密码:&emsp;</label>
      <input type="password" />
   </div>
   <div class="block">
      <input type="submit" value="确认" />
   </div>
</form>
</div>
</body>
</html>