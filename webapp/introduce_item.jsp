<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>introduce_item</title>

    <link rel="stylesheet" href="css/base.css">
    <link rel="stylesheet" href="css/animate.min.css">

    <script type="text/javascript" src="js/jquery.min.js"></script>
    <script type="text/javascript" src="js/parameter.js"></script>
    <script type="text/javascript">
        $(function () {
            text({
                str:"项目背景:"+
                "作为大学生，我们平时在生活娱乐和学习中观察到，" +
                "有时候我们需要使用某种资源时，常常需要在网上寻找自" +
                "己没有的资源，但是找到之后有时候没有足够的时间使用" +
                "完，所以我们就需要一些存储工具来帮助我们存储这些暂" +
                "时用不着但是很重要的资源，或者当我们在观看一些电影" +
                "或者视频资源时，忽然发现自己有一些事情导致不能一下" +
                "子看完该视频，这时候就需要一些存储工具来帮助我们存" +
                "储这些视频资源，有时候我们好友之间传递一些资源，但" +
                "是手中没有移动硬盘，这时候上传文件就显得很不方便，" +
                "这时候我们需要一个共同的平台来帮助我们传递这些资源。"+
                "产品介绍:" +
                "XDrive作为一个网络硬盘，可以实现随时随地存储我们的" +
                "资源，当我们想要暂时存储一些不需要的资源时，XDrive" +
                "则提供了一个很好的服务平台来帮助我们，在网络越来越" +
                "普及的今天这些平台显得尤为重要，它提供了我们作为好" +
                "友与好友之间的分享资源的平台。",
                effect: "rightBig",
                speed : 60,
            });
        });
    </script>
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
            position: relative;
        }

        .center-div-1{
            float: left;
            width: 30%;
            height: 30%;
            margin-left:17%;
            background-color: #888888;
        }
        .center-div-2{
            float: right;
            width: 30%;
            height: 30%;
            margin-right: 17%;
            background-color: #888888;
        }
        #text{
            float: left;
            width: 66%;
            height: 40%;
            margin-left: 17%;

        }
        .center-div-4{
            float: right;
            width: 30%;
            height: 40%;
            margin-right: 17%;
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
        .about-us{
            font-size:30px;
            font-color:white;
            padding-top:3%;
            padding-left:42%;
            text-shadow:#FF0000 0 0 10px;
        }
    </style>
</head>
<body>
<!-- 引用特效 鼠标移动到页面其他页面的线条自动向鼠标靠拢   -->
 <script src="//cdn.bootcss.com/canvas-nest.js/1.0.1/canvas-nest.min.js"></script>
 
<!-- 顶部布局  -->
<div class="top-div">
     <span class="right-input">
      <a href="login.jsp"style="color:white;">返回登录</a>&nbsp;&nbsp;&nbsp;&nbsp;
      <a href="sign.jsp"style="color:white">返回注册</a>&nbsp;&nbsp;&nbsp;&nbsp;
   </span>
    <div class="about-us">introduce items</div>
</div>
<!--中间布局 -->

<div class="center-div">
    <div>
        <br>
        <div class="center-div-1">
        </div>
        <div class="center-div-2">
        </div>
    </div>
    <br>
    <div>

        <div id="text">
            <!-- <b><h4 style="text-align: left; color: black">项目背景:</h4></b>-->
           <!-- <b><h4 style="text-align: left; color: black">产品介绍:</h4></b> -->
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
