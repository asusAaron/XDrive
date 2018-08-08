<%@ page language="java" contentType="text/html; charset=utf-8"
         pageEncoding="utf-8" %>
<% String path = request.getContextPath();%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>login</title>
    <link rel="stylesheet" href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="https://cdn.bootcss.com/jquery/2.1.1/jquery.min.js"></script>
    <script src="https://cdn.bootcss.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <script src="../../js/jsencrypt.min.js">  </script>
</head>
<style>
    body, html {
        margin: 0;
        padding: 0;
        height: 100%;
        color: #fff;
    }

    body {
        background: url("../../img/logo1.jpg");
    }

    p {
        margin-top: 2%;
        text-align: center;
        font-size: 15px;
        font-style: italic;
    }

    input {
        height: 40px;
    }

    input::-webkit-input-placeholder {
        color: white;
        font-family: "楷体", STHeiti, "Microsoft YaHei", 微软雅黑, "MicrosoftJhengHei", 华文细黑, MingLiu;
        font-size: 15px;
    }

    .left-text {
        text-align: center;
        font-size: 25px;
        margin-top: 20px;
        margin-left: 2%;
    }

    .left {
        float: left;
        width: 33%;
        height: 85%;
    }

    .center {
        -moz-opacity: 0.9;
        opacity: 0.9;
        -khtml-opacity: 0.9;
        float: left;
        width: 33%;
        height: 85%;
    }

    .right {
        float: left;
        width: 33%;
        height: 85%;
    }

    .bottom {
        float: left;
        width: 100%;
        height: 15%;
        background-color: #585858;
        -moz-opacity: 0.7;
        opacity: 0.7;
        -khtml-opacity: 0.7;
    }

    .login {
        margin-top: 2%;
        margin-left: 2%;
        color: white;
        font-size: 20px;
        font-style: italic;
    }

    .logintext {
        display: none;
        margin-top: 30%;
        margin-left: 2%;
        margin-right: 2%;
        height: 80%;
    }

    .logintext-input {
        color: white;
        border: none #FFFFFF;
        border-bottom: #777777 solid 1px;
        background: transparent;
        width: 70%;
    }

    .inputstyle {
        margin-top: 8%;
        margin-left: 10%;
    }

    .logintext-submit {
        margin-top: 8%;
        margin-left: 10%;
    }

    .logintext-create {
        margin-top: 10%;
        margin-left: 50%;
        font-size: 15px;
    }

    a {
        text-decoration: none;
    }

    a:link {
        color: blue;
    }

    a:visited {
        color: blue;
    }

    a:hover {
        color: gray;
    }

    a:active {
        color: red;
    }

    .back {
        margin-top: 10%;
        margin-left: 50%;
    }
</style>

<body onload="add()">

<!-- 布局分为4块 上面分为3块底部1块  上面高度85%底部高度15% 上面平分为3块 左中右-->
<!-- 布局左边  -->
<div class="left">
    &nbsp;&nbsp;&nbsp;&nbsp;
    <img src="../../img/logo.png" style="width:82px; heigth:70px">
    &nbsp;&nbsp;&nbsp;
    <span class="left-text"><br>XDrive Disk</span>
</div>
<!-- 中间布局 -->
<div class="center">
    <form id="sign" class="logintext" method="post">
        <div class="inputstyle">
            <span class="glyphicon glyphicon-phone"></span>&nbsp;&nbsp;&nbsp;&nbsp;
            <input id="phone" type="text" onBlur="checkPhoneInput()" placeholder="手机号码" name="username"
                   class="logintext-input"/>
        </div>
        <p id="checkPhoneInputResult"></p>

        <div class="inputstyle">
            <span class="glyphicon glyphicon-envelope"></span>&nbsp;&nbsp;&nbsp;&nbsp;
            <input id="username" type="text" placeholder="昵称" name="username" class="logintext-input"/>
        </div>

        <div class="inputstyle">
            <span class="glyphicon glyphicon-lock" style="color:white"></span>&nbsp;&nbsp;&nbsp;&nbsp;
            <input onBlur="checkPassword()" id="password1" type="password" placeholder="密码" name="password"
                   class="logintext-input"/>
        </div>
        <p id="checkPasswordResult"></p>

        <div class="inputstyle">
            <span class="glyphicon glyphicon-lock" style="color:white"></span>&nbsp;&nbsp;&nbsp;&nbsp;
            <input onBlur="checkSame()" id="password2" type="password" placeholder="密码确认" name="password"
                   class="logintext-input"/>
        </div>
        <p id="checkSameResult"></p>

        <div class="logintext-submit"><input id="btn_sign_up"  value="Sign up"
                                             style="width:310px;box-shadow: 0px 10px 5px #888888;"
                                             class="btn btn-danger"/>
        </div>
    </form>
</div>
<!-- 右边布局  -->
<div class="right">
    <div class="back">
        <a href="login" style="color:white">返回登录</a>&nbsp;&nbsp;&nbsp;&nbsp;
        <a href="aboutUs" style="color:white">关于我们</a>&nbsp;&nbsp;&nbsp;&nbsp;
        <a href="introduce_item" style="color:white">项目介绍</a>
    </div>
</div>
<!-- 底部布局  -->
<div class="bottom">
    <p>@2018 Xdrive <a href="http://iss.whu.edu.cn/">武汉大学计算机学院</a><br>
        @一切解释权归第六队所有
    </p>
</div>
</body>
<script type="text/javascript">

    function add() {
        setTimeout("add1()", 500);
    }

    function add1() {
        var temp = document.getElementById('sign');
        temp.style.display = 'block';
    }

    function checkId() {
        if (document.getElementById("password1").value == "" && document.getElementById("phone").value == "") {
            alert("请输入手机号和密码！")
            return false;
        } else if (document.getElementById("phone").value == "") {
            alert("请输入手机号");
            return false;
        } else if ((document.getElementById("phone").value).length != 11) {
            alert("手机号码格式不对，请重新输入！");
            return false;
        } else if (document.getElementById("password").value == "") {
            alert("请输入密码！");
            return false;
        } else {
            return true;
        }

    }

    //检查输入的账号位数，不对就把输入的内容颜色设置为红色警告，正确位数将字体颜色设置为黑色
    function checkPhoneInput() {
        var num = document.getElementById("phone").value;
        if (isNaN(num)) {
            document.getElementById("phone").style.color = 'red';
            document.getElementById("checkPhoneInputResult").innerHTML = "手机号必须全部为数字！";
            document.getElementById("checkPhoneInputResult").style.color = 'red';
        }
        else {
            //获得输入字符
            var input = document.getElementById("phone").value;
            if (input.length != 11) {
                $("#phone").style.color = 'red';
                $("#checkPhoneInputResult").innerHTML = "手机号位数错误，请重新输入";
                $("#checkPhoneInputResult").style.color = 'red';
            }
            else {
                $("#phone").style.color = 'black';
                $("#checkPhoneInputResult").innerHTML = "";

            }
        }
    }

    //检查第一次输入的密码
    function checkPassword() {
        var input = document.getElementById("password1").value;
        if (input.length < 6) {
            $("#checkPasswordResult").innerHTML = "密码长度不够，请重新输入";
            $("#checkPasswordResult").style.color = 'red';
        }
        else {
            document.getElementById("checkPasswordResult").innerHTML = "";
        }
    }

    //检查两次输入的密码匹配问题
    function checkSame() {
        var input = document.getElementById("password1").value;
        var input1 = document.getElementById("password2").value;
        if (input != input1) {
            document.getElementById("checkSameResult").innerHTML = "两次输入密码不匹配，请重新输入";
            document.getElementById("checkSameResult").style.color = 'red';
        }
        else {
            document.getElementById("checkSameResult").innerHTML = "";
        }
    }

    /**--------------------注册逻辑------------------------*/
    var publicKey=null;

    function getPublicKey(callback) {
        $.ajax({
            url:"/user/rdspwd",
            type:"post",
            dataType:"text",
            error: function (jqXHR, textStatus, errorThrown) {
                console.log(jqXHR);
                console.log(textStatus);
                console.log(errorThrown);
            },
            success:function (data) {
                if(data)publicKey=data;
            }
        })
    }

    getPublicKey();

    $("#btn_sign_up").click(function () {
        var phone=$("#phone").val();
        var uname=$("#username").val();
        var pwd=$("#password1").val();
        var encrypt=new JSEncrypt();

        if(publicKey != null) {
            console.log("pub")
            encrypt.setPublicKey(publicKey);
            var password = encrypt.encrypt(pwd);
            var account = encrypt.encrypt(phone);
            if (password.length < 20) {
                //加密失败提示
                alert("注册失败，请稍后重试...");
            } else {
                $.ajax({
                    url: "<%=path%>/user/signup",
                    type: "post",
                    data: {"phone": account,"username":uname, "pwd": password},
                    error: function (jqXHR, textStatus, errorThrown) {
                        console.log(jqXHR);
                        console.log(textStatus);
                        console.log(errorThrown);
                    },
                    success: function (data) {
                        var res=JSON.parse(data);
                        if(res.status==="success"){
                            console.log("sign up");
                            window.location.href="login";
                        }else {
                            alert("账户已被注册！")
                        }

                    }
                })
            }
        }

    })

</script>
</html>