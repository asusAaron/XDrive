<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>
    <link rel="stylesheet" href="http://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css">
	<script src="http://cdn.bootcss.com/jquery/2.1.1/jquery.min.js"></script>
	<script src="http://cdn.bootcss.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
<style type="text/css">
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
  /*  font-style:italic; */
    }
.top-div{
height:15%;

}
.center-div{
  float:left;
  width:100%;
  height:70%;
  position:relative;
}
.demo{
  font-size:20px;
  width:800px;
  height:400px;
  position:absolute;
  top:50%;
  left:50%;
  margin-top:-198px;/*div高度的一半*/
  margin-left:-380px;/*div宽度的一半*/
  text-align:center;
  -moz-opacity:0.5;
  opacity:0.5;
  -khtml-opacity: 0.5;
}
.bottom{
  float:left;
  width:100%;
  height:15%;
  background-color:#585858;
  -moz-opacity:0.7;
  opacity:0.7;
  -khtml-opacity: 0.7;
}
.right-input{
    margin-top:3.8%;
    margin-left:86%;
    position:absolute;
    over-flow:hidden;
}

.right{
padding-left:85%;
padding-top:3%;
}
.about-us{
font-size:30px;
font-color:white;
font-style:italic;
padding-top:3%;
padding-left:48%;
text-shadow:#FF0000 0 0 10px;
}
</style>
<body>
<!-- 引用特效 鼠标移动到页面其他页面的线条自动向鼠标靠拢 特效颜色为蓝色    -->
<script type="text/javascript" color="0,0,255" opacity='0.7' zIndex="-2" count="99"
 src="//cdn.bootcss.com/canvas-nest.js/1.0.1/canvas-nest.min.js"></script>
 
<!-- 顶部布局  -->
<div class="top-div">
     <span class="right-input">
      <a href="login.jsp"style="color:white;">返回登录</a>&nbsp;&nbsp;&nbsp;&nbsp;
      <a href="sign.jsp"style="color:white">返回注册</a>&nbsp;&nbsp;&nbsp;&nbsp;
   </span>
<div class="about-us">about us</div>
</div>
<!-- 中间布局 -->
<div class="center-div">
   <div class="demo">
      <div id="myCarousel" class="carousel slide">
	     <ol class="carousel-indicators">
		   <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
		   <li data-target="#myCarousel" data-slide-to="1"></li>
		   <li data-target="#myCarousel" data-slide-to="2"></li>
	     </ol>   
	     <div class="carousel-inner">
		    <div class="item active">
			   <img src="image/aboutus.jpg" alt="First slide"
			        style="width:810px;height:400px;border-radius: 4px;">
			   <span style="position: absolute; top: 0; left: 0;">
			   
			   </span>		
		    </div>
		    <div class="item">
			   <img src="image/background3.jpg" alt="First slide"
			        style="width:810px;height:400px;border-radius: 4px;">
			   <span style="position: absolute; top: 0; left: 0; color: #000000;">
                   <b>
                   <h3 style="color:black;">团队介绍:</h3>
			       <p>------------------------------------------------------------------------------
				    ---------------------------------------------------------------------------------
			       </p>
			       <p>刘一凡（技术担当，和龚宇祥谈笑风生）</p>
			       <p>龚宇祥（技术担当，平日喜爱钻研代码）</p>
			       <p>吕超（颜值担当，前端大佬，审美与众不同）</p>
			       <p>张作森（各位的小弟，端茶送水，打打杂）</p>
			       <p>马涛（?????????????????）</p>
			       <p>贾柯（世外高人？）</p>
                   </b>
			   </span>
		    </div>
		    <div class="item">
			   <img src="image/background1.jpg" alt="First slide" 
			        style="width:810px;height:400px;border-radius: 4px;">
                <span style="position: absolute; top: 0; left: 0; color: #000000;">
                   <b>
                   <h3 style="color:black;">联系我们:</h3>
			       <p>------------------------------------------------------------------------------
				    ---------------------------------------------------------------------------------
			       </p>
			       <p align="left">Q  Q: 1121637908</p>
			       <p align="left">微信: ??????????</p>
			       <p align="left">微博: ??????????</p>
                   </b>
                   <img src="image/wechat.jpg" style="width: 130px; height:130px ">
			   </span>
		    </div>
	        </div>
	            <a class="left carousel-control" href="#myCarousel" role="button" data-slide="prev">
	               <span class="glyphicon glyphicon-chevron-left" aria-hidden="true">
	               </span>
	            </a>

	           <a class="right carousel-control" href="#myCarousel"
	              style="padding-left:20%;margin-right:0;" role="button" data-slide="next">
	              <span class="glyphicon glyphicon-chevron-right"
	                    style="padding-left:50%;margin-right:0;" aria-hidden="true">
	              </span>
	           </a>
		</div> 
	</div>
</div>
<!-- 底部标签  -->
<div class="bottom">
	<p>@2018 Xdrive <a href="http://iss.whu.edu.cn/">武汉大学计算机学院</a><br>
	@一切解释权归第六队所有
	</p>
</div>
</body>
</html>