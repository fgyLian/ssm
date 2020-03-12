<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>登录</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/font-awesome.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/login.css">
    <style>

    </style>
</head>
<body>
<nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
    <div class="container">
        <div class="navbar-header">
            <div><a class="navbar-brand" href="#" style="font-size:32px;">用户-部门管理平台</a></div>
        </div>
    </div>
</nav>

<div class="container">
    <form action="doLogin" id="loginForm" method="post" class="form-signin" role="form">
        <h2 class="form-signin-heading"><i class="glyphicon glyphicon-user"></i> 用户登录</h2>
        <div class="form-group has-success has-feedback">
            <input type="text" class="form-control" id="user_name" name="user_name" placeholder="请输入登录账号" autofocus>
            <span class="glyphicon glyphicon-user form-control-feedback"></span>
        </div>
        <div class="form-group has-success has-feedback">
            <input type="text" class="form-control" id="password"placeholder="请输入登录密码" style="margin-top:10px;">
            <span class="glyphicon glyphicon-lock form-control-feedback"></span>
        </div>
        <a class="btn btn-lg btn-success btn-block" onclick="dologin()" > 登录</a>
    </form>
</div>
<script src="${pageContext.request.contextPath}/jquery/jquery-2.1.1.min.js"></script>
<script src="${pageContext.request.contextPath}/bootstrap/js/bootstrap.min.js"></script>
<script>
    function dologin() {
        //非空校验
        var user_name=$("#user_name").val();
        if (user_name=="") {
           alert("用户名不能为空，请输入");
            return;
        }
       // $("#loginForm").submit();
        /*ajax提交数据*/
        $.ajax({
            type : "POST",
            url  : "${pageContext.request.contextPath}/doAJAXLogin",
            data : {
                "user_name" : user_name
            },
            success : function(result) {
                if (result.success) {
                    window.location.href = "main";
                } else {
                    alert("用户登录账号或密码不正确，请重新输入")
                }
            }
        });
    }
</script>
</body>
</html>
