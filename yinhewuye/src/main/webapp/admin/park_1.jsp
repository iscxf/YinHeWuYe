<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" import="java.util.*" pageEncoding="utf-8" %>
<%@ page import="yh.yhwy.bean.Admin" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%--//时间格式化引用--%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta charset="utf-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <title>停车管理</title>

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
                                         style="height: 25px;padding-bottom: 5px;"> ${sessionScope.admin.adminName}
                        </a>
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
                    <a class="active-menu" href="#"><span class="glyphicon glyphicon-map-marker"
                                                          aria-hidden="true"></span> 停车管理</a>
                </li>
                <li>
                    <a href="selectallpark.do"><span class="glyphicon glyphicon-road" aria-hidden="true"></span>
                        停车场信息</a>

                </li>
                <li>
                    <a href="selectallspotmana.do"><span class="glyphicon glyphicon-bullhorn" aria-hidden="true"></span>
                        停车位信息</a>

                </li>
                <li>
                    <a href="selectallhistory.do"><span class="glyphicon glyphicon-duplicate" aria-hidden="true"></span>
                        历史记录信息</a>
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
                        <h2>停车场信息</h2>
                    </div>
                </div>
                <!--搜索框和添加按钮-->
                <div class="row col-md-offset-6" style="position: relative;right: -25px;">
                    <div class="col-md-7">
                        <form role="form" id="selecttype" method="post"
                              action="${pageContext.request.contextPath}/admin/doparkselect.do"
                              style="margin-bottom: 20px;">
                            <div class="input-group">
                                <div class="input-group-btn">
                                    <select class="form-control" name="selecttype" style="width: auto">
                                        <option value="1">
                                            <button>全部停车场</button>
                                        </option>
                                        <option value="2">
                                            <button>停车场号</button>
                                        </option>
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
                                            停车场信息
                                        </h4>
                                    </div>
                                    <div class="modal-body">
                                        <form class="form-horizontal" role="form" id="addparkform"
                                              action="${pageContext.request.contextPath}/admin/addpark.do" name="form1">
                                            <div class="form-group">
                                                <label class="col-sm-3 control-label">停车场号</label>
                                                <div class="col-sm-9">
                                                    <input type="text" class="form-control" id="insert_parkid"
                                                           placeholder="请输入停车场号" name="parkid">
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label class="col-sm-3 control-label">停车场名字</label>
                                                <div class="col-sm-9">
                                                    <input type="text" class="form-control" id="insert_parkName"
                                                           placeholder="请输入停车场名字" name="parkName">
                                                </div>
                                            </div>

                                            <div class="form-group">
                                                <label class="col-sm-3 control-label">面积</label>
                                                <div class="col-sm-9">
                                                    <input type="text" class="form-control" id="insert_parkSqua"
                                                           placeholder="请输入面积" name="parkSqua">
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label class="col-sm-3 control-label">地址</label>
                                                <div class="col-sm-9">
                                                    <input type="text" class="form-control" id="insert_parkAddr"
                                                           placeholder="请输入地址" name="parkAddr">
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label class="col-sm-3 control-label">总停车位</label>
                                                <div class="col-sm-9">
                                                    <input type="text" class="form-control" id="insert_parkTota"
                                                           placeholder="请输入总停车位" name="parkTota">
                                                </div>
                                            </div>
                                        </form>
                                    </div>
                                    <div class="modal-footer">
                                        <button type="button" class="btn btn-default" data-dismiss="modal">关闭
                                        </button>
                                        <button type="submit" class="btn btn-primary" form="addparkform"
                                                onclick="return panduan1()">
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
                                <th class="col-md-2">停车场号</th>
                                <th class="col-md-2">停车场名字</th>
                                <th class="col-md-2">面积</th>
                                <th class="col-md-2">地址</th>
                                <th class="col-md-2">总停车位</th>
                                <th class="col-md-1">修改</th>
                            </tr>
                            <c:forEach items="${stu.list}" var="stu">

                                <tr class="mylist">
                                    <td>${stu.parkid}</td>
                                    <td>${stu.parkName}</td>
                                    <td>${stu.parkSqua}</td>
                                    <td>${stu.parkAddr}</td>
                                    <td>${stu.parkTota}</td>
                                    <td>
                                        <!--修改按钮触发模态框-->
                                        <button class="btn btn-primary btn-sm" data-toggle="modal"
                                                data-target="#myModal">
                                            <span class="glyphicon glyphicon-pencil" aria-hidden="true"></span>
                                            编辑
                                        </button>
                                    </td>
                                </tr>
                            </c:forEach>

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
                                            停车场信息
                                        </h4>
                                    </div>
                                    <div class="modal-body">
                                        <form class="form-horizontal" role="form"
                                              action="${pageContext.request.contextPath}/admin/updateparkbyid.do"
                                              id="edit">
                                            <div class="form-group">
                                                <label class="col-sm-3 control-label">停车场号</label>
                                                <div class="col-sm-9">
                                                    <input type="text" class="form-control" id="update_parkid"
                                                           name="parkid">
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label class="col-sm-3 control-label">停车场名字</label>
                                                <div class="col-sm-9">
                                                    <input type="text" class="form-control" id="update_parkName"
                                                           name="parkName">
                                                </div>
                                            </div>

                                            <div class="form-group">
                                                <label class="col-sm-3 control-label">面积</label>
                                                <div class="col-sm-9">
                                                    <input type="text" class="form-control" id="update_parkSqua"
                                                           name="parkSqua">
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label class="col-sm-3 control-label">地址</label>
                                                <div class="col-sm-9">
                                                    <input type="text" class="form-control" id="update_parkAddr"
                                                           name="parkAddr">
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label class="col-sm-3 control-label">总停车位</label>
                                                <div class="col-sm-9">
                                                    <input type="text" class="form-control" id="update_parkTota"
                                                           name="parkTota">
                                                </div>
                                            </div>
                                        </form>
                                    </div>
                                    <div class="modal-footer">
                                        <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                                        <button type="submit" class="btn btn-primary" form="edit"
                                                onclick="return panduan2()">提交更改
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
                        当前为第${stu.pageNum}页，总共有${stu.pages}页，共有${stu.total}条记录
                    </div>
                    <div class="col-md-5">
                        <nav aria-label="Page navigation">
                            <ul class="pagination">
                                <li><a href="${pageContext.request.contextPath}/admin/selectpark.do?pn=1">首页</a></li>
                                <li>
                                    <c:if test="${stu.hasPreviousPage}">
                                        <a href="${pageContext.request.contextPath}/admin/selectpark.do?pn=${stu.pageNum-1}"
                                           aria-label="Previous">
                                            <span aria-hidden="true">&laquo;</span>
                                        </a>
                                    </c:if>
                                </li>
                                <c:forEach items="${stu.navigatepageNums}" var="page_num">
                                    <c:if test="${page_num==stu.pageNum}">
                                        <li class="active"><a
                                                href="${pageContext.request.contextPath}/admin/selectpark.do?pn=${page_num}">${page_num}</a>
                                        </li>
                                    </c:if>
                                    <c:if test="${page_num!=stu.pageNum}">
                                        <li>
                                            <a href="${pageContext.request.contextPath}/admin/selectpark.do?pn=${page_num}">${page_num}</a>
                                        </li>
                                    </c:if>
                                </c:forEach>

                                <li>
                                    <c:if test="${stu.hasNextPage}">
                                        <a href="${pageContext.request.contextPath}/admin/selectpark.do?pn=${stu.pageNum+1}"
                                           aria-label="Next">
                                            <span aria-hidden="true">&raquo;</span>
                                        </a>
                                    </c:if>
                                </li>
                                <li>
                                    <a href="${pageContext.request.contextPath}/admin/selectpark.do?pn=${stu.pages}">末页</a>
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
    // 判断
    function panduan1() {
        if ($("#insert_parkid").val().length == 0) {
            alert("不能为空啊！");
            return false;
        }
        else if ($("#insert_parkName").val().length == 0) {
            alert("不能为空啊！");
            return false;
        }
        else if ($("#insert_parkSqua").val().length == 0) {
            alert("不能为空啊！");
            return false;
        }
        else if ($("#insert_parkAddr").val().length == 0) {
            alert("不能为空啊！");
            return false;
        }
        else if ($("#insert_parkTota").val().length == 0) {
            alert("不能为空啊！");
            return false;
        }
        else
        // jq提交表单
            return true;
    }

    function panduan2() {
        if ($("#update_parkid").val().length == 0) {
            alert("不能为空啊！");
            return false;
        }
        else if ($("#update_parkName").val().length == 0) {
            alert("不能为空啊！");
            return false;
        }
        else if ($("#update_parkSqua").val().length == 0) {
            alert("不能为空啊！");
            return false;
        }
        else if ($("#update_parkAddr").val().length == 0) {
            alert("不能为空啊！");
            return false;
        }
        else if ($("#update_parkTota").val().length == 0) {
            alert("不能为空啊！");
            return false;
        }
        else
        // jq提交表单
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
            var tmp = $(this).children().eq(5);
            var btn = tmp.children();
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
                $("input[name=parkid]").attr("readonly","readonly");
            });
        });
    });

</script>
</body>
</html>