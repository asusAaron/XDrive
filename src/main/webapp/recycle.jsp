<%@ page language="java" contentType="text/html; charset=utf-8"
         pageEncoding="utf-8" %>
<% String path = request.getContextPath();%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>XDrive 网盘</title>

    <link href="css/default.css" rel="stylesheet" type="text/css">
    <link href="css/home.css" rel="stylesheet" type="text/css">
    <link rel="stylesheet" href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <script type="text/javascript" src="http://code.jquery.com/jquery-latest.js"></script>
    <script src="https://cdn.bootcss.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
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

.left-div {
    float: left;
    height: 90%;
    width: 14%;
    -moz-opacity: 0.9;
    opacity: 0.9;
    -khtml-opacity: 0.9;
    z-index: 1;
    background-color: #eff4f8;
    z-index:1;
    position:relative;
}

.page-div {
    position: relative;
    float: left;
    height: 90%;
    width: 86%;
    border-top-left-radius: 5px;
    border: 1px solid rgba(192, 192, 192, 0.64);
    background-color: #ffffff;
    -moz-opacity: 0.9;
    opacity: 0.9;
    -khtml-opacity: 0.9;
    z-index: 0;
}
.page-span{
    margin-left:6%;
}
.a-margin {
    padding-left: 24%;
}

.page-input {
    margin-top: 2%;
    display: flex;
    flex-direction: row;
}

.page-table {
    margin-top: 2%;
    color: black;
}

#uploadWin{
    height: 50px;
    width: 90%;
    background: cornflowerblue;
    z-index: 10;
    display:flex;
    justify-content:center;
    align-items:center;
}

#btn_uploading{
    height: 30px;
    line-height: 15px;
    margin-left: 10px;
}

.left_ul_div
{
    background-color:#eff4f8;
    margin-top:10%;
}

.btn_upload
{
    background-color: #4B8BF5;
    color: white;
}
.btn_upload:hover
{
    color: white !important;
    opacity: 0.8;
}

.btn_download
{
    background-color: #4B8BF5;
    color: white;
}
.btn_download:hover
{
    color: white !important;
    opacity: 0.8;
}

.four_btns
{
    margin-left:2%;
    width:90px;
}

.search_group
{
    width: 20%;
    margin-left:15%;
}

.search_btn
{
    margin-left:100%;
    width:80px;
    position:absolute;
}

.search_input
{
    color:black;
    width:100px;
    border-radius:5px;
    height:35px;
    line-height:35px;
    position:absolute;
    border:none #FFFFFF;
    border-bottom:#777777 solid 1px;
    background:transparent;
}

.left_list_first
{
    background-color: #4B8BF5 !important;
}

.left_list_items
{
    background-color: #eff4f8 !important;
    border: 1px solid transparent !important;
}
.left_list_items:hover
{
    background-color: rgba(204, 233, 248, 0.73) !important;
}
.on{
    background-color: #eff4f8;
}
</style>
<body>
<!-- 顶部   -->
<div class="top-div">
        <div class="top-image">
            <img src="img/logo.png" class="image">
        </div>
        <div class="top-logo"><b>XDrive Disk</b></div>
        <div class="top-text"
             >
            <a href="home.jsp">网盘</a>
        </div>
        <div class="top_line"></div>
        <div class="top-text">
            <a href="#">分享</a>
        </div>
        <div class="top_line"></div>
        <div class="top-text">
            <a href="search.jsp">搜索</a>
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
</div>
<!-- 左边布局  -->
<div class="left-div">
    <form name="myForm3" method="post">
        <div class="left_ul_div">
                <a href="#" class="list-group-item left_list_items" >
	           <span class="glyphicon glyphicon-list-alt"></span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;全部文件
                </a>
                 <a href="echarts.jsp" class="list-group-item left_list_items"><span class="a-margin">动态文件列表</span>
                </a>
                <a href="#" class="list-group-item left_list_items"><span class="a-margin">图片</span>
                </a>
                <a href="#" class="list-group-item left_list_items"><span class="a-margin">视频</span>
                </a>
                <a href="#" class="list-group-item left_list_items"><span class="a-margin">文档</span>
                </a>
                <a href="#" class="list-group-item left_list_items"><span class="a-margin">音乐</span>
                </a>
                <a href="#" class="list-group-item left_list_items"><span class="a-margin">其它</span>
                </a>
                <a href="#" class="list-group-item left_list_items">
                    <span class="glyphicon glyphicon-circle-arrow-right"></span>
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;我的分享
                </a>
                <a href="recycle.jsp" class="list-group-item left_list_items">
                    <span class="glyphicon glyphicon-trash"></span>
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;回收站
                </a>
                 <script>
                var list = document.getElementsByName('click');
                var times = list.length;
                for(var i = 0;i<times;i++) {
                list[i].addEventListener('click',function() {
                for(var i=0;i<times;i++) {
                    list[i].removeAttribute('on');
                }
                this.setAttribute('class','on')
            })
        }
    </script>
        </div>
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
<!-- 表格 -->
    <div class="page-table">
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
		        <span>c.jpg</span>
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
</form>
</div>

<%------------------------不显示的组件---------------------%>
<div id="uploadWin" class="radius pos-bot">
    <div style="height: 30px;width: 100%;">
        <button id="btn_uploading" class="btn btn-primary float-left"></button>
        <div class="flex" style="height: 30px;width:85%;margin-left:10px;float: left;background-color: #2b542c;">
            ${sessionScope.get("fileInfos")}
            <div class="progress progress-striped active m-auto">
                <div id="progressBar" class="progress-bar progress-bar-info"
                     role="progressbar" aria-valuemin="0%" aria-valuenow="0"
                     aria-valuemax="100" style="width: 0">
                </div>
            </div>
        </div>

    </div>
</div>
<iframe id="noJump" name="noJump" style="display:none;"></iframe>
</body>


<script type="text/javascript">

    /***复选框操作开始 ***************************************/
    function selectALLNO() {
        // 获取要操作的复选框
        var box1 = document.getElementById("boxId");
        //checked判断是否选中
        if (box1.checked == true) {
            selectAll();
        }
        else {
            SelectNO();
        }
    }

    function selectAll() {
        // 获取要操作的复选框
        var box1 = document.getElementsByName("checkbox");
        //checked判断是否选中
        for (var x = 0; x < box1.length; x++) {
            var value1 = box1[x];
            value1.checked = true;
        }
    }

    function SelectNO() {
        // 获取要操作的复选框
        var box2 = document.getElementsByName("checkbox");
        //checked判断是否选中
        for (var x = 0; x < box2.length; x++) {
            var value1 = box2[x];
            value1.checked = false;
        }
    }

    /***复选框操作结束***************************************/

//搜索操作 
    function searchValue() {
        //input值
        var input = document.getElementById("inputtext").value;
        //td数量
        var box1 = document.getElementsByName("checkbox");
        for (var i = 1; i <= box1.length; i++) {
            //td的id
            var str = "text" + i;
            //td文本
            var a = document.getElementById(str).innerText;
            if (a.search(input) == -1) {
                document.getElementById(str).style.display = "none ";
            }
            else {
                document.getElementById(str).style.display = "";
            }
        }
    }

    //上传文件
    function F_Open_dialog() {
        document.getElementById("btn_file").click();
    }

    //打开弹窗
    openbox=function() {
        document.getElementById('light').style.display = 'block';
        document.getElementById('fade').style.display = 'block';
    }

    //关闭弹窗
    function closebox() {
        document.getElementById('light').style.display = 'none';
        document.getElementById('fade').style.display = 'none';
    }

/**--------------------------上传下载方法---------------------------------------*/

    // 默认上传按钮不可用
    var btnConfirm = $("#btn_confirm");
    var progressBar = $("#progressBar");
    var uploadWin = $("#uploadWin");
    var btnFile = $("#btn_file");
    var btnUploading = $("#btn_uploading");
    var btnDownload=$("#btn_download");
    // 上传按钮点击事件

    //下载按钮点击，触发下载事件
    btnDownload.click(function () {
        console.log("btn download click");
        downloadFunc();
    });

    btnFile.change(function () {
        btnConfirm.attr('disabled', false);
    })

    btnConfirm.click(function () {
        progressBar.width("0%");
        // 上传按钮禁用
        $(this).attr('disabled', true);
        // 进度条显示

        uploadWin.slideDown("slow");
        progressBar.parent().show();
        progressBar.parent().addClass("active");
        uploadFunc();

    });

    /**
     * 更新进度条
     */
    function progressFunc(event) {
        if (event.lengthComputable) {
            var percent = Math.round(event.loaded / event.total * 100) + "%";
            progressBar.width(percent);
            btnUploading.val("正在上传，进度：" + percent);
        }
    }

    /**
     * 上传函数，实现ajax异步上传
     */
    function uploadFunc() {
        var file = btnFile.get(0).files[0];
        console.log(file.name);
        var form = new FormData();
        form.append("file", file);
        form.append("path", "123");
        form.append("account","gyx");
        var uploadUrl = "<%=path%>/file/upload";
        $.ajax({
            cache: false,
            type: "POST",
            url: uploadUrl,
            contentType: false,
            processData: false,
            data: form,
            dataType: "text",
            timeout: 50000,
            xhr: function () {
                var myxhr = $.ajaxSettings.xhr();
                if (progressFunc && myxhr.upload) {
                    myxhr.upload.addEventListener("progress", progressFunc, false);
                }
                return myxhr;
            },
            error: function (jqXHR, textStatus, errorThrown) {
                console.log(jqXHR);
                console.log(textStatus);
                console.log(errorThrown);
            },
            success: function () {
                location.reload(true);
                btnUploading.val("上传完成");
                uploadWin.fadeOut();
                progressBar.parent().removeClass("active");
                progressBar.parent().hide();
            }

        });
    };
    function downloadFunc(id) {
        //将请求需要的参数放到map中
        var params = {};
        params.fileId="1";
        var url="<%=path%>/file/download";
        console.log(params);

        //生成隐藏表单提交请求，取消跳转，并在提交完后移除。
        var form = $('<form method="POST" target="noJump" action="' + url + '">');
        $.each(params, function(k, v) {

            form.append($('<input type="hidden" name="' + k +
                '" value="' + v + '">'));
        });
        $('body').append(form);
        form.submit().remove();
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
</script>
</html>