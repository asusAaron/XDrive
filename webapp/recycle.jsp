<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>
    <link rel="stylesheet" href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css">
	<script src="https://cdn.bootcss.com/jquery/2.1.1/jquery.min.js"></script>
	<script src="https://cdn.bootcss.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
<style>
body,html{
   margin: 0;
   padding: 0;
   width:100%;
   height: 100%;
   color:white;
}
body{
   z-index:0;
   position:relative;
}
.image{
   width:82px; 
   heigth:40px;
}
.top-div{
   float:left;
   height:10%;
   width:88%;
   -moz-opacity:0.9;
   opacity:0.9;
   -khtml-opacity: 0.9;
   background-color:#B0C4DE;
   z-index:1; 
}
.top-logo{
   float:left;
   font-size:25px;
   color:black;
   margin-top:2%;
}
.top-image{
   float:left;
}
.top-rightdiv{
    -moz-opacity:0.9;
    opacity:0.9;
    -khtml-opacity: 0.9;
    float:right;
    height:10%;
    width:12%;
    margin-left:88%;
    background-color:#B0C4DE;
    z-index:999; 
    position:absolute
}
.top-text{
   float:left;
   margin-left:10%;
   font-size:20px;
   color:white;
   margin-top:2%;
   
}
.top-welcome{
   float:left;
   margin-left:30%;
   margin-top:2%;
   font-size:20px;
   color:black;
}
.left-div{
   float:left;
   height:90%;
   width:14%;
   background-color:#909090;
   -moz-opacity:0.9;
   opacity:0.9;
   -khtml-opacity: 0.9;
   z-index:1;
   background-color:#B0C4DE;
}
.page-div{
   position:relative;
   float:left;
   height:90%;
   width:86%;
   background-color:#FFFAF0 ; 
   -moz-opacity:0.9;
   opacity:0.9;
   -khtml-opacity: 0.9;
   z-index:1;
   border: 2px solid #B0C4DE;
}
.a-margin{
   padding-left:24%;
}
.page-input{
   margin-top:2%;
}
.page-span{
   color:black;
   margin-left:3%;
   position:absolute;
}
.page-table{
   margin-top:4%;
   color:black;
   position:absolute;
}
.black_overlay{  
  display: none;  
  position: absolute; 
  top: 0%;
  left: 0%; 
  width: 100%;  
  height: 100%;  
  background-color: black; 
  z-index:1001;  
  -moz-opacity: 0.5; 
  opacity:.30;  
  filter: alpha(opacity=80); 
 } 
.white_content {  
  display: none; 
  position: absolute;
  top: 25%;  
  left: 25%;  
  width: 50%;  
  height: 50%; 
  padding: 16px;
  border: 8px solid #B0C4DE; 
  border-radius:10px;
  background-color: white;
  z-index:1002;  
  overflow: auto;  
} 
.show-a{
    text-decoration:none;
}
</style>
<body>
     <!--顶部左端   -->
<div class="top-div">
  <form name="myForm1" method="post">
     <div class="top-image">
     <img src = "image/logo.png" class="image">
     </div>
     <div class="top-logo"><b>XDrive Disk</b></div>
  <div class="top-text"
       style=" margin-left:14%;"> 
     <a href="home.jsp">网盘</a>
  </div>
  <div class="top-text"> 
     <a href="#">分享</a>
  </div>
  <div class="top-text"> 
     <a href="search.jsp">搜索</a>
  </div>
  <div class="top-welcome">欢迎您:</div>
  </form>
</div>
   <!--顶部右端   -->
<div class="top-rightdiv"style="padding-top:1.5%;">
  <form name="myForm2" method="post">
  <div class="dropdown"style="z-index:100;position:absolute">
      <button type="button" class="btn dropdown-toggle" id="dropdownMenu1" data-toggle="dropdown"
              style="border:none #FFFFFF;border-bottom:#777777 solid 1px;background:transparent;font-size:18px;">  
                张作霖<span class="caret"></span>
      </button>
      <ul class="dropdown-menu"style="z-index:100;position:absolute">


            <li>
                <a href="userInfo/userInfo.jsp#detailedinfo">
                   <span class="glyphicon glyphicon-home"></span>&nbsp;个人资料
                </a>
            </li>
            		    <li>
		        <a href="userInfo/userInfo.jsp#safe">
		           <span class="glyphicon glyphicon-cog"></span>&nbsp;设置
		        </a>
		    </li>
			<li>
			    <a href="home.jsp"> 
			       <span class="glyphicon glyphicon-book"></span>&nbsp;主页
			    </a>
			</li>
			<li class="divider"></li>
			<li>&nbsp;&nbsp;&nbsp;&nbsp;
			    <button type="button" style="float:center;"id="btnClose"
			            class="btn btn-primary btn-sm">退出
			    </button>
			</li>
		</ul>
    </div>
    </form>
</div>
<!-- 左边布局  -->
<div class="left-div" style="z-index:1;position:relative">
    <form name="myForm3" method="post">
    <ul class="nav nav-pills nav-stacked"style=" background-color:#B0C4DE;margin-top:10%;">
	    <li class="active">
	        <a href="#">
	           <span class="glyphicon glyphicon-list-alt">
	           </span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;全部文件
	        </a>
	    </li>
	    <li>
	        <a href="#"><span class="a-margin">图片</span>
	        </a>
	    </li>
	    <li>
	        <a href="#"><span class="a-margin">视频</span>
	        </a>
	    </li>
	    <li>
	        <a href="#"><span class="a-margin">文档</span>
	        </a>
	    </li>
	    <li>
	        <a href="#"><span class="a-margin">音乐</span>
	        </a>
	    </li>
	    <li>
	        <a href="#"><span class="a-margin">其它</span>
	        </a>
	    </li>
	    <li>
	        <a href="#">
	        <span class="glyphicon glyphicon-circle-arrow-right"></span>
	              &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;我的分享
	        </a>
	    </li>
	    <li>
	        <a href="recycle.jsp">
               <span class="glyphicon glyphicon-trash"></span>
	                 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;回收站
	        </a>
	    </li>
   </ul>
   </form>
</div>
<!-- 中间内容部分布局  -->
<div class="page-div"style="z-index:1;position:relative">
  <form name="myForm4" method="post">
  <div class="page-input">
       <span class="page-span">提示：回收站显示最近15天删除的文件</span> 
       <input type="submit" value="文件恢复" class="btn btn-primary"
              style="margin-left:70%;heigth:22px;width:80px;position:absolute;"/>     
       <input type="submit" value="清空回收站" class="btn btn-primary"
              style="margin-left:80%;heigth:22px;width:100px; position:absolute;"/>
  </div>
  <!-- 表格 -->
<div class="page-table">
   <table class="table table-bordered"style="table-layout:fixed;word-break:break-all;">
	  <thead>
		<tr>
			<th>
			  <span>
				 <input type="checkbox" id="boxId" onclick="selectALLNO();">
			  </span>
			  <a href="#">文件名
                 <span class="glyphicon glyphicon-arrow-down"></span>
              </a>
			</th>
			<th>
			  <a href="#">大小
                 <span class="glyphicon glyphicon-arrow-down"></span>
              </a>
            </th>
			<th>
			  <a href="#">修改日期
                 <span class="glyphicon glyphicon-arrow-down"></span>
              </a>
			</th>
		</tr>
	</thead>
	<tbody>
		<tr id="text1" onmouseover="show(this.id)" onmouseout="noshow(this.id)">
			<td>
			<span>
				<input type="checkbox" name="checkbox">
			</span>
		        <span>a.jpg</span>
		    </td>
		    <td>
		    <span id="button1" hidden="hidden">
		    
		    <input type="submit" value="恢复" class="btn btn-primary"
                   style="margin-left:2%;heigth:10px;width:50px;line-height:8px;"/>
		   
		    <input type="submit" value="删除" class="btn btn-primary"
                   style="margin-left:2%;heigth:5px;width:50px;line-height:8px;"/>
		    </span>
		    </td >
		    <td id="time">
		    </td>
		</tr>
		<tr id="text2" onmouseover="show(this.id)" onmouseout="noshow(this.id)">
			<td>
			<span>
				<input type="checkbox" name="checkbox">
			</span>
		        <span>a.jpg</span>
		    </td>
		    <td>
		    <span id="button2" hidden="hidden">
		    
		    <input type="submit" value="恢复" class="btn btn-primary"
              style="margin-left:2%;heigth:10px;width:50px;line-height:8px;"/>
		   
		    <input type="submit" value="删除" class="btn btn-primary"
              style="margin-left:2%;heigth:5px;width:50px;line-height:8px;"/>
		    </span>
		    </td >
		    <td id="time">
		    </td>
		</tr>
	</tbody>
</table>
</div>
</form>
</div>
</body>

<script type="text/javascript">

/***复选框操作开始 ***************************************/
function selectALLNO() {
    // 获取要操作的复选框
    var box1=document.getElementById("boxId");
    //checked判断是否选中
    if(box1.checked==true)
    {
        selectAll();
    }
    else
    {
        SelectNO();
    }
}
function selectAll() {
    // 获取要操作的复选框
    var box1=document.getElementsByName("checkbox");
    //checked判断是否选中
    for(var x=0;x<box1.length;x++)
    {
        var value1=box1[x];
        value1.checked=true;
    }
}
function SelectNO(){
    // 获取要操作的复选框
    var box2 = document.getElementsByName("checkbox");
     //checked判断是否选中
   for (var x = 0; x < box2.length; x++) {
       var value1=box2[x];
       value1.checked=false;
    }
}
/***复选框操作结束***************************************/

//搜索操作 
function searchValue() { 
	//input值
	var input =document.getElementById("inputtext").value;
	//td数量
	var box1=document.getElementsByName("checkbox");
	for(var i=1;i<=box1.length;i++){
		//td的id
		var str="text"+i;
		//td文本
		var a = document.getElementById(str).innerText;
		if(a.search(input)== -1){
			document.getElementById(str).style.display= "none "; 
		}
		else{
			document.getElementById(str).style.display= ""; 
		}
	}
} 
//上传文件
function F_Open_dialog() 
{ 
document.getElementById("btn_file").click(); 
}
//打开弹窗
function openbox(){
	document.getElementById('light').style.display='block';
    document.getElementById('fade').style.display='block';
}
//关闭弹窗 
function closebox(){
	document.getElementById('light').style.display='none';
    document.getElementById('fade').style.display='none';	
}
//鼠标移动到列表上面显示下载和分享 
function show(a){
	var str = a;
	//获取字符串中的数字 
	s="" ;
	for(i=0;i<str.length;i++)  
	{ 
	if("0123456789".indexOf(str.substr(i,1))>-1) 
	s+=str.substr(i,1) 
	} 
	var temp="button"+s;
	var box1=document.getElementsByName("checkbox");
	if(box1[parseInt(parseInt(s)-parseInt(1))].checked==true){
	    document.getElementById(temp).style.display="block";
	}
}
function noshow(a){
	var str = a;
	//获取字符串中的数字 
	s="" ;
	for(i=0;i<str.length;i++)  
	{ 
	if("0123456789".indexOf(str.substr(i,1))>-1) 
	s+=str.substr(i,1) 
	} 
	var temp="button"+s;
	document.getElementById(temp).style.display="none";
}
</script>
</html>