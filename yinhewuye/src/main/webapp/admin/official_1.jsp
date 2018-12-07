<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" import="java.util.*" pageEncoding="utf-8" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%--//时间格式化引用--%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta charset="utf-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <title>办公管理</title>

    <!-- BOOTSTRAP STYLES-->
    <link href="${pageContext.request.contextPath}/bootstrap/css/bootstrap.css" rel="stylesheet"/>
    <!--CUSTOM BASIC STYLES-->
    <link href="${pageContext.request.contextPath}/css/basic.css" rel="stylesheet"/>
    <!-- FONTAWESOME STYLES-->
    <link href="${pageContext.request.contextPath}/css/font-awesome.css" rel="stylesheet"/>

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
                    <li style="padding-left: 1em"><a href="${pageContext.request.contextPath}/admin/default.do">房产管理</a></li>
                    <li><a href="${pageContext.request.contextPath}/admin/queryChargeDefault.do">收费管理</a></li>
                    <li><a href="${pageContext.request.contextPath}/admin/listDepartment.do">办公管理</a></li>
                    <li><a href="${pageContext.request.contextPath}/admin/selectallpark.do">停车管理</a></li>
                    <li><a href="${pageContext.request.contextPath}/admin/selectallcomplaint.do">产权人服务</a></li>
                    <li><a href="clean_1.jsp">保洁管理</a></li>
                    <li><a href="security_1.jsp">安保管理</a></li>
                    <li style="float:right">
                        <a href="javascript:void(0);" onclick="logout();" target="_parent">
                            <img src="${pageContext.request.contextPath}/img/out.png"
                                 style="height: 25px;padding-bottom: 5px;">Exit
                        </a>
                    </li>
                    <li  style="float:right">
                        <a href="#"><img src="${pageContext.request.contextPath}/img/user.png" style="height: 25px;padding-bottom: 5px;"> ${sessionScope.admin.adminName}</a>
                    </li>
                </ul>
            </div>
        </div>
    </nav>
    <!-- /. NAV TOP -->
    <nav class="navbar-default navbar-side" role="navigation">
        <div class="sidebar-collapse">
            <ul class="nav" id="main-menu">

                <li>
                    <a class="active-menu" href="#"><span class="glyphicon glyphicon-check" aria-hidden="true"></span>
                        办公管理</a>
                </li>
                <li>
                    <a href="${pageContext.request.contextPath}/admin/listDepartment.do"><span
                            class="glyphicon glyphicon-level-up" aria-hidden="true"> </span> 部门信息</a>
                </li>
                <li>
                    <a href="#"><span class="glyphicon glyphicon-menu-hamburger" aria-hidden="true"> </span> 日常管理 <span
                            class="glyphicon glyphicon-chevron-down" aria-hidden="true" id="down"></span> </a>
                    <ul class="nav nav-second-level">
                        <li>
                            <a href="${pageContext.request.contextPath}/admin/listStaff.do"><span
                                    class="glyphicon glyphicon-thumbs-up" aria-hidden="true"> </span> 员工信息</a>
                        </li>
                        <li>
                            <a href="${pageContext.request.contextPath}/admin/listTraiReco.do"><span
                                    class="glyphicon glyphicon-floppy-disk" aria-hidden="true"></span> 培训记录</a>
                        </li>
                        <li>
                            <a href="${pageContext.request.contextPath}/admin/listInspection.do"><span
                                    class="glyphicon glyphicon-stats" aria-hidden="true"> </span> 员工考核</a>
                        </li>
                    </ul>
                </li>
            </ul>

        </div>

    </nav>
    <!-- /. NAV SIDE -->
    <div id="page-wrapper">
        <div id="page-inner">
            <div class="container">
                <!--标题-->
                <div class="row">
                    <div class="col-md-4 col-md-offset-4">
                        <h2>部门信息</h2>
                    </div>
                </div>
                <!--搜索框和添加按钮-->
                <div class="row col-md-offset-7">
                    <div class="col-md-7">
                        <form role="form" action="${pageContext.request.contextPath}/admin/SelectDepartment.do"
                              style="margin-bottom: 20px;" id="selectForm">
                            <div class="input-group">
                                <div class="input-group-btn">
                                    <select class="form-control" style="width: auto" name="selectmode">
                                        <option value="1">
                                            <button>查询全部</button>
                                        </option>
                                        <option value="2">
                                            <button>按部门编号</button>
                                        </option>
                                        <option value="3">
                                            <button>按部门名称</button>
                                        </option>
                                    </select>
                                </div>
                                <input type="text" class="form-control" name="selectvalue">
                            </div>
                        </form>
                    </div>
                    <div class="col-md-5">
                        <button class="btn btn-info btn-search" type="submit" form="selectForm" value="Submit">
                            <span class="glyphicon glyphicon-search" aria-hidden="true"></span>查找
                        </button>
                        <button class="btn btn-success " data-toggle="modal" data-target="#myModal1">
                            <span class="glyphicon glyphicon-plus" aria-hidden="true"></span>添加
                        </button>
                        <!--添加按钮触发模态框-->
                        <div class="modal fade" id="myModal1" tabindex="-1" role="dialog" aria-labelledby="myModalLabel"
                             aria-hidden="true">
                            <div class="modal-dialog">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                                            &times;
                                        </button>
                                        <h4 class="modal-title" id="myModalLabe">
                                            部门信息
                                        </h4>
                                    </div>
                                    <div class="modal-body">
                                        <form class="form-horizontal" role="form"
                                              action="${pageContext.request.contextPath}/admin/InserDepartment.do"
                                              id="inserForm">
                                            <div class="form-group">
                                                <label class="col-sm-3 control-label">部门编号</label>
                                                <div class="col-sm-9">
                                                    <input type="text" class="form-control" id="insert_partid"
                                                           placeholder="请输入部门编号" name="partid">
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label class="col-sm-3 control-label">部门名称</label>
                                                <div class="col-sm-9">
                                                    <input type="text" class="form-control" id="insert_partName"
                                                           placeholder="请输入部门名称" name="partName">
                                                </div>
                                            </div>

                                            <div class="form-group">
                                                <label class="col-sm-3 control-label">部门职责</label>
                                                <div class="col-sm-9">
                                                    <input type="text" class="form-control" id="insert_partDuty"
                                                           placeholder="请输入部门职责" name="partDuty">
                                                </div>
                                            </div>
                                        </form>
                                    </div>
                                    <div class="modal-footer">
                                        <button type="button" class="btn btn-default" data-dismiss="modal">关闭
                                        </button>
                                        <button type="submit" class="btn btn-primary" onclick="return panduan1()"
                                                form="inserForm"
                                                value="Submit">
                                            提交更改
                                        </button>
                                    </div>
                                </div><!-- /.modal-content -->
                            </div><!-- /.modal -->
                        </div>
                    </div>
                </div>


                <!--表格-->
                <div class="row">
                    <div class="col-md-12">
                        <table class="table table-hover">
                            <tr>
                                <th class="col-md-2">部门编号</th>
                                <th class="col-md-2">部门名称</th>
                                <th class="col-md-6">部门职责</th>
                                <th class="col-md-1">修改</th>
                                <th class="col-md-1">删除</th>
                            </tr>
                            <c:forEach items="${pageInfo.list}" var="DepartmentList">
                                <tr class="mylist">
                                    <td id="partid">${DepartmentList.partid}</td>
                                    <td id="partName">${DepartmentList.partName}</td>
                                    <td id="partDuty">${DepartmentList.partDuty}</td>

                                    <td>
                                        <!--修改按钮触发模态框-->
                                        <button type="button" class="btn btn-primary btn-sm" data-toggle="modal"
                                                data-target="#myModal">
                                            <span class="glyphicon glyphicon-pencil" aria-hidden="true"></span>
                                            修改
                                        </button>

                                    </td>
                                    <td>
                                        <button type="button" class="btn btn-danger btn-sm">
                                            <span class="glyphicon glyphicon-trash" aria-hidden="true"></span>
                                            删除
                                        </button>
                                    </td>
                                </tr>
                            </c:forEach>
                            <tr>
                                <td>
                                    <!--修改模态框-->
                                    <div class="modal fade" id="myModal" tabindex="-1" role="dialog"
                                         aria-labelledby="myModalLabel"
                                         aria-hidden="true">
                                        <div class="modal-dialog">
                                            <div class="modal-content">
                                                <div class="modal-header">
                                                    <button type="button" class="close" data-dismiss="modal"
                                                            aria-hidden="true">
                                                        &times;
                                                    </button>
                                                    <h4 class="modal-title" id="myModalLabel">
                                                        部门信息
                                                    </h4>
                                                </div>
                                                <div class="modal-body">
                                                    <form class="form-horizontal" role="form"
                                                          action="${pageContext.request.contextPath}/admin/UpdateDepartment.do"
                                                          id="edit">
                                                        <div class="form-group">
                                                            <label class="col-sm-3 control-label">部门编号</label>
                                                            <div class="col-sm-9">
                                                                <input type="text" class="form-control"
                                                                       id="update_partid" name="partid">
                                                            </div>
                                                        </div>
                                                        <div class="form-group">
                                                            <label class="col-sm-3 control-label">部门名称</label>
                                                            <div class="col-sm-9">
                                                                <input type="text" class="form-control"
                                                                       id="update_partName"
                                                                       name="partName">
                                                            </div>
                                                        </div>

                                                        <div class="form-group">
                                                            <label class="col-sm-3 control-label">部门职责</label>
                                                            <div class="col-sm-9">
                                                                <input type="text" class="form-control"
                                                                       id="update_partDuty"
                                                                       name="partDuty">
                                                            </div>
                                                        </div>
                                                    </form>
                                                </div>
                                                <div class="modal-footer">
                                                    <button type="button" class="btn btn-default" data-dismiss="modal">
                                                        关闭
                                                    </button>
                                                    <button type="submit" class="btn btn-primary"
                                                            onclick="return panduan2()" form="edit"
                                                            value="Submit">提交更改
                                                    </button>
                                                </div>
                                            </div><!-- /.modal-content -->
                                        </div><!-- /.modal -->
                                    </div>
                                </td>
                            </tr>
                        </table>
                    </div>
                </div>
                <!--分页信息-->
                <!--分页信息-->
                <div class="row">
                    <%--分页文字信息--%>
                    <div class="col-md-7">
                        当前为第${pageInfo.pageNum}页，总共有${pageInfo.pages}页，共有${pageInfo.total}条记录
                    </div>
                    <%--	分页条--%>
                    <div class="col-md-5">
                        <nav aria-label="Page navigation">
                            <ul class="pagination">
                                <li><a href="${pageContext.request.contextPath}/admin/listDepartment.do?pn=1">首页</a></li>
                                <li>
                                    <c:if test="${pageInfo.hasPreviousPage}">
                                        <a href="${pageContext.request.contextPath}/admin/listDepartment.do?pn=${pageInfo.pageNum-1}"
                                           aria-label="Previous">
                                            <span aria-hidden="true">&laquo;</span>
                                        </a>
                                    </c:if>
                                </li>
                                <c:forEach items="${pageInfo.navigatepageNums}" var="page_num">
                                    <c:if test="${page_num==pageInfo.pageNum}">
                                        <li class="active"><a
                                                href="${pageContext.request.contextPath}/admin/listDepartment.do?pn=${page_num}">${page_num}</a>
                                        </li>
                                    </c:if>
                                    <c:if test="${page_num!=pageInfo.pageNum}">
                                        <li>
                                            <a href="${pageContext.request.contextPath}/admin/listDepartment.do?pn=${page_num}">${page_num}</a>
                                        </li>
                                    </c:if>
                                </c:forEach>

                                <li>
                                    <c:if test="${pageInfo.hasNextPage}">
                                        <a href="${pageContext.request.contextPath}/admin/listDepartment.do?pn=${pageInfo.pageNum+1}"
                                           aria-label="Next">
                                            <span aria-hidden="true">&raquo;</span>
                                        </a>
                                    </c:if>
                                </li>
                                <li><a href="${pageContext.request.contextPath}/admin/listDepartment.do?pn=${pageInfo.pages}">末页</a>
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
    function panduan1() {
        if ($("#insert_partid").val().length == 0) {
            alert("不能为空啊！");
            return false;
        }
        else if ($("#insert_partName").val().length == 0) {
            alert("不能为空啊！");
            return false;
        }
        else if ($("#insert_partDuty").val().length == 0) {
            alert("不能为空啊！");
            return false;
        }
        else
        // jq提交表单
            return true;
    }

    function panduan2() {
        if ($("#update_partid").val().length == 0) {
            alert("部门id不能为空！亲~");
            return false;
        }
        else if ($("#update_partName").val().length == 0) {
            alert("部门名称不能为空！亲~");
            return false;
        }
        else if ($("#update_partDuty").val().length == 0) {
            alert("部门职责不能为空！亲~");
            return false;
        }
        else
        // jq提交表单
            return true;
    }

    //全部不能为空
    //使用时onclick="return myCheck()"
    function myCheck() {
        for (var i = 0; i <= document.form1.elements.length - 1; i++) {
            if (document.form1.elements[i].value == "") {
                alert("当前表单不能有空项");
                document.form1.elements[i].focus();
                return false;
            }
        }
        return true;
    }

    /**退出系统**/
    function logout() {
        if (confirm("您确定要退出本系统吗？")) {
            window.location.href = "/admin/adminLogout.do";
        }
    }

    $(function () {
        $(".mylist").each(function () {
            var tmp = $(this).children().eq(3);
            var btn = tmp.children();
            var tmp1 = $(this).children().eq(4);
            var btn1 = tmp1.children();
            btn.bind("click", function () {
                //add为表单form的id
                var td_lenght = $("#edit input").length;
                var a = new Array();
                for (var i = 0; i < td_lenght; i++) {
                    a[i] = btn.parent().parent().children("td").get(i).innerHTML;
                }
                for (var j = 0; j < td_lenght; j++) {
                    $('#edit input').eq(j).val(a[j]);
                }
            });
            btn1.bind("click", function () {
                var id = btn1.parent().parent().children("td").get(0).innerHTML;
                // alert(id);
                useAjax(id);
            });

        });
        $("#update_partid").attr("readonly", "readonly");
    });

    <!--删除-->
    function useAjax(id) {
        $.ajax({
            url: "${pageContext.request.contextPath}/admin/DelectDepartmentByPartid.do",
            data: {partid: id},
            success: return_data
        });

        function return_data(data) {
            alert(data);
            window.location.replace("${pageContext.request.contextPath}/admin/listDepartment.do");
        }
    }
</script>
</body>
</html>
