<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" import="java.util.*" pageEncoding="utf-8" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%--//时间格式化引用--%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>房产管理</title>

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
							<li style="padding-left: 1em"><a href="${pageContext.request.contextPath}/admin/default.do">房产管理</a></li>
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
                            <a class="active-menu" href="#"><span class="glyphicon glyphicon-th-list" aria-hidden="true"></span>  房产管理</a>
                        </li>
                        <li>
							<a href="${pageContext.request.contextPath}/admin/default.do"><span class="glyphicon glyphicon-signal" aria-hidden="true"> </span>房产信息</a>
                            
                        </li>
                        <li>
							<a href="${pageContext.request.contextPath}/admin/queryBuildingdefault.do"><span class="glyphicon glyphicon-option-horizontal" aria-hidden="true"> </span>楼宇管理</a>
                            
                        </li>
                        <li>
							<a href="#"><span class="glyphicon glyphicon-duplicate" aria-hidden="true"> </span>业务管理 <span class="glyphicon glyphicon-chevron-down" aria-hidden="true" id="down"></span></a>
                            <ul class="nav nav-second-level">
                                <li>
									<a href="${pageContext.request.contextPath}/admin/queryResidentdefault.do"><span class="glyphicon glyphicon-home" aria-hidden="true"> </span>住户信息</a>
                                </li>
                                <li>
									<a href="${pageContext.request.contextPath}/admin/queryHousTrandefault.do"><span class="glyphicon glyphicon-send" aria-hidden="true"> </span>房屋交接信息</a>
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
							<h2>住户信息</h2>
						</div>
	   				</div>
					<!--搜索框和添加按钮-->
	   				<div class="row col-md-offset-6" style="position: relative;right: -25px;">
	   				<div class="col-md-7">
						<form role="form" action="${pageContext.request.contextPath}/admin/queryCondi.do" method="post" style="margin-bottom: 20px;"
							  id="resident">
						  <div class="input-group" >
						    <div class="input-group-btn">
                                <select class="form-control" style="width: auto" name="condition">
                                    <option value="5">
                                        <button>住户编号</button>
                                    </option>
                                    <option value="6">
                                        <button>房产号</button>
                                    </option>
                                    <option value="7">
                                        <button>户主姓名</button>
                                    </option>
                                    <option value="8">
                                        <button>户主身份证</button>
                                    </option>
                                    <option value="9">
                                        <button>家庭常住人口</button>
                                    </option>
                                </select>
							</div>
                              <input type="text" class="form-control" name="condiValue">
						  </div>
						</form>
					</div>
				     <div class="col-md-5">
						<button class="btn btn-info btn-search" type="submit" form="resident" value="Submit">
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
													住户信息
												</h4>
											</div>
											<div class="modal-body">
												<form class="form-horizontal" role="form" action="${pageContext.request.contextPath}/admin/insertResident.do"
                                                      method="post" id="addResident">
														<%--<div class="form-group">
															<label class="col-sm-3 control-label">住户编号</label>
																<div class="col-sm-8">
																	<input type="text" class="form-control" id="insert_resiid"  placeholder="请输入住户编号" name="">
																</div>
														</div>--%>
														<div class="form-group">
															<label class="col-sm-3 control-label">房产号</label>
																<div class="col-sm-8">
																	<input type="text" class="form-control" id="insert_hp_id" placeholder="请输入房产号" name="hp_id">
																</div>
														</div>
														
														<div class="form-group">
																<label class="col-sm-3 control-label">户主名字</label>
																<div class="col-sm-8">
																	<input type="text" class="form-control" id="insert_resiName" placeholder="请输入户主名字" name="resiName">
																</div>
														</div>
														<div class="form-group">
																<label class="col-sm-3 control-label">户主身份证</label>
																<div class="col-sm-8">
																	<input type="text" class="form-control" id="insert_resilden" placeholder="请输入户主身份证" name="resiIden">
																</div>
														</div>
														<div class="form-group">
																<label class="col-sm-3 control-label">家庭常住人口</label>
																<div class="col-sm-8">
																	<input type="text" class="form-control" id="insert_resiTota" placeholder="请输入家庭常住人口" name="resiTota">
																</div>
														</div>
												</form>		
											</div>
											<div class="modal-footer">
												<button type="button" class="btn btn-default" data-dismiss="modal">关闭
												</button>
												<button type="submit" class="btn btn-primary" form="addResident" value="Submit" onclick="return panduan1()">
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
                                    <th class="col-md-2">住户编号</th>
                                    <th class="col-md-2">房产号</th>
                                    <th class="col-md-2">户主名字</th>
                                    <th class="col-md-2">户主身份证</th>
                                    <th class="col-md-2">家庭常住人口</th>
                                    <th class="col-md-1">修改</th>
									<th class="col-md-1">删除</th>
								</tr>
                                <c:forEach items="${pageInfo.list}" var="resident">
                                    <tr class="mylist">
                                        <td id="resiid">${resident.resid}</td>
                                        <td id="hp_id">${resident.hp_id}</td>
                                        <td id="resiName">${resident.resiName}</td>
                                        <td id="resilden">${resident.resiIden}</td>
                                        <td id="resiTota">${resident.resiTota}</td>
                                        <td>
                                            <!--按钮触发模态框-->
                                            <button type="button" class="btn btn-primary  btn-sm" data-toggle="modal" data-target="#myModal">
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
							</table>
							<!--模态框-->
							<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
								<div class="modal-dialog">
									<div class="modal-content">
										<div class="modal-header">
											<button type="button" class="close" data-dismiss="modal" aria-hidden="true">
												&times;
											</button>
											<h4 class="modal-title" id="myModalLabel">
												住户信息
											</h4>
										</div>
										<div class="modal-body">
											<form class="form-horizontal" role="form" id="edit" action="${pageContext.request.contextPath}/admin/updateResident.do" method="post">
												<div class="form-group">
													<label class="col-sm-3 control-label">住户编号</label>
													<div class="col-sm-8">
														<input type="text" class="form-control" id="update_resiid" name="resid">
													</div>
												</div>
												<div class="form-group">
													<label class="col-sm-3 control-label">房产号</label>
													<div class="col-sm-8">
														<input type="text" class="form-control" id="update_hp_id" name="hp_id">
													</div>
												</div>

												<div class="form-group">
													<label class="col-sm-3 control-label">户主名字</label>
													<div class="col-sm-8">
														<input type="text" class="form-control" id="update_resiName" name="resiName">
													</div>
												</div>
												<div class="form-group">
													<label class="col-sm-3 control-label">户主身份证</label>
													<div class="col-sm-8">
														<input type="text" class="form-control" id="update_resilden" name="resiIden">
													</div>
												</div>
												<div class="form-group">
													<label class="col-sm-3 control-label">家庭常住人口</label>
													<div class="col-sm-8">
														<input type="text" class="form-control" id="update_resiTota" name="resiTota">
													</div>
												</div>
											</form>
										</div>
										<div class="modal-footer">
											<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
											<button type="submit" class="btn btn-primary" form="edit"
                                                    value="Submit" onclick="return panduan2()">提交更改</button>
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
                                    <li><a href="${pageContext.request.contextPath}/admin/queryResident.do?pn=1">首页</a></li>
									<li>
                                        <c:if test="${pageInfo.hasPreviousPage}">
                                            <a href="${pageContext.request.contextPath}/admin/queryResident.do?pn=${pageInfo.pageNum-1}"
                                               aria-label="Previous">
                                                <span aria-hidden="true">&laquo;</span>
                                            </a>
                                        </c:if>
									</li>
                                    <c:forEach items="${pageInfo.navigatepageNums}" var="page_num">
                                        <c:if test="${page_num==pageInfo.pageNum}">
                                            <li class="active"><a
                                                    href="${pageContext.request.contextPath}/admin/queryResident.do?pn=${page_num}">${page_num}</a>
                                            </li>
                                        </c:if>
                                        <c:if test="${page_num!=pageInfo.pageNum}">
                                            <li>
                                                <a href="${pageContext.request.contextPath}/admin/queryResident.do?pn=${page_num}">${page_num}</a>
                                            </li>
                                        </c:if>
                                    </c:forEach>
									<li>
                                        <c:if test="${pageInfo.hasNextPage}">
                                            <a href="${pageContext.request.contextPath}/admin/queryResident.do?pn=${pageInfo.pageNum+1}"
                                               aria-label="Next">
                                                <span aria-hidden="true">&raquo;</span>
                                            </a>
                                        </c:if>
									</li>
                                    <li><a href="${pageContext.request.contextPath}/admin/queryResident.do?pn=${pageInfo.pages}">末页</a>
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
        function panduan1(){
			/*if($("#insert_resiid").val().length==0){
				alert("不能为空啊！");
				return false;
			}*/
			if($("#insert_hp_id").val().length==0){
				alert("不能为空啊！");
                return false;
			}
			else if($("#insert_resiName").val().length==0){
				alert("不能为空啊！");
                return false;
			}
			else if($("#insert_resilden").val().length==0){
				alert("不能为空啊！");
                return false;
			}
			else if($("#insert_resiTota").val().length==0){
				alert("不能为空啊！");
                return false;
			}
			else
			// jq提交表单
				return true;
		}
        function panduan2(){
            if($("#update_resiid").val().length==0){
                alert("不能为空啊！");
                return false;
            }
            else if($("#update_hp_id").val().length==0){
                alert("不能为空啊！");
                return false;
            }
            else if($("#update_resiName").val().length==0){
                alert("不能为空啊！");
                return false;
            }
            else if($("#update_resilden").val().length==0){
                alert("不能为空啊！");
                return false;
            }
            else if($("#update_resiTota").val().length==0){
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
            function logout() {
                if (confirm("您确定要退出本系统吗？")) {
                    window.location.href = "/admin/adminLogout.do";
                }
            }
			$(function() {
                $(".mylist").each(function(){
                    var tmp=$(this).children().eq(5);
                    var btn=tmp.children();
                    var tmp1=$(this).children().eq(6);
                    var btn1=tmp1.children();
                    btn.bind("click",function(){
                    //add为表单form的id
                        var td_lenght=$("#edit input").length;
                        var a=new Array();
                        for(var i=0;i< td_lenght;i++){
                            a[i]=btn.parent().parent().children("td").get(i).innerHTML;
                        }
                        for (var j = 0; j < td_lenght; j++) {
                            $('#edit input').eq(j).val(a[j]);
                        }
                    });
                    btn1.bind("click",function(){
                        var id=btn1.parent().parent().children("td").get(0).innerHTML;
                        // alert(id);
                        useAjax(id);
                    });

                });
                $("#update_resiid").attr("readonly", "readonly");
            });
        function useAjax(id) {
            $.ajax({
                url: "${pageContext.request.contextPath}/admin/deleteResident.do",
                // type: 'post',
                // dataType: 'json',
                data: {id: id},
                success: return_data
            });

            function return_data(data) {
                // if (data="1")
                alert(data);
                // else
                //     alert("插入失败！")
                // window.location.reload();
                // window.location.href ="/selectallspotmana.do";
                window.location.replace("${pageContext.request.contextPath}/admin/queryResidentdefault.do");
            }
        }
		</script>
</body>
</html>