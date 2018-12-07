<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" import="java.util.*" pageEncoding="utf-8" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%--//时间格式化引用--%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta charset="utf-8">
<title>银河物业管理</title>
    <!-- Bootstrap -->
    <link href="${pageContext.request.contextPath}/bootstrap/css/bootstrap.css" rel="stylesheet">
    <!-- jQuery (Bootstrap 的所有 JavaScript 插件都依赖 jQuery，所以必须放在前边) -->
    <script src="${pageContext.request.contextPath}/js/jquery-3.0.0.js"></script>
    <!-- 加载 Bootstrap 的所有 JavaScript 插件。你也可以根据需要只加载单个插件。 -->
    <script src="${pageContext.request.contextPath}/bootstrap/js/bootstrap.js"></script>

    <!-- meta -->
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <meta name="viewport" content="width=device-width, initial-scale = 1.0, maximum-scale=1.0, user-scalable=no"/>

    <!-- css -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css" media="screen"/>

    <style>
        body{
        background-image:url('${pageContext.request.contextPath}/img/bg.png');
        background-repeat:no-repeat;
        background-size: 110%;
        }
    </style>
</head>

<body>
    <div class="content-block" id="portfolio">
        <div class="container">
            <section class="block-body">
                <div class="row">
                    <div class="col-sm-3 col-sm-offset-1">
                        <header class="block-heading cleafix">
                            <a href="admin.jsp"><img class="img-responsive" src="${pageContext.request.contextPath}/img/myLogo-white.png" style="width: 20em;"></a>
                            <p id="tip">永不言退，我们是最好的团队</p>
                        </header>
                    </div>
                    <div class="col-sm-3 col-sm-offset-5" >
                        <a href="${pageContext.request.contextPath}/admin/default.do" class="recent-work" style="background-image:url(${pageContext.request.contextPath}/img/admin1.jpg)">
                            <span class="btn btn-o-white" id="mode">房产管理</span>
                        </a>
                    </div>
                </div>
                <div class="row">
                    <div class="col-sm-3 col-sm-offset-1">
                        <a href="${pageContext.request.contextPath}/admin/queryChargeDefault.do" class="recent-work" style="background-image:url(${pageContext.request.contextPath}/img/admin2.jpg)">
                            <span class="btn btn-o-white" id="mode">收费管理</span>
                        </a>
                    </div>
                    <div class="col-sm-3 col-sm-offset-1">
                        <a href="${pageContext.request.contextPath}/admin/listDepartment.do" class="recent-work" style="background-image:url(${pageContext.request.contextPath}/img/admin3.png)">
                            <span class="btn btn-o-white" id="mode">办公管理</span>
                        </a>
                    </div>
                    <div class="col-sm-3 col-sm-offset-1">
                        <a href="${pageContext.request.contextPath}/admin/selectallpark.do" class="recent-work" style="background-image:url(${pageContext.request.contextPath}/img/admin4.jpg)">
                            <span class="btn btn-o-white" id="mode">停车管理</span>
                        </a>
                    </div>
                </div>
                <div class="row">
                    <div class="col-sm-3 col-sm-offset-1">
                        <a href="${pageContext.request.contextPath}/admin/selectallcomplaint.do" class="recent-work" style="background-image:url(${pageContext.request.contextPath}/img/admin5.jpg)">
                            <span class="btn btn-o-white" id="mode">产权人服务管理</span>
                        </a>
                    </div>
                    <div class="col-sm-3 col-sm-offset-1">
                        <a href="clean_1.jsp" class="recent-work" style="background-image:url(${pageContext.request.contextPath}/img/admin6.jpg)">
                            <span class="btn btn-o-white" id="mode">保洁管理</span>
                        </a>
                    </div>
                    <div class="col-sm-3 col-sm-offset-1">
                        <a href="${pageContext.request.contextPath}/admin/dali.do" class="recent-work" style="background-image:url(${pageContext.request.contextPath}/img/admin7.jpg)">
                            <span class="btn btn-o-white" id="mode">安保管理</span>
                        </a>
                    </div>
                </div> 
            </section>
        </div>
    </div>
</body>

</html>