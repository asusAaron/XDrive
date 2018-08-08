<%@ page import="java.util.List" %>
<%@ page import="java.util.Map" %>
<%@ page language="java" contentType="text/html; charset=utf-8" isELIgnored="false"
         pageEncoding="utf-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
    <link rel="stylesheet" href="css/bootstrap.css" type="text/css">
    <script type="text/javascript" src="http://code.jquery.com/jquery-latest.js"></script>
    <script src="https://cdn.bootcss.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
<body>
<!--顶部左端   -->
<div class="top-div">
    <form name="myForm1" method="post">
        <div class="top-image">
            <img src="img/logo.jpg" class="image">
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
<!-- 中间内容部分布局  -->
<div class="page-div" style="z-index:1;position:relative">
    <!--  <form name="myForm4" method="post">  -->
    <div class="page-input">
        <!-- 上传 -->
        <input id="btn_upload" type="submit" value="上传" class="btn btn-primary"
               style="margin-left:2%;width:80px;"/>
        <input type="file" id="btn_file" style="display:none">
        <!-- 弹窗阴影效果  -->
        <div id="fade" class="black_overlay">
        </div>

        <input id="btn_download" type="submit" value="下载" class="btn btn-primary"
               style="margin-left:2%;heigth:22px;width:80px;"/>

        <input type="submit" value="新建文件夹" class="btn btn-default"
               style="margin-left:2%;heigth:22px;width:90px;"/>

        <input type="submit" value="删除" class="btn btn-default"
               style="margin-left:2%;heigth:22px;width:80px;"/>

        <input type="text" placeholder="&nbsp;&nbsp;&nbsp;搜索您的文件" id="inputtext"
               style="margin-left:15%;color:black;width:251px;
              border-radius:5px;height:35px;line-height:35px;position:absolute;border:none #FFFFFF;
	          border-bottom:#777777 solid 1px;background:transparent;">

        <input type="submit" value="搜索" class="btn btn-primary" onclick="searchValue()"
               style="margin-left:36.5%;;heigth:22px;width:80px;position:absolute;"/>
    </div>
    <!-- 表格 -->
    <tr class="page-table container">

        <table class="table table-hover">
            <thead>
                <tr >
                    <th class="col-md-1"><input id="boxId" type="checkbox" value=""></th>
                    <th class="col-md-5">文件名</th>
                    <th class="col-md-3">大小</th>
                    <th class="col-md-3">修改日期</th>
                </tr>
            </thead>
            <tbody>
            <c:forEach items="${sessionScope.fileInfos}" var="info" varStatus="status">
                <tr>
                    <td class="col-md-1"><input id="cbx${status.index}" class="cbx" name="checkbox" type="checkbox"></td>
                    <td class="col-md-5">${info.f_name}</td>
                    <td class="col-md-3">${info.f_size}</td>
                    <td class="col-md-3">${info.f_uploadtime}</td>
                </tr>
                <input id="file${status.index}" class="fileId" type="hidden" value="${info.f_id}">
            </c:forEach>
            </tbody>
        </table>

</div>
</div>

<%------------------------不显示的组件---------------------%>
<div id="uploadWin" class="radius pos-bot">
    <div style="height: 30px;width: 100%;">
        <button id="btn_uploading" class="btn btn-primary float-left">正在上传</button>
        <div class="flex" style="height: 30px;width:85%;margin-left:10px;float: left;background-color: #2b542c;">
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
/******************************复选框操作开始 ***************************************/

    //当选中行首checkbox时，自动选择所有行的checkbox
    $("#boxId").click(function () {
        // 获取要操作的复选框
        var box1 = document.getElementById("boxId");
        //checked判断是否选中
        if (box1.checked == true) {
            selectAll();
        }
        else {
            SelectNO();
        }
    })

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

    // //上传文件
    // function F_Open_dialog() {
    //     document.getElementById("btn_file").click();
    // }
    //
    // //打开弹窗
    // openbox=function() {
    //     document.getElementById('light').style.display = 'block';
    //     document.getElementById('fade').style.display = 'block';
    // }
    //
    // //关闭弹窗
    // function closebox() {
    //     document.getElementById('light').style.display = 'none';
    //     document.getElementById('fade').style.display = 'none';
    // }

    /**--------------------------上传下载方法---------------------------------------*/

        // 默认上传按钮不可用
    var progressBar = $("#progressBar");
    var uploadWin = $("#uploadWin");
    var btnFile = $("#btn_file");
    var btnUploading = $("#btn_uploading");
    var btnDownload = $("#btn_download");
    var btnUpload = $("#btn_upload");
    // 上传按钮点击事件

    //下载按钮点击，触发下载事件
    btnDownload.click(function () {
        console.log("btn download click");
        var cboxes=$(".cbx");
        var cnt=0;
        for (var i=0;i<cboxes.length;i++){
            if(cboxes[i].checked==true){
                cnt++;
                var fileId=$("#"+"file"+i).val();
                downloadFunc(fileId);
            }
        }
    });

    //上传按钮点击，触发隐藏的input，进行文件选择
    btnUpload.click(function () {
        console.log("upload click");
        btnFile.click();
    })

    btnFile.change(function () {
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
        form.append("account", "gyx");
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
                btnUploading.val("上传完成");
                uploadWin.fadeOut();
                progressBar.parent().removeClass("active");
                progressBar.parent().hide();
                btnFile.val("");
                location.reload(true);
            }

        });
    };

    function downloadFunc(fileId) {
        //将请求需要的参数放到map中
        var params = {};
        params.fileId = fileId;
        var url = "<%=path%>/file/download";
        console.log(params);

        //生成隐藏表单提交请求，取消跳转，并在提交完后移除。
        var form = $('<form method="POST" target="noJump" action="' + url + '">');
        $.each(params, function (k, v) {

            form.append($('<input type="hidden" name="' + k +
                '" value="' + v + '">'));
        });
        $('body').append(form);
        form.submit().remove();
    }
</script>
</html>