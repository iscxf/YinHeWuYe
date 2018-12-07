<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" import="java.util.*" pageEncoding="utf-8" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%--//时间格式化引用--%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>安保管理</title>

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
                            <a class="active-menu" href="#"><span class="glyphicon glyphicon-lock" aria-hidden="true"></span>  安保管理</a>
                        </li>
                        <li>
                            <a href="security_1.jsp"><span class="glyphicon glyphicon-tasks" aria-hidden="true"> </span>  保安信息</a>
                            
                        </li>
                        <li>
                            <a href="security_2.jsp"><span class="glyphicon glyphicon-unchecked" aria-hidden="true"></span>   日常安保</a>
                            
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
                                <h2>日常安保</h2>
                            </div>
                        </div>
                        <!--搜索框和添加按钮-->
                        <div class="row col-md-offset-6" style="position: relative;right: -25px;">
	   				     <div class="col-md-7">
						   <form role="form" action="#" style="margin-bottom: 20px;">						
						     <div class="input-group" >
						       <div class="input-group-btn">
								 <select class="form-control" style="width: auto">
                                            <option><button>id</button></option>
                                            <%--<option><button>员工名</button></option>--%>
                                            <%--<option><button>用品发放日期</button></option>--%>
                                            <%--<option><button>用品详情</button></option>--%>
                                            <%--<option><button>治安维护</button></option>--%>
                                 </select>
							   </div>
							  <input type="text" class="form-control">
						    </div>
						  </form>
					     </div>			
                        <div class="col-md-5">
                                <button class="btn btn-info btn-search" >
                                    <span class="glyphicon glyphicon-search" aria-hidden="true"></span>查找
                                </button>
                                <button class="btn btn-success " data-toggle="modal" data-target="#myModal1">
                                    <span class="glyphicon glyphicon-plus" aria-hidden="true"></span>添加
                                </button>
                                    <!--添加按钮触发模态框-->
                                <div class="modal fade" id="myModal1" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                                    <div class="modal-dialog">
                                        <div class="modal-content">
                                            <div class="modal-header">
                                                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                                                    &times;
                                                </button>
                                                <h4 class="modal-title" id="myModalLabel1">
                                                    日常安保
                                                </h4>
                                            </div>
                                            <div class="modal-body">
                                                <form class="form-horizontal" id="add" role="form" method="post" action="adddail.do" name="form1">

                                                    <div class="form-group">
                                                        <label class="col-sm-3 control-label">员工名</label>
                                                            <div class="col-sm-9">
                                                                <input type="text" class="form-control" id="insert_staf_id" placeholder="请输入员工名" name="stafName">
                                                            </div>
                                                    </div>
                                                    
                                                    <div class="form-group">
                                                            <label class="col-sm-3 control-label">用品发放日期</label>
                                                            <div class="col-sm-9">
                                                                <input type="date" class="form-control" id="insert_toolDate" placeholder="用品发放日期" name="tooldate">
                                                            </div>
                                                    </div>
                                                    <div class="form-group">
                                                            <label class="col-sm-3 control-label">用品详细</label>
                                                            <div class="col-sm-9">
                                                                <input type="text" class="form-control" id="insert_toolData" placeholder="用品详细" name="tooldeta">
                                                            </div>
                                                    </div>
                                                    <div class="form-group">
                                                            <label class="col-sm-3 control-label">治安维护</label>
                                                            <div class="col-sm-9">
                                                                <input type="text" class="form-control" id="insert_secuDeta" placeholder="治安维护" name="secudeta">
                                                            </div>
                                                    </div>
                                                </form>		
                                            </div>
                                            <div class="modal-footer">
                                                <button type="button" class="btn btn-default" data-dismiss="modal">关闭
                                                </button>
                                                <button type="submit" form="add" class="btn btn-primary" onclick="panduan1()">
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
                                        <th class="col-md-2">ID</th>
                                        <th class="col-md-2">员工名</th>
                                        <th class="col-md-2">用品发放日期</th>
                                        <th class="col-md-2">用品详细</th>
                                        <th class="col-md-2">治安维护</th>
									    <th class="col-md-1">删除</th>
                                    </tr>
                                    <c:forEach items="${pageInfo.list }" var="dalisecu">
                                    <tr class="mylist">
                                        <td>${dalisecu.id}</td>
                                        <td>${dalisecu.staff.stafName}</td>
                                        <td><fmt:formatDate value="${dalisecu.tooldate}"
                                                                          pattern="yyyy-MM-dd"/></td>
                                        <%--<td>${dalisecu.tooldate}</td>--%>
                                        <td>${dalisecu.tooldeta}</td>
                                        <td>${dalisecu.secudeta}</td>

                                        <td>					
                                            <button type="button" class="btn btn-danger  btn-sm">
                                                <span class="glyphicon glyphicon-trash" aria-hidden="true"></span>
                                                删除
                                            </button>
                                        </td>
                                    </tr>
                                    </c:forEach>
                                </table>
                            </div>
                        </div>
                        <!--分页信息-->
                        <div class="row">
                            <!-- 分页文字信息 -->
                            <div class="col-md-6">当前${pageInfo.pageNum }页,总${pageInfo.pages }页,总${pageInfo.total }条记录</div>
                            <!-- 分页条信息 -->
                            <div class="col-md-6">
                                <nav aria-label="Page navigation">
                                    <ul class="pagination">
                                        <li><a href="${pageContext.request.contextPath}/admin/staff.do?pn=1 ">首页</a></li>

                                        <c:if test="${pageInfo.hasPreviousPage }">
                                            <li><a href="${pageContext.request.contextPath}/admin/staff.do?pn=${pageInfo.pageNum-1 }"
                                                   aria-label="Previous"> <span aria-hidden="true">&laquo;</span>
                                            </a></li>
                                        </c:if>
                                        <c:forEach items="${pageInfo.navigatepageNums }" var="page_Num">
                                            <c:if test="${page_Num == pageInfo.pageNum }">
                                                <li class="active"><a  href="${pageContext.request.contextPath}/admin/staff.do?pn=${page_num}">${page_num}</a></li>
                                            </c:if>
                                            <c:if test="${page_Num != pageInfo.pageNum }">
                                                <li><a href="${pageContext.request.contextPath}/admin/staff.do?pn=${page_Num }">${page_Num }</a></li>
                                            </c:if>
                                        </c:forEach>
                                        <c:if test="${pageInfo.hasNextPage }">
                                            <li><a href="${pageContext.request.contextPath}/admin/staff.do?pn=${pageInfo.pageNum+1 }" aria-label="Next"> <span
                                                    aria-hidden="true">&raquo;</span>
                                            </a></li>
                                        </c:if>

                                        <li><a href="${pageContext.request.contextPath}/admin/staff.do?pn=${pageInfo.pages }">末页</a></li>
                                    </ul>
                                </nav>

                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <script>
            function panduan1(){
                if($("#insert_staf_id").val().length==0){
                    alert("不能为空啊！");
                    return false;
                }
                else if($("#insert_toolDate").val().length==0){
                    alert("不能为空啊！");
                    return false;
                }
                else if($("#insert_toolDeta").val().length==0){
                    alert("不能为空啊！");
                    return false;
                }
                else if($("#insert_secuDeta").val().length==0){
                    alert("不能为空啊！");
                    return false;
                }
                else
// jq提交表单
                    return true;
            }
            //全部不能为空
            //使用时onclick="return myCheck()"
            function myCheck()
            {
                for(var i=0;i<=document.form1.elements.length-1;i++)
                {
                    if(document.form1.elements[i].value=="")
                    {
                        alert("当前表单不能有空项");
                        document.form1.elements[i].focus();
                        return false;
                    }
                }
                return true;
            }
                /**退出系统**/
                function logout(){
                    if(confirm("您确定要退出本系统吗？")){
                        window.location.href = "/admin/adminLogout.do";
                    }
                }
                $(function() {
                    $(".mylist").each(function(){
                        var tmp1=$(this).children().eq(5);
                        var btn1=tmp1.children();
                        btn1.bind("click",function(){
                            var id=btn1.parent().parent().children("td").get(0).innerHTML;
                            // alert(id);
                            useAjax(id);
                        });

                    });
                });
            </script>
</body>
</html>