<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>动态展示文件列表</title>
    <link rel="stylesheet" href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css">
	<script src="https://cdn.bootcss.com/jquery/2.1.1/jquery.min.js"></script>
	<script src="https://cdn.bootcss.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
	<!--echarts依赖的js -->
	<script src="js/echarts.js"></script>
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
.page-table{
   margin-top:2%;
   color:black;
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
     <a href="#">搜索</a>
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
			    <button type="button" style="float:left;" id="btnClose"
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
	        <a href="#"><span class="a-margin">动态文件列表</span>
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
	        <a href="#">
               <span class="glyphicon glyphicon-trash"></span>
	                 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;回收站
	        </a>
	    </li>
   </ul>
   </form>
</div>

<!-- 中间布局 -->
<!-- 为ECharts准备一个具备大小（宽高）的Dom -->
<div class="page-div"style="z-index:1;position:relative">
    <div id="main" style="width: 100%;height:100%;"></div>
    <script type="text/javascript">
        // 基于准备好的dom，初始化echarts实例
         var myChart = echarts.init(document.getElementById('main'));
        myChart.showLoading();
        var data1 = {
        	    "name": "flare",
        	    "children": [
        	        {
        	            "name": "data",
        	            "children": [
        	                {
        	                     "name": "converters",
        	                     "children": [
        	                      {"name": "Converters", "value": 721},
        	                      {"name": "DelimitedTextConverter", "value": 4294}
        	                     ]
        	                },
        	                {
        	                    "name": "DataUtil",
        	                    "value": 3322
        	                }
        	            ]
        	        },
        	        {
        	            "name": "display",
        	            "children": [
        	                {"name": "DirtySprite", "value": 8833},
        	                {"name": "LineSprite", "value": 1732},
        	                {"name": "RectSprite", "value": 3623}
        	           ]
        	        },
        	        {
        	            "name": "flex",
        	            "children": [
        	                {"name": "FlareVis", "value": 4116}
        	            ]
        	        },
        	        {
        	           "name": "query",
        	           "children": [
        	            {"name": "AggregateExpression", "value": 1616},
        	            {"name": "And", "value": 1027},
        	            {"name": "Arithmetic", "value": 3891},
        	            {"name": "Average", "value": 891},
        	            {"name": "BinaryExpression", "value": 2893},
        	            {"name": "Comparison", "value": 5103},
        	            {"name": "CompositeExpression", "value": 3677},
        	            {"name": "Count", "value": 781},
        	            {"name": "DateUtil", "value": 4141},
        	            {"name": "Distinct", "value": 933},
        	            {"name": "Expression", "value": 5130},
        	            {"name": "ExpressionIterator", "value": 3617},
        	            {"name": "Fn", "value": 3240},
        	            {"name": "If", "value": 2732},
        	            {"name": "IsA", "value": 2039},
        	            {"name": "Literal", "value": 1214},
        	            {"name": "Match", "value": 3748},
        	            {"name": "Maximum", "value": 843},
        	            {
        	             "name": "methods",
        	             "children": [
        	              {"name": "add", "value": 593},
        	              {"name": "and", "value": 330},
        	              {"name": "average", "value": 287},
        	              {"name": "count", "value": 277},
        	              {"name": "distinct", "value": 292},
        	              {"name": "div", "value": 595},
        	              {"name": "eq", "value": 594},
        	              {"name": "fn", "value": 460},
        	              {"name": "gt", "value": 603},
        	              {"name": "gte", "value": 625},
        	              {"name": "iff", "value": 748},
        	              {"name": "isa", "value": 461},
        	              {"name": "lt", "value": 597},
        	              {"name": "lte", "value": 619},
        	              {"name": "max", "value": 283},
        	              {"name": "min", "value": 283},
        	              {"name": "mod", "value": 591},
        	              {"name": "mul", "value": 603},
        	              {"name": "neq", "value": 599},
        	              {"name": "not", "value": 386},
        	              {"name": "or", "value": 323},
        	              {"name": "orderby", "value": 307},
        	              {"name": "range", "value": 772},
        	              {"name": "select", "value": 296},
        	              {"name": "stddev", "value": 363},
        	              {"name": "sub", "value": 600},
        	              {"name": "sum", "value": 280},
        	              {"name": "update", "value": 307},
        	              {"name": "variance", "value": 335},
        	              {"name": "where", "value": 299},
        	              {"name": "xor", "value": 354},
        	              {"name": "_", "value": 264}
        	             ]
        	            },
        	            {"name": "Minimum", "value": 843},
        	            {"name": "Not", "value": 1554},
        	            {"name": "Or", "value": 970},
        	            {"name": "Query", "value": 13896},
        	            {"name": "Range", "value": 1594},
        	            {"name": "StringUtil", "value": 4130},
        	            {"name": "Sum", "value": 791},
        	            {"name": "Variable", "value": 1124},
        	            {"name": "Variance", "value": 1876},
        	            {"name": "Xor", "value": 1101}
        	           ]
        	          },
        	        {
        	           "name": "scale",
        	           "children": [
        	            {"name": "IScaleMap", "value": 2105},
        	            {"name": "LinearScale", "value": 1316},
        	            {"name": "LogScale", "value": 3151},
        	            {"name": "OrdinalScale", "value": 3770},
        	            {"name": "QuantileScale", "value": 2435},
        	            {"name": "QuantitativeScale", "value": 4839},
        	            {"name": "RootScale", "value": 1756},
        	            {"name": "Scale", "value": 4268},
        	            {"name": "ScaleType", "value": 1821},
        	            {"name": "TimeScale", "value": 5833}
        	           ]
        	        }
        	    ]
        	};
/*
        	var data2 = {
        	    "name": "flare",
        	    "children": [
        	        {
        	            "name": "flex",
        	            "children": [
        	                {"name": "FlareVis", "value": 4116}
        	            ]
        	        },
        	        {
        	            "name": "scale",
        	            "children": [
        	                {"name": "IScaleMap", "value": 2105},
        	                {"name": "LinearScale", "value": 1316},
        	                {"name": "LogScale", "value": 3151},
        	                {"name": "OrdinalScale", "value": 3770},
        	                {"name": "QuantileScale", "value": 2435},
        	                {"name": "QuantitativeScale", "value": 4839},
        	                {"name": "RootScale", "value": 1756},
        	                {"name": "Scale", "value": 4268},
        	                {"name": "ScaleType", "value": 1821},
        	                {"name": "TimeScale", "value": 5833}
        	           ]
        	        },
        	        {
        	            "name": "display",
        	            "children": [
        	                {"name": "DirtySprite", "value": 8833}
        	           ]
        	        }
        	    ]
        	};
*/
        	myChart.hideLoading();

        	myChart.setOption(option = {
        	    tooltip: {
        	        trigger: 'item',
        	        triggerOn: 'mousemove'
        	    },
        	    legend: {
        	        top: '2%',
        	        left: '3%',
        	        orient: 'vertical',
        	        data: [{
        	            name: 'tree1',
        	            icon: 'rectangle'
        	        } ,
        	        {
        	            name: 'tree2',
        	            icon: 'rectangle'
        	        }],
        	        borderColor: '#c23531'
        	    },
        	    series:[
        	        {
        	            type: 'tree',

        	            name: 'tree1',

        	            data: [data1],

        	            top: '5%',
        	            left: '7%',
        	            bottom: '2%',
        	            right: '60%',

        	            symbolSize: 7,

        	            label: {
        	                normal: {
        	                    position: 'left',
        	                    verticalAlign: 'middle',
        	                    align: 'right'
        	                }
        	            },

        	            leaves: {
        	                label: {
        	                    normal: {
        	                        position: 'right',
        	                        verticalAlign: 'middle',
        	                        align: 'left'
        	                    }
        	                }
        	            },

        	            expandAndCollapse: true,

        	            animationDuration: 550,
        	            animationDurationUpdate: 750

        	        },
        	        /*
        	        {
        	            type: 'tree',
        	            name: 'tree2',
        	            data: [data2],

        	            top: '20%',
        	            left: '60%',
        	            bottom: '22%',
        	            right: '18%',

        	            symbolSize: 7,

        	            label: {
        	                normal: {
        	                    position: 'left',
        	                    verticalAlign: 'middle',
        	                    align: 'right'
        	                }
        	            },

        	            leaves: {
        	                label: {
        	                    normal: {
        	                        position: 'right',
        	                        verticalAlign: 'middle',
        	                        align: 'left'
        	                    }
        	                }
        	            },

        	            expandAndCollapse: true,

        	            animationDuration: 550,
        	            animationDurationUpdate: 750
        	        }
        	        */
        	    ]
        	});


// 使用刚指定的配置项和数据显示图表。
myChart.setOption(option);
</script>
</div>
</body>
</html>