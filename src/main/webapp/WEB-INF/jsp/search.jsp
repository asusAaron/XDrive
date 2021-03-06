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
	<link href="css/search.css" rel="stylesheet" type="text/css">
</head>
<style>
body, html {
    margin: 0;
    padding: 0;
    width: 100%;
    height: 100%;
}

body {
    z-index: 0;
    background-color: #eff4f8 !important;
    /*position: relative;*/
}

.image {
    width: 82px;
    height: 40px;
}

.top-div {
    display: flex;
    flex-direction: row;
    align-items: center;
    height: 10%;
    width: 88%;
    -moz-opacity: 0.9;
    opacity: 0.9;
    -khtml-opacity: 0.9;
    background-color: #eff4f8;
    position:relative;
    z-index: 1;
}

.top-logo {
    font-size: 25px;
    color: black;
}

.top-image {
}

.top-rightdiv {
    -moz-opacity: 0.9;
    opacity: 0.9;
    -khtml-opacity: 0.9;
    margin-left: 25%;
    height: 30%;
    width: 12%;
    background-color: #eff4f8;
}

.btn_top_right
{
    border:none;
    background:transparent;
    font-size:15px;
}


.top-text {
    margin-left: 5%;
    font-size: 20px;
    color: white;
}

.top_line
{
    margin-left: 5%;
    height: 30%;
    width: 1px;
    background-color: #2e6da4;

}

.top-welcome {
    float: left;
    margin-left: 30%;
    margin-top: 2%;
    font-size: 20px;
    color: black;
}
.center-div{
   text-align:center;
   float:left;
   height:75%;
   width:100%;
   text-align:center;
   background-color:white;
}
.center-title{
   folat:left;
   position:relative;
   margin-top:6%;
   color:black;
}
.xd{
   font-size:40px;
   color:#FF0000;
}
.xd-rive{
   font-size:40px;
   color:green;
}
.xd-disk{
   font-size:40px;
   color:#3300FF;
}
.xd-search{
   font-size:40px;
   color:#FF9900;
}
.sreach{
   line-height:28px;
   width:1000px;
   margin-top:3%;
   margin-left:2%;
   border-radius:1px;
   color:black;
}
.after-serach{
   margin-top:3%;
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

<!-- 顶部   -->
<div class="top-div">
        <div class="top-image">
            <img src="../../img/logo.png" class="image">
        </div>
        <div class="top-logo"><b>XDrive Disk</b></div>
        <div class="top-text"
             >
            <a href="home">网盘</a>
        </div>
        <div class="top_line"></div>
        <div class="top-text">
            <a href="#">分享</a>
        </div>
        <div class="top_line"></div>
        <div class="top-text">
            <a href="search">搜索</a>
        </div>
    <!--顶部右端   -->
    <div class="top-rightdiv">
        <form name="myForm2" method="post">
            <div class="dropdown" style="z-index:100;position:absolute">
                <button type="button" class="dropdown-toggle btn_top_right" id="dropdownMenu1" data-toggle="dropdown">
                    张作霖<span class="caret"></span>
                </button>
                <ul class="dropdown-menu" style="z-index:1000;position:absolute">
                    <li>
                        <a href="userInfo #detailedinfo">
                            <span class="glyphicon glyphicon-home"></span>&nbsp;个人资料
                        </a>
                    </li>
                    <li>
                        <a href="userInfo #safe">
                            <span class="glyphicon glyphicon-cog"></span>&nbsp;设置
                        </a>
                    </li>
                    <li>
                        <a href="home">
                            <span class="glyphicon glyphicon-book"></span>&nbsp;主页
                        </a>
                    </li>
                    <li class="divider"></li>
                    <li>&nbsp;&nbsp;&nbsp;&nbsp;
                        <button type="button" style="float:left;" id="btnClose"
                                class="btn btn-primary btn-sm">退出
                        </button>
                    </li>
                </ul>
            </div>
        </form>
    </div>
</div>
<!-- 中间布局 -->
<div class="center-div">
   <div class="center-title">
   <b>
       <span class="xd">XD</span><span class="xd-rive">rive</span><span class
       ="xd-disk">云盘</span><span class="xd-search">搜索</span>
   </b>
   </div>
    <input type="text" placeholder="搜索，电影，图片，动漫，音乐......" class="sreach"/><a href="searchResult"><input
    type="submit"value="XDrive一下" class="after-serach" /></a>
    <div class="qiuck-sreach">
    <input type="submit"value="百度网盘" class="btn btn-info"
           style="border: 1px solid #B0C4DE;"  />
           
    <input type="submit"value="zip" class="btn btn-info"
           style="border: 1px solid #B0C4DE;"   />
           
    <input type="submit"value="你的名字" class="btn btn-info"
           style="border: 1px solid #B0C4DE;"  />
           
    <input type="submit"value="三国杀" class="btn btn-info"
           style="border: 1px solid #B0C4DE;"  />
           
    <input type="submit"value="西游记之大圣娶亲" class="btn btn-info" 
           style="width:140px;border: 1px solid #B0C4DE;" />
           
    <input type="submit"value="钢铁是怎么炼成的" class="btn btn-info" 
           style="width:140px;border: 1px solid #B0C4DE;" />
           
    <input type="submit"value="九品芝麻官" class="btn btn-info" 
           style="width:140px;border: 1px solid #B0C4DE;" />              
    </div>
</div>
  <!-- 底部布局 -->
 <div class="bottom">
   <p>@2018 Xdrive <a href="http://iss.whu.edu.cn/">武汉大学计算机学院</a><br>
	    @一切解释权归第六队所有
   </p>
</div> 
</body>
</html>