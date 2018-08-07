<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
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
     <a href="share.jsp">分享</a>
  </div>
  <div class="top-text"> 
     <a href="search.jsp">搜索</a>
  </div>
  <div class="top-welcome">欢迎您:</div>
  </form>
</div>
   <!--顶部右端   -->
<div class="top-rightdiv" style="padding-top:1.5%;">
  <form name="myForm2" method="post">
  <div class="dropdown" style="z-index:100;position:absolute">
      <button type="button" class="btn dropdown-toggle" id="dropdownMenu1" data-toggle="dropdown"
              style="border:none #FFFFFF;border-bottom:#777777 solid 1px;background:transparent;font-size:18px;">  
                张作霖<span class="caret"></span>
      </button>
      <ul class="dropdown-menu" style="z-index:100;position:absolute">


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
    <ul class="nav nav-pills nav-stacked" style=" background-color:#B0C4DE;margin-top:10%;">
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
	        <a href="recycle.jsp">
               <span class="glyphicon glyphicon-trash"></span>
	                 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;回收站
	        </a>
	    </li>
   </ul>
   </form>
</div>

<!-- 中间布局 -->
<!-- 为ECharts准备一个具备大小（宽高）的Dom -->
<div class="page-div" style="z-index:1;position:relative">
    <div id="main" style="width: 100%;height:100%;"></div>
    <script type="text/javascript">
        // 基于准备好的dom，初始化echarts实例
        var myChart = echarts.init(document.getElementById('main'));
		//城市           日期             污染程度         AQI指数     PM2.5 PM10   CO   NO2   SO2
        //文件类别       日期      	      文件名           文件大小      拥有着      分享状态
        //图片
        var dataIMG = [
            [9,2000,2000,"1.txt","张作霖","未分享"],
            [10,2000,2000,"1.txt","张作霖","未分享"],
            [11,1600,1600,"1.txt","张作霖","未分享"],
            [12,3000,3000,"1.txt","张作霖","未分享"],
            [1,300,300,"1.txt","张作霖","未分享"]
        ];

        //视频
        var dataVIDEO = [
        	[9,200,200,"1.txt","张作霖","未分享"],
            [10,2300,2300,"1.txt","张作霖","未分享"],
            [11,600,600,"1.txt","张作霖","未分享"],
            [12,1800,1800,"1.txt","张作霖","未分享"],
            [1,300,300,"1.txt","张作霖","未分享"]
        ];
        
        //文本
        var dataTEXT = [
        	[9,700,700,"1.txt","张作霖","未分享"],
            [10,900,900,"1.txt","张作霖","未分享"],
            [11,1750,1750,"1.txt","张作霖","未分享"],
            [12,700,700,"1.txt","张作霖","未分享"],
            [1,200,200,"1.txt","张作霖","未分享"]
        ];
        
        //音乐
        var dataMUSIC = [
        	[9,2600,2600,"1.txt","张作霖","未分享"],
            [10,1500,1500,"1.txt","张作霖","未分享"],
            [11,1600,1600,"1.txt","张作霖","未分享"],
            [12,300,300,"1.txt","张作霖","未分享"],
            [1,700,700,"1.txt","张作霖","未分享"]   
        ];

        //其他
        var dataOTHER = [
        	[9,2000,2000,"1.txt","张作霖","未分享"],
            [10,1050,1050,"1.txt","张作霖","未分享"],
            [11,2300,2300,"1.txt","张作霖","未分享"],
            [12,550,550,"1.txt","张作霖","未分享"],
            [1,2680,2680,"1.txt","张作霖","未分享"]
        ];
      //文件类别   日期      	文件名           文件大小      拥有着      分享状态
        var schema = [
            {name: 'date', index: 0, text: '月'},
            {name: 'AQIindex', index: 1, text: '文件大小'},
            {name: 'PM25', index: 2, text: '文件名'},
            {name: 'PM10', index: 3, text: '拥有者'},
            {name: 'CO', index: 4, text: '分享状态'}
        ];


        var itemStyle = {
            normal: {
                opacity: 0.8,
                shadowBlur: 10,
                shadowOffsetX: 0,
                shadowOffsetY: 0,
                shadowColor: 'rgba(0, 0, 0, 0.5)'
            }
        };

        option = {
            backgroundColor: '#404a59',
            color: [
                '#dd4444', '#fec42c', '#80F1BE', 'blue', 'black'
            ],
            legend: {
                y: 'top',
                data: ['图片', '视频', '文本', '音乐', '其他'],
                textStyle: {
                    color: '#fff',
                    fontSize: 16
                }
            },
            grid: {
                x: '10%',
                x2: 150,
                y: '18%',
                y2: '10%'
            },
            tooltip: {
                padding: 10,
                backgroundColor: '#222',
                borderColor: '#777',
                borderWidth: 1,
                formatter: function (obj) {
                    var value = obj.value;
                    return '<div style="border-bottom: 1px solid rgba(255,255,255,.3); font-size: 18px;padding-bottom: 7px;margin-bottom: 7px">'
                        + obj.seriesName + ' ' + value[0] + '月'
                        + '</div>'
                        + schema[1].text + '：' + value[1] + '<br>'
                        + schema[2].text + '：' + value[3] + '<br>'
                        + schema[3].text + '：' + value[4] + '<br>'
                        + schema[4].text + '：' + value[5] + '<br>';
                }
            },
            xAxis: {
                type: 'value',
                name: '日期/月',
                nameGap: 24,
                nameTextStyle: {
                    color: '#fff',
                    fontSize: 14
                },
                max: 12,
                splitLine: {
                    show: false
                },
                axisLine: {
                    lineStyle: {
                        color: '#eee'
                    }
                }
            },
            yAxis: {
                type: 'value',
                name: '文件大小/M',
                nameLocation: 'end',
                nameGap: 20,
                nameTextStyle: {
                    color: '#fff',
                    fontSize: 16
                },
                max: 3000,
                axisLine: {
                    lineStyle: {
                        color: '#eee'
                    }
                },
                splitLine: {
                    show: false
                }
            },
            visualMap: [
                {
                    left: 'right',
                    top: '10%',
                    dimension: 2,
                    min: 0,
                    max: 3000,
                    itemWidth: 30,
                    itemHeight: 120,
                    calculable: true,
                    precision: 0.1,
                    text: ['文件大小：M'],
                    textGap: 30,
                    textStyle: {
                        color: '#fff'
                    },
                    inRange: {
                        symbolSize: [10, 70]
                    },
                    outOfRange: {
                        symbolSize: [10, 70],
                        color: ['rgba(255,255,255,.2)']
                    },
                    controller: {
                        inRange: {
                            color: ['#c23531']
                        },
                        outOfRange: {
                            color: ['#444']
                        }
                    }
                }
                /**
                {
                    left: 'right',
                    bottom: '5%',
                    dimension: 6,
                    min: 0,
                    max: 50,
                    itemHeight: 120,
                    calculable: true,
                    precision: 0.1,
                    text: ['修改时间'],
                    textGap: 30,
                    textStyle: {
                        color: '#fff'
                    },
                    inRange: {
                        colorLightness: [1, 0.5]
                    },
                    outOfRange: {
                        color: ['rgba(255,255,255,.2)']
                    },
                    controller: {
                        inRange: {
                            color: ['#c23531']
                        },
                        outOfRange: {
                            color: ['#444']
                        }
                    }
                }
                */
            ],
            series: [
                {
                    name: '图片',
                    type: 'scatter',
                    itemStyle: itemStyle,
                    data: dataIMG
                },
                {
                    name: '视频',
                    type: 'scatter',
                    itemStyle: itemStyle,
                    data: dataVIDEO
                },
                {
                    name: '文本',
                    type: 'scatter',
                    itemStyle: itemStyle,
                    data: dataTEXT
                },
                {
                    name: '音乐',
                    type: 'scatter',
                    itemStyle: itemStyle,
                    data: dataMUSIC
                },
                {
                    name: '其他',
                    type: 'scatter',
                    itemStyle: itemStyle,
                    data: dataOTHER
                }
            ]
        };

        // 使用刚指定的配置项和数据显示图表。
        myChart.setOption(option);
    </script>
</div>
</body>
</html>