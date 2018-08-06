<%@ page import="org.omg.CORBA.Request" %><%--
  Created by IntelliJ IDEA.
  User: 54367
  Date: 2018/7/26
  Time: 19:52
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<% String path = request.getContextPath(); %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Bootstrap 101 Template</title>
    <!-- Bootstrap -->
    <link href="../../css/bootstrap.min.css" rel="stylesheet">
    <link href="/css/default.css" rel="stylesheet">
    <script type="text/javascript" src="http://code.jquery.com/jquery-latest.js"></script>
    <script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
    <script type="text/javascript">
        $(function () {
            // 默认上传按钮不可用
            var btnUpload = $("#btnUpload");
            var progressBar=$("#progressBar");
            var uploadWin=$("#uploadWin");
            // 上传按钮点击事件

            $("#bntDownload").click(function () {
                console.log("btn download click");
                //downloadFunc();
            });

            $("#file").change(function () {
                progressBar.width("0%");
                // 上传按钮禁用
                $(this).attr('disabled', true);
                // 进度条显示

                uploadWin.slideDown("slow");
                progressBar.parent().show();
                progressBar.parent().addClass("active");
                uploadFunc();

            });

            //更新进度
            function progressFunc(event) {

                if (event.lengthComputable) {
                    var percent = Math.round(event.loaded / event.total * 100) + "%";
                    progressBar.width(percent);
                    $("#btnUpload").val("正在上传，进度：" + percent);
                }
            }

            function uploadFunc() {
                var file = $("#file").get(0).files[0];
                console.log(file.name);
                var form = new FormData();
                form.append("file", file);
                form.append("path","F:\\uploadFile");
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
                        uploadWin.fadeOut();
                        $("#file").attr('disabled', false);
                        $("#btnUpload").val("重新上传");
                        progressBar.parent().removeClass("active");
                        progressBar.parent().hide();



                    }

                });
            };

            function downloadFunc() {
                var fdata=new FormData();
                fdata.append("path","F:\\downloadFile");
                fdata.append("fileName","11.jpg")
                var downloadUrl = "<%=path%>/file/download";
                $.ajax({
                    cache: false,
                    type: "POST",
                    url: downloadUrl,
                    contentType: false,
                    processData: false,
                    data: fdata,
                    dataType: "text",
                    timeout: 3000,
                    error: function (jqXHR, textStatus, errorThrown) {
                        console.log(jqXHR);
                        console.log(textStatus);
                        console.log(errorThrown);
                    },
                    success:function () {
                        alert("download");
                    }
                })
            }
        })
    </script>

</head>
<body>
<div class="container  col-lg-6" style="margin:0 auto;background: burlywood">
    <input type="file" name="file" id="file">
</div>

<div class="container col-lg-12" style="margin:0 auto;background-color: royalblue;">
    <form action="/file/download" method="post" target="noJump">
        <button id="bntDownload" value="download"
                style="height: 100px;width: 100px;">下载</button>
    </form>

</div>

<%------------------------不显示的组件---------------------%>

<div id="uploadWin" class="radius pos-bot " style="height: 50px;width:90%;background-color: royalblue;display: none;">


        <div class="container-fluid">
            <input type="submit" id="btnUpload" value="上传">
            <div class="progress progress-striped active" style="display: none">
                <div id="progressBar" class="progress-bar progress-bar-info"
                     role="progressbar" aria-valuemin="0%" aria-valuenow="0"
                     aria-valuemax="100" style="width: 0">
                </div>
            </div>

</div>
</div>
<iframe id="noJump" name="noJump" style="display:none;"></iframe>

</body>
</html>
