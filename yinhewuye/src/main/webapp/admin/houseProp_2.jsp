<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" import="java.util.*" pageEncoding="utf-8" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%--//时间格式化引用--%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta charset="utf-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <title>房产管理</title>

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
                    <li style="padding-left: 1em"><a href="${pageContext.request.contextPath}/admin/default.do">房产管理</a>
                    </li>
                    <li><a href="${pageContext.request.contextPath}/admin/queryChargeDefault.do">收费管理</a></li>
                    <li><a href="${pageContext.request.contextPath}/admin/listDepartment.do">办公管理</a></li>
                    <li><a href="${pageContext.request.contextPath}/admin/selectallpark.do">停车管理</a></li>
                    <li><a href="${pageContext.request.contextPath}/admin/selectallcomplaint.do">产权人服务</a></li>
                    <li><a href="clean_1.jsp">保洁管理</a></li>
                    <li><a href="security_1.jsp">安保管理</a></li>
                    <li style="float:right">
                        <a href="javascript:void(0);" onclick="logout();" target="_parent">
                            <img src="${pageContext.request.contextPath}/img/out.png"
                                 style="height: 25px;padding-bottom: 5px;"> Exit
                        </a>
                    </li>
                    <li style="float:right">
                        <a href="#"><img src="${pageContext.request.contextPath}/img/user.png"
                                         style="height: 25px;padding-bottom: 5px;"> ${sessionScope.admin.adminName}</a>
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
                    <a class="active-menu" href="#"><span class="glyphicon glyphicon-th-list" aria-hidden="true"></span>
                        房产管理</a>
                </li>
                <li>
                    <a href="${pageContext.request.contextPath}/admin/default.do"><span
                            class="glyphicon glyphicon-signal" aria-hidden="true"> </span>房产信息</a>

                </li>
                <li>
                    <a href="${pageContext.request.contextPath}/admin/queryBuildingdefault.do"><span
                            class="glyphicon glyphicon-option-horizontal"
                            aria-hidden="true"> </span>楼宇管理</a>

                </li>
                <li>
                    <a href="#"><span class="glyphicon glyphicon-duplicate" aria-hidden="true"></span> 业务管理 <span
                            class="glyphicon glyphicon-chevron-down" aria-hidden="true" id="down"></span></a>
                    <ul class="nav nav-second-level">
                        <li>
                            <a href="${pageContext.request.contextPath}/admin/queryResidentdefault.do"><span
                                    class="glyphicon glyphicon-home" aria-hidden="true"> </span>住户信息</a>
                        </li>
                        <li>
                            <a href="${pageContext.request.contextPath}/admin/queryHousTrandefault.do"><span
                                    class="glyphicon glyphicon-send" aria-hidden="true"> </span>房屋交接信息</a>
                        </li>
                    </ul>
                </li>
            </ul>

        </div>

    </nav>
    <!-- /. NAV SIDE  -->
    <div id="page-wrapper">
        <div id="page-inner">
            <div class="container">
                <!--标题-->
                <div class="row">
                    <div class="col-md-4 col-md-offset-4">
                        <h2>楼宇信息</h2>
                    </div>
                </div>
                <!--搜索框和添加按钮-->
                <div class="row col-md-offset-7">
                    <div class="col-md-7">
                        <form role="form" action="${pageContext.request.contextPath}/admin/queryCondi.do" style="margin-bottom: 20px;" method="post"
                              id="building">
                            <div class="input-group">
                                <div class="input-group-btn">
                                    <select class="form-control" style="width: auto" name="condition">
                                        <option value="C">
                                            <button>楼号</button>
                                        </option>
                                        <option value="D">
                                            <button>楼宇布局</button>
                                        </option>
                                        <option value="E">
                                            <button>建造公司</button>
                                        </option>
                                        <%--<option><button>工期</button></option>--%>
                                    </select>
                                </div>
                                <input type="text" class="form-control" name="condiValue">
                            </div>
                        </form>
                    </div>
                    <div class="col-md-5">
                        <button class="btn btn-info btn-search" type="submit" form="building" value="Submit">
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
                                        <h4 class="modal-title" id="myModalLabel1">
                                            楼宇信息
                                        </h4>
                                    </div>
                                    <div class="modal-body">
                                        <form class="form-horizontal" role="form" action="${pageContext.request.contextPath}/admin/insertBuilding.do"
                                              method="post" id="addBuilding">
                                            <%--<div class="form-group">
                                                <label class="col-sm-2 control-label">楼&nbsp;&nbsp;&nbsp;号</label>
                                                <div class="col-sm-10">
                                                    <input type="text" class="form-control" id="insert_builid"
                                                           placeholder="请输入楼号" name="">
                                                </div>
                                            </div>--%>
                                            <div class="form-group">
                                                <label class="col-sm-2 control-label">楼宇布局</label>
                                                <div class="col-sm-10">
                                                    <input type="text" class="form-control" id="insert_layout"
                                                           placeholder="请输入楼宇布局" name="layout">
                                                </div>
                                            </div>

                                            <div class="form-group">
                                                <label class="col-sm-2 control-label">建造公司</label>
                                                <div class="col-sm-10">
                                                    <input type="text" class="form-control" id="insert_buildComp"
                                                           placeholder="请输入建造公司" name="builComp">
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label class="col-sm-2 control-label">工期</label>
                                                <div class="col-sm-10">
                                                    <input type="date" class="form-control" id="insert_buildDate"
                                                           placeholder="请输入工期" name="builDate">
                                                </div>
                                            </div>
                                        </form>
                                    </div>
                                    <div class="modal-footer">
                                        <button type="button" class="btn btn-default" data-dismiss="modal">关闭
                                        </button>
                                        <button type="submit" class="btn btn-primary" form="addBuilding" value="Submit" onclick="return panduan1()">
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
                                <th class="col-md-2">楼号</th>
                                <th class="col-md-2">楼宇布局</th>
                                <th class="col-md-2">建造公司</th>
                                <th class="col-md-2">工期</th>
                                <th class="col-md-1">修改</th>
                                <th class="col-md-1">删除</th>
                            </tr>
                            <c:forEach items="${pageInfo.list}" var="building">
                                <tr class="mylist">
                                        <%--<td></td>--%>
                                    <td id="builid">${building.builid}</td>
                                    <td id="layout">${building.layout}</td>
                                    <td id="buildComp">${building.builComp}</td>
                                    <td id="buildDate"><fmt:formatDate value="${building.builDate}"
                                                                       pattern="yyyy-MM-dd"/></td>
                                    <td>
                                        <!--按钮触发模态框-->
                                        <button type="button" class="btn btn-primary  btn-sm" data-toggle="modal"
                                                data-target="#myModal">
                                            <span class="glyphicon glyphicon-pencil" aria-hidden="true"></span>
                                            修改
                                        </button>

                                    </td>
                                    <td>
                                        <button type="button" class="btn btn-danger  btn-sm">
                                            <span class="glyphicon glyphicon-trash" aria-hidden="true"></span>
                                            删除
                                        </button>
                                    </td>
                                </tr>
                            </c:forEach>
                            <%--<tr>
                                <td></td>
                                <td></td>
                                <td></td>
                                <td></td>
                                <td></td>
                                <td>
                                    <button type="button" class="btn btn-primary  btn-sm" data-toggle="modal"
                                            data-target="#myModal">
                                        <span class="glyphicon glyphicon-pencil" aria-hidden="true"></span>
                                        修改
                                    </button>
                                </td>
                                <td>
                                    <button type="button" class="btn btn-danger  btn-sm">
                                        <span class="glyphicon glyphicon-trash" aria-hidden="true"></span>
                                        删除
                                    </button>
                                </td>
                            </tr>
                            <tr>
                                <td></td>
                                <td></td>
                                <td></td>
                                <td></td>
                                <td></td>
                                <td>
                                    <button type="button" class="btn btn-primary  btn-sm" data-toggle="modal"
                                            data-target="#myModal">
                                        <span class="glyphicon glyphicon-pencil" aria-hidden="true"></span>
                                        修改
                                    </button>
                                </td>
                                <td>
                                    <button type="button" class="btn btn-danger  btn-sm">
                                        <span class="glyphicon glyphicon-trash" aria-hidden="true"></span>
                                        删除
                                    </button>
                                </td>
                            </tr>
                            <tr>
                                <td></td>
                                <td></td>
                                <td></td>
                                <td></td>
                                <td></td>
                                <td>
                                    <button type="button" class="btn btn-primary  btn-sm" data-toggle="modal"
                                            data-target="#myModal">
                                        <span class="glyphicon glyphicon-pencil" aria-hidden="true"></span>
                                        修改
                                    </button>
                                </td>
                                <td>
                                    <button type="button" class="btn btn-danger  btn-sm">
                                        <span class="glyphicon glyphicon-trash" aria-hidden="true"></span>
                                        删除
                                    </button>
                                </td>
                            </tr>
                            <tr>
                                <td></td>
                                <td></td>
                                <td></td>
                                <td></td>
                                <td></td>
                                <td>
                                    <button type="button" class="btn btn-primary  btn-sm" data-toggle="modal"
                                            data-target="#myModal">
                                        <span class="glyphicon glyphicon-pencil" aria-hidden="true"></span>
                                        修改
                                    </button>
                                </td>
                                <td>
                                    <button type="button" class="btn btn-danger  btn-sm">
                                        <span class="glyphicon glyphicon-trash" aria-hidden="true"></span>
                                        删除
                                    </button>
                                </td>
                            </tr>--%>
                        </table>
                        <!--模态框-->
                        <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel"
                             aria-hidden="true">
                            <div class="modal-dialog">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                                            &times;
                                        </button>
                                        <h4 class="modal-title" id="myModalLabel">
                                            楼宇信息
                                        </h4>
                                    </div>
                                    <div class="modal-body">
                                        <form class="form-horizontal" role="form" id="edit"
                                              action="${pageContext.request.contextPath}/admin/updateBuilding.do" method="post">
                                            <div class="form-group">
                                                <label class="col-sm-2 control-label">楼&nbsp;&nbsp;&nbsp;号</label>
                                                <div class="col-sm-10">
                                                    <input type="text" class="form-control" id="update_builid" name="builid">
                                                </div>
                                            </div>

                                            <div class="form-group">
                                                <label class="col-sm-2 control-label">楼宇布局</label>
                                                <div class="col-sm-10">
                                                    <input type="text" class="form-control" id="update_layout" name="layout">
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label class="col-sm-2 control-label">建造公司</label>
                                                <div class="col-sm-10">
                                                    <input type="text" class="form-control" id="update_buildComp"
                                                           name="builComp">
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label class="col-sm-2 control-label">工期</label>
                                                <div class="col-sm-10">
                                                    <input type="date" class="form-control" id="update_buildDate"
                                                           name="builDate">
                                                </div>
                                            </div>
                                        </form>
                                    </div>
                                    <div class="modal-footer">
                                        <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                                        <button type="submit" class="btn btn-primary" form="edit"
                                                value="Submit" onclick="return panduan2()">提交更改
                                        </button>
                                    </div>
                                </div><!-- /.modal-content -->
                            </div><!-- /.modal -->
                        </div>
                    </div>
                </div>
                <!--分页信息-->
                <div class="row">
                    <div class="col-md-7">
                        当前为第${pageInfo.pageNum}页，总共有${pageInfo.pages}页，共有${pageInfo.total}条记录
                    </div>
                    <div class="col-md-5">
                        <nav aria-label="Page navigation">
                            <ul class="pagination">
                                <li><a href="${pageContext.request.contextPath}/admin/queryBuilding.do?pn=1">首页</a></li>
                                <li>
                                    <c:if test="${pageInfo.hasPreviousPage}">
                                        <a href="${pageContext.request.contextPath}/admin/queryBuilding.do?pn=${pageInfo.pageNum-1}"
                                           aria-label="Previous">
                                            <span aria-hidden="true">&laquo;</span>
                                        </a>
                                    </c:if>
                                </li>
                                <c:forEach items="${pageInfo.navigatepageNums}" var="page_num">
                                    <c:if test="${page_num==pageInfo.pageNum}">
                                        <li class="active"><a
                                                href="${pageContext.request.contextPath}/admin/queryBuilding.do?pn=${page_num}">${page_num}</a>
                                        </li>
                                    </c:if>
                                    <c:if test="${page_num!=pageInfo.pageNum}">
                                        <li>
                                            <a href="${pageContext.request.contextPath}/admin/queryBuilding.do?pn=${page_num}">${page_num}</a>
                                        </li>
                                    </c:if>
                                </c:forEach>
                                <li>
                                    <c:if test="${pageInfo.hasNextPage}">
                                        <a href="${pageContext.request.contextPath}/admin/queryBuilding.do?pn=${pageInfo.pageNum+1}"
                                           aria-label="Next">
                                            <span aria-hidden="true">&raquo;</span>
                                        </a>
                                    </c:if>
                                </li>
                                <li><a href="${pageContext.request.contextPath}/admin/queryBuilding.do?pn=${pageInfo.pages}">末页</a>
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
        /*if ($("#insert_builid").val().length == 0) {
            alert("不能为空啊！");
            return false;
        }*/
        if ($("#insert_layout").val().length == 0) {
            alert("不能为空啊！");
            return false;
        }
        else if ($("#insert_buildComp").val().length == 0) {
            alert("不能为空啊！");
            return false;
        }
        else if ($("#insert_buildDate").val().length == 0) {
            alert("不能为空啊！");
            return false;
        }
        else
        // jq提交表单
            return true;
    }

    function panduan2() {
        if ($("#update_builid").val().length == 0) {
            alert("不能为空啊！");
            return false;
        }
        else if ($("#update_layout").val().length == 0) {
            alert("不能为空啊！");
            return false;
        }
        else if ($("#update_buildComp").val().length == 0) {
            alert("不能为空啊！");
            return false;
        }
        else if ($("#update_buildDate").val().length == 0) {
            alert("不能为空啊！");
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
            var tmp = $(this).children().eq(4);
            var btn = tmp.children();
            var tmp1 = $(this).children().eq(5);
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
        $("#update_builid").attr("readonly", "readonly");
    });
    function useAjax(id) {
        $.ajax({
            url: "${pageContext.request.contextPath}/admin/deleteBuilding.do",
            // type: 'post',
            // dataType: 'json',
            data: {builid: id},
            success: return_data
        });

        function return_data(data) {
            // if (data="1")
            alert(data);
            // else
            //     alert("插入失败！")
            // window.location.reload();
            // window.location.href ="/selectallspotmana.do";
            window.location.replace("${pageContext.request.contextPath}/admin/queryBuildingdefault.do");
        }
    }
</script>

</body>
</html>