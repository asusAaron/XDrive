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
p{
    margin-top:2%;
    text-align:center;
    font-size:15px;
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
   background-color:#C8C8C8;
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
    background-color:#C8C8C8;
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
.center-div{
   float:left;
   height:75%;
   width:100%;
}
.sreach{
   line-height:28px;
   width:1000px;
   margin-top:3%;
   margin-left:5%;
   border-radius:1px;
   color:black;
}
.after-serach{
   line-height:28px;
   width:80px;
   border-radius:4px;
   color:black;
}
.qiuck-sreach{
   margin-top:2%;
   font-size:15px;
   color:black;
}
.bottom{
      float:left;
      width:100%;
      height:15%;
      background-color:	#080808;
      -moz-opacity:0.7;
      opacity:0.7;
      -khtml-opacity: 0.7;
}

</style>
<body>
<!-- 引用特效 鼠标移动到页面其他页面的线条自动向鼠标靠拢   -->
<script src="//cdn.bootcss.com/canvas-nest.js/1.0.1/canvas-nest.min.js"></script>
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
<!-- 中间布局 -->
<div class="center-div">
    <input type="text" placeholder="搜索，电影，图片，动漫，音乐......" class="sreach"/><input 
    type="submit"value="XDrive一下" class="after-serach" />
<table class="table"style="table-layout:fixed;word-break:break-all;margin-top:2%;border-collapse:collapse;
   color:black;">
	  <thead>
		<tr>
			<th colspan="2">
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
		    
		    <input type="submit" value="下载" class="btn btn-primary"
                   style="margin-left:2%;heigth:10px;width:50px;line-height:8px;"/>
		   
		    <input type="submit" value="分享" class="btn btn-primary"
                   style="margin-left:2%;heigth:5px;width:50px;line-height:8px;"/>
		    </span>
		    <td id="size">
		    4
		    </td>
		    <td id="time">
		    1120-5-44
		    </td>
		</tr>
		<tr id="text2" onmouseover="show(this.id)" onmouseout="noshow(this.id)">
			<td >
			<span>
				<input type="checkbox" name="checkbox">
			</span>
		        <span>a.jpg</span>
		    </td>
		    <td>
		       <span id="button2" hidden="hidden">
		    
		    <input type="submit" value="下载" class="btn btn-primary"
              style="margin-left:2%;heigth:10px;width:50px;line-height:8px;"/>
		   
		    <input type="submit" value="分享" class="btn btn-primary"
              style="margin-left:2%;heigth:5px;width:50px;line-height:8px;"/>
		    </span>
		    </td>
		    
		    <td id="filesize">
		    1
		    </td >
		    <td id="time">
		    1110-11-12
		    </td>
		</tr>
		<!-- 底端加一个直线完成表格封装  -->
		<tr><td></td><td></td><td></td><td></td></tr>
	</tbody>
</table>
    
</div>
  <!-- 底部布局 -->
 <div class="bottom">
   <p>@2018 Xdrive <a href="http://iss.whu.edu.cn/">武汉大学计算机学院</a><br>
	    @一切解释权归第六队所有
   </p>
</div> 
</body>
<script type="text/javascript">
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
</script>
</html>