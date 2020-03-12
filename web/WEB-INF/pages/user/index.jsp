<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="d" uri="http://displaytag.sf.net" %>
<html>
<head>
    <title>用户管理</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/font-awesome.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/main.css">
    <style>
        .tree li {
            list-style-type: none;
            cursor:pointer;
        }
        /*table tbody tr:nth-child(odd){background:#F4F4F4;}
        table tbody td:nth-child(even){color:#C00;}*/
    </style>
</head>

<body>

<nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
    <div class="container-fluid">
        <div class="navbar-header">
            <div><a class="navbar-brand" style="font-size:32px;" href="#">用户管理</a></div>
        </div>
        <div id="navbar" class="navbar-collapse collapse">
            <ul class="nav navbar-nav navbar-right">
                <li style="padding-top:8px;">
                    <div class="btn-group">
                        <button type="button" class="btn btn-default btn-success dropdown-toggle" data-toggle="dropdown">
                            <i class="glyphicon glyphicon-user"></i>${u.user_name} <span class="caret"></span>
                        </button>
                        <ul class="dropdown-menu" role="menu">
                            <li><a href="index.html"><i class="glyphicon glyphicon-off"></i> 退出系统</a></li>
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
                        <span><i class="glyphicon glyphicon glyphicon-tasks"></i> 系统管理 <span class="badge" style="float:right">2</span></span>
                        <ul style="margin-top:10px;">
                            <li style="height:30px;">
                                <a href="${pageContext.request.contextPath}/dept/index" style="color:red;"><i class="glyphicon glyphicon-user"></i> 部门管理</a>
                            </li>
                            <li style="height:30px;">
                                <a href="${pageContext.request.contextPath}/user/index"><i class="glyphicon glyphicon-king"></i> 用户管理</a>
                            </li>
                        </ul>
                    </li>
                </ul>
            </div>
        </div>
        <div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
            <div class="panel panel-default">
                <div class="panel-heading">
                    <h3 class="panel-title"><i class="glyphicon glyphicon-th"></i> 数据列表</h3>
                </div>
                <div class="panel-body">
                    <form class="form-inline" role="form" style="float:left;" action="${pageContext.request.contextPath}/user/index">
                        <div class="form-group has-feedback">

                            <div class="input-group">
                                <div class="input-group-addon">员工名称</div>
                                <input class="form-control has-success" type="text" placeholder="请输入查询条件" name="user_name">
                            </div>
                            <div class="input-group">
                                <div class="input-group-addon">所属部门</div>
                                <select class="form-control" name="dep_id">
                                    <option></option>
                                    <c:forEach items="${dept}" var="d">
                                        <option value="${d.dep_id}">${d.dep_name}</option>
                                    </c:forEach>
                                </select>
                            </div>

                        </div>
                        <input type="submit" class="btn btn-warning glyphicon glyphicon-search" value="查询">
                    </form>
                    <button id="del" type="button" class="btn btn-danger" style="float:right;margin-left:10px;"><i class=" glyphicon glyphicon-remove"></i> 删除</button>
                    <button type="button" class="btn btn-primary" style="float:right;" onclick="window.location.href='${pageContext.request.contextPath}/user/add'"><i class="glyphicon glyphicon-plus"></i> 新增</button>
                    <br>
                    <hr style="clear:both;">
                    <div class="table-responsive">
                        <form id="f1">

                                <d:table class="table  table-bordered" name="users" pagesize="5"  requestURI="${pageContext.request.contextPath}/user/index">
                                    <d:column property="ck" title="<input type='checkbox' id='all'/>"></d:column>
                                    <d:column property="user_id" title="员工编号" ></d:column>
                                    <d:column property="user_name" title="员工名称"></d:column>
                                    <d:column property="department.dep_name" title="部门名称"></d:column>
                                    <d:column property="user_sex" title="员工性别"></d:column>
                                    <d:column property="user_state" title="员工状态"></d:column>
                                    <d:column  title="操作" value="修改" href="${pageContext.request.contextPath}/user/update" paramId="user_id" paramProperty="user_id"></d:column>

                                </d:table>




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
        $("#all").click(function () {
            var allState=this.checked;
            $("input[name=user_id]").each(function () {
                this.checked=allState;
            });
        });

       $("#del").click(function () {
          var cks=$("input[name=user_id]:checked") ;

          if(cks.length<1){
              alert("请选择要删除的内容");
              return;
          }

          if(confirm("确认要删除吗？？？？？？？？？")){
            $.ajax({
                type:"POST",
                url:"${pageContext.request.contextPath}/user/deletes",
                data:$("#f1").serialize(),
                success:function (result) {
                    if (result.success) {
                        alert("删除成功");
                        window.location.href="${pageContext.request.contextPath}/user/index"
                    }else{
                        alert("删除失败");
                        window.location.href="${pageContext.request.contextPath}/user/index"
                    }
              }
            });
          }
       });

    });
</script>
</body>
</html>
