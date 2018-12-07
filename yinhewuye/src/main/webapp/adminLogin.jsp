<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" import="java.util.*" pageEncoding="utf-8" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%--//时间格式化引用--%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta charset="utf-8">
    <title>银河物业管理员登录</title>
    <!-- Bootstrap -->
    <link href="${pageContext.request.contextPath}/bootstrap/css/bootstrap.css" rel="stylesheet">
    <!-- jQuery (Bootstrap 的所有 JavaScript 插件都依赖 jQuery，所以必须放在前边) -->
    <script src="${pageContext.request.contextPath}/js/jquery-3.0.0.js"></script>
    <!-- 加载 Bootstrap 的所有 JavaScript 插件。你也可以根据需要只加载单个插件。 -->
    <script src="${pageContext.request.contextPath}/bootstrap/js/bootstrap.js"></script>
    <link rel='stylesheet'
          href='${pageContext.request.contextPath}/http://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap.min.css'>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}\css\adminLogin.css">
    <style>
        body {
            background-image: url('${pageContext.request.contextPath}/img/adminLogin.jpg');
            background-repeat: no-repeat;
            background-size: 100%;
        }
    </style>
</head>

<body>
<%
    String AdminId = "";
    String AdminPassword = "";
    //获取当前站点的所有Cookie
    Cookie[] cookies = request.getCookies();
    for (int i = 0; i < cookies.length; i++) {
        //对cookies中的数据进行遍历，找到用户名、密码的数据
        if ("AdminId".equals(cookies[i].getName())) {
            AdminId = cookies[i].getValue();
        } else if ("AdminPassword".equals(cookies[i].getName())) {
            AdminPassword = cookies[i].getValue();
        }
    }
%>
<div class="container">
    <div class="row">
        <div class="col-md-offset-8 col-md-4">
            <form class="form-horizontal" id="loginForm">
                <span class="heading">管理员登录</span>
                <div class="form-group">
                    <input type="text" class="form-control" id="adminid" name="adminid" value="<%=AdminId%>"
                           onclick="getcpass()" placeholder="账 户">
                </div>
                <div class="form-group help">
                    <input type="password" class="form-control" id="adminPass" name="adminPass" value="<%=AdminPassword%>" placeholder="密　码">
                    <a href="#" class="fa fa-question-circle"></a>
                </div>
                <div class="form-group">
                    <div class="main-checkbox">
                        <input type="checkbox" value="None" id="checkbox" name="checkRemem"/>
                        <label for="checkbox"></label>
                    </div>
                    <span class="text">Remember me</span>
                    <button type="button" class="btn btn-default" onclick="submitLogin()" id="loginButton">登录</button>
                </div>
            </form>
        </div>
    </div>
</div>
</body>
<script>
    <!--提交登录-->
    function submitLogin() {

        var id = $("#adminid").val();
        var pass = $("#adminPass").val();
        var remember = $("#checkbox").val()
        if (id == ""){
            alert("用户名不能为空！")
        } else if (pass == ""){
            alert("密码不能为空！")
        } else {
            $.ajax({
                url: "${pageContext.request.contextPath}/admin/adminLogin.do",
                type:"POST",
                data: {
                    adminid: id,
                    adminPass:pass,
                    checkRemem:remember
                },
                success: return_data,
                error: alter_error
            });

            function return_data(data) {
                if (data == "success_login") {
                    window.location.href="${pageContext.request.contextPath}/admin/adminMain.do";
                }else {
                    alert(data);
                    window.location.replace("${pageContext.request.contextPath}/adminLogin.jsp");
                }
            }
            function alter_error() {
                alert("数据获取失败")
            }
        }
    }
</script>
</html>
