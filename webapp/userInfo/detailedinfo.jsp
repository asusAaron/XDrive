<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>

</head>
<style>

body,html{
   position:relative;
   width:100%;
   height:100%;
   color:#000000;
}
.content{
   padding:0% 4%;
}
.content p{
   font-family:"Trebuchet MS", Arial, Helvetica, sans-serif;
   font-size:22px; 
   margin:1% 8%;
   color:#000000;
}
.img{
   position: relative;
   float:left;
   width:30%;
   height:100%;
}
.img .imgtext {    
    width:100%;
    position: absolute;
    bottom: 1px;
    font-size: 18px;
    background:#000000;
    opacity:0.3;
}
.img .imgtext:hover{
   opacity:0.7;
}
.img .imgtext p{
    text-align: center;
    color:#FFFFFF;
    opacity:1;
}
.img .image{
   width:100%;
   height: 300px;

}


.text{
   float:left;
   width:70%;
   height:100%;

}
.block{
   margin-left:10%;
   padding:0% 0% 3% 0%;
}
select{
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
input[type="text"],input[type="date"]{
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
input[type="textarea"]{
   padding: 8px;
   border: solid 1px #E5E5E5;
   outline: 0;
   font: normal 13px/100% Verdana, Tahoma, sans-serif;
   width: 300px;
   height:80px;
   background: #FFFFFF;
   color:#000000;
   box-shadow: rgba(0, 0, 0, 0.1) 0px 0px 8px;
   -moz-box-shadow: rgba(0, 0, 0, 0.1) 0px 0px 8px;
   -webkit-box-shadow: rgba(0, 0, 0, 0.1) 0px 0px 8px;    
}
input[type="submit"]{
   width:auto;
   margin-left:60px;
   padding: 9px 30px;
   background: #617798;
   border: 0;
   font-size: 14px;
   color: #FFFFFF;
}
input:hover,input:focus { 
   border-color: #8470FF; 
}
label {   
   color: #000000;
}

.my_box{
	width:150px;
	height:150px;
	overflow: hidden;
	border-radius:15px;
	border:1px solid #ccc;
    position: relative;
	left:0;
	right:0;
	top:0;
	bottom:0;
	margin:auto;
	transition: .6s;
	cursor: pointer;
}
.my_box:hover{
	animation:my_box 0.5s forwards;
	transition: .5s;
}
@keyframes my_box{
	form{
		transform: rotate(0deg);
	}
	to{
		transform: rotate(360deg);
	}
}
.my_box img{
	width:100%;
}

.xiantiao{
	display: block;
	width:95%;
	height:1px;
	border-bottom: 1px solid #ccc;
	margin:0 auto;
}

.pic_box{
	position: fixed;
	width:700px;
	height:400px;
    padding:0px 10px;
	border-radius:8px;
	background: #fff;
	border:1px solid #ccc;
    top:-1000px;
	left:0;
	right:0;
	margin:0 auto;
}
.header{
	height:35px;
	text-align: center;

}


.close{
	color:#000;
    font-size: 40px;
    line-height: 1;
	text-shadow: 0 1px 0 #fff;
    opacity: .2;
    position:absolute;
    right:8px;
    top:2px;
    cursor: pointer;
}

.pic_box .limg{
   float:left;
   height:300px;
   width:50%;

   border-right:1px solid #ccc;
}
.pic_box .rimg{
   float:left;
   height:300px;
   width:48%;
}

.pic_box .limg img{
   margin:20px;
   height:280px;
   width:280px;
}


.pic_box ul{
	padding: 0px;
	margin:0;
	width:96%;

	margin:10px auto;
}
.pic_box ul li{
	display: block;
	list-style: none;
	width:61px;
	height:61px;
	float: left;
	border-radius: 15%;
	border:1px solid #ccc;
	margin:5px 5px;
	transition: .6s;
	cursor: pointer;
	overflow: hidden;
}
.pic_box ul li:hover{
	transform: scale(1.15);
	transition: .5s;
}
.pic_box ul li img{
	width:100%;
}
.bt_box{

	width: 100%;
	text-align: center;
	font-size: 14px;

}
.bt_box .gb{
	display:inline-block;
	width:120px;
	height:35px;
	border-radius: 8px;
	background:#f3f3f3;
	color:#444;
	line-height: 35px;
}
.bt_box .queren{
	display: inline-block;
	width:120px;
	height:35px;
	border-radius: 8px;
	background:#4B8BF5;
	color:#fff;
	line-height: 35px;
}

#file
{
    width:100%;
    height:50px;
    opacity:0;
    cursor:pointer;
    position:absolute;
}

</style>

<body>

<div class="content">
   <p class="p">个人资料-详细信息</p>
<div class="img">
    <div class="my_box">
		<form id="uploadForm">
			<input class="jide" name="imgsrc" type="hidden" value="" />
			<img src="../image/a1.png" class="my_pic">
		</form>
    </div>
    <div class="pic_box" id="pic_box">
		<div class="header">
			<p >设置头像</p>
			<span class="close">x</span>
		</div>
		<span class="xiantiao"></span>
		<div class="limg">
		    <img class="big_pic" src="../image/a1.png">
		</div>
		<div class="rimg">
        <ul id= "imgul">
			<li><img src="../image/a1.png"></li>
			<li><img src="../image/a2.png"></li>
			<li><img src="../image/a3.png"></li>
			<li><img src="../image/a4.png"></li>

			<li><input type="file" accept="image/*" id="file" value="" /><img src="../image/8.png"></li>
		</ul>
		</div>
		
		<div class="bt_box">		    
			<a class="gb" href="javascript:">关闭</a>
			<a class="queren" href="javascript:">保存头像</a>
		</div>
	</div>  
</div>

<div class="text">
   <form>
      <div class="block">
         <label>&emsp;用户名：&emsp;</label>
         <input type="text" name="u_account"     class="nav"  placeholder="请输入账户"/>
      </div>
      <div class="block">
         <label>&emsp;&emsp;姓名：&emsp;</label>
         <input type="text" name="u_name"    class="nav"  placeholder="请输入姓名"/>
      </div>
      <div class="block">
         <label>&emsp;&emsp;性别：&emsp;</label>      
         <select name="i_sex"  >
            <option>男</option>
            <option>女</option>
            <option selected="selected">未知</option>
         </select>
      </div>
      <div class="block">
         <label>&emsp;&emsp;生日：&emsp;</label>
         <input type="date" name="i_birthday"    class="nav" >
      </div>
      <div class="block">
         <label>&emsp;&emsp;住址：&emsp;</label>
         <input type="text" name="i_location"  maxlength="25"  class="nav"  placeholder="请输入住址"/>
      </div>
      <div class="block">
         <label>&emsp;&emsp;工作：&emsp;</label>
         <select name="i_job">
            <option selected="selected">选择职业</option>
            <option>学生</option>
            <option>公务员</option>
            <option>医疗</option>
            <option>计算机</option>
            <option>其他职业</option>
         </select>
      </div>
      <div class="block">
         <label>&emsp;&emsp;学校：&emsp;</label>
         <input type="text" name="i_school"    class="nav"  placeholder="请输入学校"/>
      </div>
      <div class="block">
         <label>&emsp;&emsp;公司：&emsp;</label>
         <input type="text" name="i_company"    class="nav"  placeholder="请输入公司"/>
      </div>
      <div class="block">
         <label>&emsp;&emsp;签名：&emsp;</label>
         <input type="text" name="i_signature" maxlength="25" class="nav"  placeholder="编辑个人签名"/>
      </div>
      <div class="block">
         <input type="submit" value="保存" />
      </div>          
   </form>
   
    
</div>
</div>
</body>
<script type="text/javascript" src="js/jquery.min.js"></script>
<script type="text/javascript">
	$(".close,.gb").click(function(){
		$(".pic_box").animate({
			'top':'-1000px'
		},500);
	}),
	$(".my_box").click(function(){
		$(".pic_box").animate({
			'top':'70px',
		},300);
	}),
	$(".queren").click(function(){
		var src = $(".jide").val();

		//效果展示,在服务器中把这一段删除,用上面那一段
		if(src != ""){
			$(".my_pic").attr('src',src);
			$(".pic_box").animate({
				'top':'-1000px'
			},500);
		}else{
			return false;
		}
		
	});
	var $box = document.getElementById('pic_box');
	var ul=document.getElementById("imgul");
	var liList = ul.getElementsByTagName('li');
	var index = 0;
	for(var i=0;i<liList.length-1;i++){
		liList[i].index=i;
		liList[i].onclick=function(){
			liList[index].style.borderRadius="15%";
			this.style.borderRadius="50%";
			index = this.index;
		}
	}
	$(".pic_box li img").click(function(){
		var src=$(this).attr("src");
		$(".jide").val(src);
		$(".big_pic").attr('src',src);
	})
	
document.getElementById("file").addEventListener("change",function(e){
	var files = this.files;			
	var img = new Image();
	var render  = new FileReader();
	render.readAsDataURL(files[0]);
	render.onload = function(){
		img.src = this.result;
		img.style.height = "100%";
		img.style.width = "100%";

		var li=document.createElement("li");
		li.innerHTML="";
		li.appendChild(img);
		ul.appendChild(li);
		//将倒数第二个图片放到最后面


		var length=liList.length;
		var newList=[];
		for(var i=0;i<length;i++){
			newList[i]=liList[i];
		}
        var newli=newList[length-1];
        newList[length-1]=newList[length-2];
        newList[length-2]=newli;

        for(var i=0;i<length;i++){
            ul.appendChild(newList[i]);
        }
    	for(var i=0;i<liList.length-1;i++){
    		liList[i].index=i;
    		liList[i].onclick=function(){
    			liList[index].style.borderRadius="15%";
    			this.style.borderRadius="50%";
    			index = this.index;
    		}
    	}
    	$(".big_pic").appendChild(img);
        
        
   };
});
</script>
</html>