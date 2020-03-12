<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>修改部门</title>
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
            <div><a class="navbar-brand" style="font-size:32px;" href="user.html">部门管理-修改部门</a></div>
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
                        <a href="main.html"><i class="glyphicon glyphicon-dashboard"></i> 控制面板</a>
                    </li>
                    <li class="list-group-item">
                        <span><i class="glyphicon glyphicon glyphicon-tasks"></i>系统管理管理 <span class="badge" style="float:right">3</span></span>
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
                <li class="active">修改</li>
            </ol>
            <div class="panel panel-default">
                <div class="panel-heading">表单数据<div style="float:right;cursor:pointer;" data-toggle="modal" data-target="#myModal"></div></div>
                <div class="panel-body">
                    <form role="form">
                        <div class="form-group">
                            <input type="hidden" name="dep_id" value="${dept.dep_id}">
                            <input type="hidden" name="dep_state" value="${dept.dep_state}">
                            <label>部门名称</label>
                            <input type="text" class="form-control" name="dep_name" value="${dept.dep_name}">
                        </div>
                        <div class="form-group">
                            <label>部门描述</label><br>
                            <textarea rows="10" cols="30" name="dep_desc">${dept.dep_desc}</textarea>
                        </div>
                        <button id="updateBtn" type="button" class="btn btn-success"><i class="glyphicon glyphicon-edit"></i> 修改</button>
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
        $("#updateBtn").click(function () {
            var dep_idText=$(":input[name=dep_id]").val();
            var dep_stateText=$(":input[name=dep_state]").val();
            var dep_nameText=$(":input[name=dep_name]").val();
            var dep_descText=$("textarea").val();
            $.ajax({
                type:"POST",
                url:"${pageContext.request.contextPath}/dept/doUpdate",
                data:{
                    dep_id:dep_idText,
                    dep_state:dep_stateText,
                    dep_name:dep_nameText,
                    dep_desc:dep_descText
                },
                success:function (result) {
                    if (result.success) {
                        alert("部门修改成功")
                        window.location.href="${pageContext.request.contextPath}/dept/index"
                    }else{
                        alert("部门修改失败")
                        window.location.href="${pageContext.request.contextPath}/dept/update"
                    }
                }
            });
        });

    });
</script>
</body>
</html>
