<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>添加员工</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/font-awesome.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/main.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/doc.min.css">
    <style>
        .tree li {
            list-style-type: none;
            cursor:pointer;
        }
    </style>
</head>

<body>

<nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
    <div class="container-fluid">
        <div class="navbar-header">
            <div><a class="navbar-brand" style="font-size:32px;" href="user.html">用户管理-新增员工</a></div>
        </div>
        <div id="navbar" class="navbar-collapse collapse">
            <ul class="nav navbar-nav navbar-right">
                <li style="padding-top:8px;">
                    <div class="btn-group">
                        <button type="button" class="btn btn-default btn-success dropdown-toggle" data-toggle="dropdown">
                            <i class="glyphicon glyphicon-user"></i> ${u.user_name} <span class="caret"></span>
                        </button>
                        <ul class="dropdown-menu" role="menu">
                            <li><a href="login.html"><i class="glyphicon glyphicon-off"></i> 退出系统</a></li>
                        </ul>
                    </div>
                </li>
            </ul>
        </div>
    </div>
</nav>

<div class="container-fluid">
    <div class="row">
        <div class="col-sm-3 col-md-2 sidebar">
            <div class="tree">
                <ul style="padding-left:0px;" class="list-group">
                    <li class="list-group-item tree-closed" >
                        <a href="#"><i class="glyphicon glyphicon-dashboard"></i> 控制面板</a>
                    </li>
                    <li class="list-group-item">
                        <span><i class="glyphicon glyphicon glyphicon-tasks"></i>系统管理管理 <span class="badge" style="float:right">2</span></span>
                        <ul style="margin-top:10px;">
                            <li style="height:30px;">
                                <a href="${pageContext.request.contextPath}/dept/index" style="color:red;"><i class="glyphicon glyphicon-user"></i> 部门管理</a>
                            </li>
                            <li style="height:30px;">
                                <a href="${pageContext.request.contextPath}/user/index"><i class="glyphicon glyphicon-certificate"></i> 用户管理</a>
                            </li>
                        </ul>
                    </li>
                </ul>
            </div>
        </div>
        <div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
            <ol class="breadcrumb">
                <li><a href="#">首页</a></li>
                <li><a href="#">数据列表</a></li>
                <li class="active">新增</li>
            </ol>
            <div class="panel panel-default">
                <div class="panel-heading">表单数据<div style="float:right;cursor:pointer;" data-toggle="modal" data-target="#myModal"></div></div>
                <div class="panel-body">
                    <form role="form">
                        <div class="input-group" style="margin-bottom: 30px">
                            <span class="input-group-addon">所属部门</span>
                                <select class="form-control" name="dep_id">
                                    <option>选择部门</option>
                                    <c:forEach items="${depts}" var="dept">
                                        <option value="${dept.dep_id}">${dept.dep_name}</option>
                                    </c:forEach>
                                </select>
                        </div>
                        <div class="input-group" style="margin: 30px 0">
                            <span class="input-group-addon">员工姓名</span>
                            <input type="text" class="form-control" name="user_name" placeholder="请输入" aria-describedby="basic-addon1">
                        </div>
                        <div class="input-group" style="margin: 30px 0">
                            <span class="input-group-addon">员工性别</span>
                            <input type="radio" name="user_sex" value="男">男
                            <input type="radio" name="user_sex" value="女">女
                        </div>

                        <button id="addBtn" type="button" class="btn btn-success"><i class="glyphicon glyphicon-plus"></i> 新增</button>
                        <button type="button" class="btn btn-danger"><i class="glyphicon glyphicon-refresh"></i> 重置</button>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>
</div>
<script src="${pageContext.request.contextPath}/jquery/jquery-2.1.1.min.js"></script>
<script src="${pageContext.request.contextPath}/bootstrap/js/bootstrap.min.js"></script>
<script src="${pageContext.request.contextPath}/script/docs.min.js"></script>
<script>
    $(function () {
        $("#addBtn").click(function () {
            var user_nameText=$("input[name=user_name]").val();
            var user_sexText=$("input[name=user_sex]").val();
            var dep_idText=$("select").val();

            $.ajax({
                type:"POST",
                url:"${pageContext.request.contextPath}/user/insert",
                data:{
                    dep_id:dep_idText,
                    user_name:user_nameText,
                    user_sex:user_sexText
                },
                success:function (result) {
                    if (result.success) {
                        alert("员工添加成功")
                        window.location.href="${pageContext.request.contextPath}/user/index"
                    }else{
                        alert("员工添加失败")
                        window.location.href="${pageContext.request.contextPath}/user/add"
                    }
                }
            });
        });

    });
</script>
</body>
</html>
