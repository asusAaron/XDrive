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
    background-color: white !important;
   position:relative;
}
.image{
   width:82px; 
   heigth:40px;
}
.top-div {
    display: flex;
    flex-direction: row;
    align-items: center;
    height: 10%;
    width: 100%;
    -moz-opacity: 0.9;
    opacity: 0.9;
    -khtml-opacity: 0.9;
    background-color: #eff4f8;
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


}
.a-margin{
   padding-left:24%;
}
.page-input{
   margin-top:2%;
}
.page-table{
   margin-top:2%;
   color:black;
}

.userinfo{
 
}

.userinfo-list{
   float:left;
   width:10%;
   height:90%;
   background-color:#FFFFFF; 
}

.userinfo-text{
   margin: 2% 0% ; 
   position:relative;
   float:left;
   width:90%;
   height:90%;
   background-color:#FFFFFF; 
}
</style>
<body>
<!-- 顶部   -->
<div class="top-div">
    <div class="top-image">
        <img src="../img/logo.png" class="image">
    </div>
    <div class="top-logo"><b>XDrive Disk</b></div>
    <div class="top-text"
         style=" margin-left:15%;">
        <a href="../home.jsp">网盘</a>
    </div>
    <div class="top_line"></div>
    <div class="top-text">
        <a href="#">分享</a>
    </div>
    <div class="top_line"></div>
    <div class="top-text">
        <a href="#">搜索</a>
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
                        <a href="userInfo.jsp#detailedinfo">
                            <span class="glyphicon glyphicon-home"></span>&nbsp;个人资料
                        </a>
                    </li>
                    <li>
                        <a href="userInfo.jsp#safe">
                            <span class="glyphicon glyphicon-cog"></span>&nbsp;设置
                        </a>
                    </li>
                    <li>
                        <a href="../home.jsp">
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

<div class="page-div"  >
<div class="userinfo">
<div class="userinfo-list">
  <ul class="nav nav-pills nav-stacked" id="userMenu" style="background-color:white;">
    <li class="active"><a><span>个人资料</span></a></li>
    <li class="current" data-id="detailedinfo"><a><span>详细信息</span></a></li>
    <li class="active"><a><span>隐私设置</span></a></li>
    <li data-id="safe"><a><span>更改密码</span></a></li>
  </ul>

</div>
<div class="userinfo-text"></div>
</div>
</div>

</body>
<script>

$(function(){
	  $("#userMenu").on("click", "li", function(){
	    var sId = $(this).data("id"); //获取data-id的值
	    window.location.hash = sId; //设置锚点
	    loadInner(sId);
	  });
	  function loadInner(sId){
	    var sId = window.location.hash;
	    var pathn, i;
	    switch(sId){
	      case "#detailedinfo": pathn = "detailedinfo.jsp"; i = 0; break;
	　　　    case "#safe": pathn = "safe.jsp";i = 1; break;
	　　　　　　 
	    }
	    $(".userinfo-text").load(pathn); //加载相对应的内容
	    $("#userMenu li").eq(i).addClass("current").siblings().removeClass("current"); //当前列表高亮
	  }
	  var sId = window.location.hash;
	  loadInner(sId);
	});
</script>
 

 
</html>