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
                            <a href="${pageContext.request.contextPath}/admin/default.do"><span class="glyphicon glyphicon-signal" aria-hidden="true"></span> 房产信息</a>
                            
                        </li>
                        <li>
                            <a href="${pageContext.request.contextPath}/admin/queryBuildingdefault.do"><span class="glyphicon glyphicon-option-horizontal" aria-hidden="true"></span> 楼宇管理</a>
                            
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
							<h2>房屋交接信息</h2>
						</div>
	   				</div>
					<!--搜索框和添加按钮-->
	   				<div class="row col-md-offset-7" >
	   				<div class="col-md-7">
						<form role="form" action="${pageContext.request.contextPath}/admin/queryCondi.do" style="margin-bottom: 20px;" method="post"
							  id="housTran">
						  <div class="input-group" >
						    <div class="input-group-btn">
								<select class="form-control" style="width: auto" name="condition">
									<option value="A">
										<button>交接编号</button>
									</option>
									<option value="B">
										<button>房产号</button>
									</option>
								</select>
							</div>
							  <input type="text" class="form-control" name="condiValue">
						  </div>
						</form>
					</div>
	   				<div class="col-md-5">
								<button class="btn btn-info btn-search" type="submit" form="housTran" value="Submit">
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
													房屋交接信息
												</h4>
											</div>
											<div class="modal-body">
												<form class="form-horizontal" role="form" action="${pageContext.request.contextPath}/admin/insertHousTran.do" method="post" id="addHousTran">
														<%--<div class="form-group">
															<label class="col-sm-3 control-label">交接编号</label>
																<div class="col-sm-9">
																	<input type="text" class="form-control" id="insert_htid" placeholder="请输入交接编号" name="">
																</div>
														</div>--%>
														<div class="form-group">
															<label class="col-sm-3 control-label">房产号</label>
																<div class="col-sm-9">
																	<input type="text" class="form-control" id="insert_hpid" placeholder="请输入房产号" name="hp_id">
																</div>
														</div>
														
														<div class="form-group">
																<label class="col-sm-3 control-label">买家姓名</label>
																<div class="col-sm-9">
																	<input type="text" class="form-control" id="insert_buyName" placeholder="请输入买家姓名" name="buyName">
																</div>
														</div>
														<div class="form-group">
																<label class="col-sm-3 control-label">买家身份证</label>
																<div class="col-sm-9">
																	<input type="text" class="form-control" id="insert_buyIden" placeholder="请输入买家身份证" name="buyIden">
																</div>
														</div>
														<div class="form-group">
																<label class="col-sm-3 control-label">卖家姓名</label>
																<div class="col-sm-9">
																	<input type="text" class="form-control" id="insert_sellName" placeholder="请输入卖家姓名" name="sellName">
																</div>
														</div>
														<div class="form-group">
																<label class="col-sm-3 control-label">卖家身份证</label>
																<div class="col-sm-9">
																	<input type="text" class="form-control" id="insert_sellIden" placeholder="请输入卖家身份证" name="sellIden">
																</div>
														</div>
														<div class="form-group">
																<label class="col-sm-3 control-label">交接日期</label>
																<div class="col-sm-9">
																	<input type="date" class="form-control" id="insert_tranDate" placeholder="请输入交接日期" name="tranDate">
																</div>
														</div>
												</form>		
											</div>
											<div class="modal-footer">
												<button type="button" class="btn btn-default" data-dismiss="modal">关闭
												</button>
												<button type="submit" class="btn btn-primary" form="addHousTran" value="Submit" onclick="return panduan1()">
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
                                    <th class="col-md-1">交接编号</th>
                                    <th class="col-md-1">房产号</th>
                                    <th class="col-md-1">买家姓名</th>
                                    <th class="col-md-2">买家身份证</th>
                                    <th class="col-md-1">卖家姓名</th>
                                    <th class="col-md-2">卖家身份证</th>
                                    <th class="col-md-2">交接日期</th>
                                    <th class="col-md-1">修改</th>
									<th class="col-md-1">删除</th>
								</tr>
								<c:forEach items="${pageInfo.list}" var="housTran">
									<tr class="mylist">
										<td id="htid">${housTran.htid}</td>
										<td id="hp_id">${housTran.hp_id}</td>
										<td id="buyName">${housTran.buyName}</td>
										<td id="buyIden">${housTran.buyIden}</td>
										<td id="sellName">${housTran.sellName}</td>
										<td id="sellIden">${housTran.sellIden}</td>
										<td id="tranDate"><fmt:formatDate value="${housTran.tranDate}"
																		  pattern="yyyy-MM-dd"/></td>
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
												房屋交接信息
											</h4>
										</div>
										<div class="modal-body">
                                            <form class="form-horizontal" role="form"
                                                  action="${pageContext.request.contextPath}/admin/updateHousTran.do" method="post" id="edit">
												<div class="form-group">
													<label class="col-sm-3 control-label">交接编号</label>
													<div class="col-sm-9">
														<input type="text" class="form-control" id="update_htid" name="htid">
													</div>
												</div>
												<div class="form-group">
													<label class="col-sm-3 control-label">房产号</label>
													<div class="col-sm-9">
														<input type="text" class="form-control" id="update_hpid" name="hp_id">
													</div>
												</div>

												<div class="form-group">
													<label class="col-sm-3 control-label">买家姓名</label>
													<div class="col-sm-9">
														<input type="text" class="form-control" id="update_buyName" name="buyName">
													</div>
												</div>
												<div class="form-group">
													<label class="col-sm-3 control-label">买家身份证</label>
													<div class="col-sm-9">
														<input type="text" class="form-control" id="update_buyIden" name="buyIden">
													</div>
												</div>
												<div class="form-group">
													<label class="col-sm-3 control-label">卖家姓名</label>
													<div class="col-sm-9">
														<input type="text" class="form-control" id="update_sellName" name="sellName">
													</div>
												</div>
												<div class="form-group">
													<label class="col-sm-3 control-label">卖家身份证</label>
													<div class="col-sm-9">
														<input type="text" class="form-control" id="update_sellIden" name="sellIden">
													</div>
												</div>
												<div class="form-group">
													<label class="col-sm-3 control-label">交接日期</label>
													<div class="col-sm-9">
														<input type="date" class="form-control" id="update_tranDate" name="tranDate">
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
                                    <li><a href="${pageContext.request.contextPath}/admin/queryHousTran.do?pn=1">首页</a></li>
									<li>
                                        <c:if test="${pageInfo.hasPreviousPage}">
                                            <a href="${pageContext.request.contextPath}/admin/queryHousTran.do?pn=${pageInfo.pageNum-1}"
                                               aria-label="Previous">
                                                <span aria-hidden="true">&laquo;</span>
                                            </a>
                                        </c:if>
									</li>
                                    <c:forEach items="${pageInfo.navigatepageNums}" var="page_num">
                                        <c:if test="${page_num==pageInfo.pageNum}">
                                            <li class="active"><a
                                                    href="${pageContext.request.contextPath}/admin/queryHousTran.do?pn=${page_num}">${page_num}</a>
                                            </li>
                                        </c:if>
                                        <c:if test="${page_num!=pageInfo.pageNum}">
                                            <li>
                                                <a href="${pageContext.request.contextPath}/admin/queryHousTran.do?pn=${page_num}">${page_num}</a>
                                            </li>
                                        </c:if>
                                    </c:forEach>
									<li>
                                        <c:if test="${pageInfo.hasNextPage}">
                                            <a href="${pageContext.request.contextPath}/admin/queryHousTran.do?pn=${pageInfo.pageNum+1}"
                                               aria-label="Next">
                                                <span aria-hidden="true">&raquo;</span>
                                            </a>
                                        </c:if>
									</li>
                                    <li><a href="${pageContext.request.contextPath}/admin/queryHousTran.do?pn=${pageInfo.pages}">末页</a>
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
			/*if($("#insert_htid").val().length==0){
				alert("不能为空啊！");
				return false;
			}*/
			if($("#insert_hpid").val().length==0){
				alert("不能为空啊！");
                return false;
			}
			else if($("#insert_buyName").val().length==0){
				alert("不能为空啊！");
                return false;
			}
			else if($("#insert_buyIden").val().length==0){
				alert("不能为空啊！");
                return false;
			}
			else if($("#insert_sellName").val().length==0){
				alert("不能为空啊！");
                return false;
			}
			else if($("#insert_sellIden").val().length==0){
				alert("不能为空啊！");
                return false;
			}
			else if($("#insert_tranDate").val().length==0){
				alert("不能为空啊！");
                return false;
			}
			else
			// jq提交表单
				return true;
		}
        function panduan2(){
            if($("#update_htid").val().length==0){
                alert("不能为空啊！");
                return false;
            }
            else if($("#update_hpid").val().length==0){
                alert("不能为空啊！");
                return false;
            }
            else if($("#update_buyName").val().length==0){
                alert("不能为空啊！");
                return false;
            }
            else if($("#update_buyIden").val().length==0){
                alert("不能为空啊！");
                return false;
            }
            else if($("#update_sellName").val().length==0){
                alert("不能为空啊！");
                return false;
            }
            else if($("#update_sellIden").val().length==0){
                alert("不能为空啊！");
                return false;
            }
            else if($("#update_tranDate").val().length==0){
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
                    var tmp=$(this).children().eq(7);
                    var btn=tmp.children();
                    var tmp1=$(this).children().eq(8);
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
                $("#update_htid").attr("readonly", "readonly");
            });
        });
        function useAjax(id) {
            $.ajax({
                url: "${pageContext.request.contextPath}/admin/deleteHousTran.do",
                // type: 'post',
                // dataType: 'json',
                data: {htid: id},
                success: return_data
            });

            function return_data(data) {
                // if (data="1")
                alert(data);
                // else
                //     alert("插入失败！")
                // window.location.reload();
                // window.location.href ="/selectallspotmana.do";
                window.location.replace("${pageContext.request.contextPath}/admin/queryHousTrandefault.do");
            }
        }
	</script>
</body>
</html>