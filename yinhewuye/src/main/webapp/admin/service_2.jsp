<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" import="java.util.*" pageEncoding="utf-8" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%--//时间格式化引用--%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>产权人服务</title>

    <!-- BOOTSTRAP STYLES-->
    <link href="${pageContext.request.contextPath}/bootstrap/css/bootstrap.css" rel="stylesheet" />
    <!--CUSTOM BASIC STYLES-->
    <link href="${pageContext.request.contextPath}/css/basic.css" rel="stylesheet" />
    <!-- FONTAWESOME STYLES-->
    <link href="${pageContext.request.contextPath}/css/font-awesome.css" rel="stylesheet" />

    <!-- JQUERY SCRIPTS -->
    <script src="${pageContext.request.contextPath}/js/jquery-1.10.2.js"></script>
    <!-- BOOTSTRAP SCRIPTS -->
    <script src="${pageContext.request.contextPath}/bootstrap/js/bootstrap.js"></script>
    <!-- METISMENU SCRIPTS -->
    <script src="${pageContext.request.contextPath}/js/jquery.metisMenu.js"></script>
    <!-- CUSTOM SCRIPTS -->
    <script src="${pageContext.request.contextPath}/js/custom.js"></script>

</head>
<body>
        <div id="wrapper">
            <nav class="navbar navbar-default navbar-cls-top " role="navigation" style="margin-bottom: 0">
                <div class="navbar-brand">
                    <a href="admin.jsp"><img class="img-responsive" src="${pageContext.request.contextPath}/img/myLogo-white.png" style="width: 11em;margin: 0.3em 0 0 1.5em"></a>
                </div>
                <div class="header-left">
                    <div class="first-menu">
                        <ul class="nav nav-pills" id="top-menu">
                            <li style="padding-left: 1em"><a href="${pageContext.request.contextPath}/admin/default.do">房产管理</a>
                            </li>
                            <li><a href="${pageContext.request.contextPath}/admin/queryChargeDefault.do">收费管理</a></li>
                            <li><a href="${pageContext.request.contextPath}/admin/listDepartment.do">办公管理</a></li>
                            <li><a href="${pageContext.request.contextPath}/admin/selectallpark.do">停车管理</a></li>
                            <li><a href="${pageContext.request.contextPath}/admin/selectallcomplaint.do">产权人服务</a></li>
                            <li><a href="clean_1.jsp">保洁管理</a></li>
                            <li><a href="security_1.jsp">安保管理</a></li>
                            <li  style="float:right">
                                <a href="javascript:void(0);" onclick="logout();" target="_parent">
                                    <img src="${pageContext.request.contextPath}/img/out.png" style="height: 25px;padding-bottom: 5px;"> Exit
                                </a>
                            </li>
                            <li  style="float:right">
                                <a href="#"><img src="${pageContext.request.contextPath}/img/user.png" style="height: 25px;padding-bottom: 5px;"> ${sessionScope.admin.adminName}</a>
                            </li>
                        </ul>
                    </div>
                </div>
            </nav>
            <!-- /. NAV TOP  -->
            <nav class="navbar-default navbar-side" role="navigation">
                <div class="sidebar-collapse">
                    <ul class="nav" id="main-menu">
                        
                        <li>
                            <a class="active-menu" href="#"><span class="glyphicon glyphicon-earphone" aria-hidden="true"></span>  产权人服务</a>
                        </li>
                        <li>
                            <a href="selectallcomplaint.do"><span class="glyphicon glyphicon-warning-sign" aria-hidden="true"> </span> 投诉</a>
                            
                        </li>
                        <li>
                            <a href="selectallsuggest.do"><span class="glyphicon glyphicon-comment" aria-hidden="true"></span>  建议</a>
                            
                        </li>
                        <li>
                            <a href="selectallrepaid.do"><span class="glyphicon glyphicon-wrench" aria-hidden="true"> </span> 维修</a>
                        </li>
                    </ul>
    
                </div>
    
            </nav>
            <!-- /. NAV SIDE  -->
            <div id="page-wrapper">
                <div id="page-inner">
                    <div class="container">                   
                        <!--标题-->
                        <div class="row" >
                            <div class="col-md-4 col-md-offset-4">
                                <h2>建议服务</h2>
                            </div>
                        </div>
                        <!--搜索框和添加按钮-->
                        <div class="row col-md-offset-7" >
	   				     <div class="col-md-7">
                             <form role="form" id="selecttype" action="docsrselect.do" style="margin-bottom: 20px;">
                                 <div class="input-group" >
                                     <div class="input-group-btn">
                                         <select class="form-control" name="selecttype" style="width: auto">
                                             <option value="B"><button>全部记录</button></option>
                                             <option value="B1"><button>提交人id</button></option>
                                         </select>
                                     </div>
                                     <input type="text" name="id" class="form-control">
                                 </div>
                             </form>
                         </div>
                            <div class="col-md-5">
                                <button class="btn btn-info btn-search" type="submit" form="selecttype" onclick="Submit">
                                    <span class="glyphicon glyphicon-search" aria-hidden="true"></span>查找
                                </button>

                            </div>
                        </div>
                            
                        
                        <!--表格-->
                        <div class="row">
                            <div class="col-md-12">
                                <table class="table table-hover">
                                    <tr>
                                        <th class="col-md-1">编号</th>
                                        <th class="col-md-1">提交人id</th>
                                        <th class="col-md-1">提交人姓名</th>
                                        <th class="col-md-2">联系电话</th>
                                        <th class="col-md-3">提交内容</th>
                                        <th class="col-md-1">日期</th>
                                    </tr>
                                    <c:forEach items="${csr.list}" var="csr">

                                        <tr class="mylist">
                                            <td>${csr.csrid}</td>
                                            <td>${csr.user_id}</td>
                                            <td>${csr.csrName}</td>
                                            <td>${csr.csrPhone}</td>
                                            <td>${csr.csrText}</td>
                                            <td><fmt:formatDate value="${csr.csrDate}" pattern="yyyy-MM-dd"/></td>
                                        </tr>
                                    </c:forEach>
                                </table>
                            </div>
                        </div>
                        <!--分页信息-->
                        <div class="row">
                            <div class="col-md-7">
                                当前为第${csr.pageNum}页，总共有${csr.pages}页，共有${csr.total}条记录
                            </div>
                            <div class="col-md-5">
                                <nav aria-label="Page navigation">
                                    <ul class="pagination">
                                        <li><a href="${pageContext.request.contextPath}/admin/selectcsr.do?pn=1">首页</a></li>
                                        <li>
                                            <c:if test="${csr.hasPreviousPage}">
                                                <a href="${pageContext.request.contextPath}/admin/selectcsr.do?pn=${csr.pageNum-1}"
                                                   aria-label="Previous">
                                                    <span aria-hidden="true">&laquo;</span>
                                                </a>
                                            </c:if>
                                        </li>
                                        <c:forEach items="${csr.navigatepageNums}" var="page_num">
                                            <c:if test="${page_num==csr.pageNum}">
                                                <li class="active"><a
                                                        href="${pageContext.request.contextPath}/admin/selectcsr.do?pn=${page_num}">${page_num}</a>
                                                </li>
                                            </c:if>
                                            <c:if test="${page_num!=csr.pageNum}">
                                                <li>
                                                    <a href="${pageContext.request.contextPath}/admin/selectcsr.do?pn=${page_num}">${page_num}</a>
                                                </li>
                                            </c:if>
                                        </c:forEach>

                                        <li>
                                            <c:if test="${csr.hasNextPage}">
                                                <a href="${pageContext.request.contextPath}/admin/selectcsr.do?pn=${csr.pageNum+1}"
                                                   aria-label="Next">
                                                    <span aria-hidden="true">&raquo;</span>
                                                </a>
                                            </c:if>
                                        </li>
                                        <li><a href="${pageContext.request.contextPath}/admin/selectcsr.do?pn=${csr.pages}">末页</a>
                                        </li>
                                    </ul>
                                </nav>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
<script>
        /**退出系统**/
        function logout() {
            if (confirm("您确定要退出本系统吗？")) {
                window.location.href = "/admin/adminLogout.do";
            }
        }
</script>
</body>
</html>