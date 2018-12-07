<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" import="java.util.*" pageEncoding="utf-8" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%--//时间格式化引用--%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>保洁管理</title>

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
							<li style="padding-left: 1em"><a href="houseProp_1.jsp">房产管理</a></li>
							<li><a href="charge_1.jsp">收费管理</a></li>
							<li><a href="official_1.jsp">办公管理</a></li>
							<li><a href="park_1.jsp">停车管理</a></li>
							<li><a href="service_1.jsp">产权人服务</a></li>
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
                            <a class="active-menu" href="#"><span class="glyphicon glyphicon-trash" aria-hidden="true"></span>  保洁管理</a>
                        </li>
                        <li>
							<a href="clean_1.jsp"><span class="glyphicon glyphicon-calendar" aria-hidden="true"> </span>日常保洁</a>
                            
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
							<h2>日常保洁信息</h2>
						</div>
	   				</div>
					<!--搜索框和添加按钮-->
	   				<div class="row col-md-offset-7" >
	   				<div class="col-md-7">
						<form role="form" action="#" style="margin-bottom: 20px;">						
						  <div class="input-group" >
						    <div class="input-group-btn">
								<select class="form-control" style="width: auto">
									<option><button>表号</button></option>
									<option><button>消杀日期</button></option>
									<option><button>消杀场所</button></option>
									<option><button>保洁用品</button></option>
									<option><button>保洁工具</button></option>
									<option><button>工作人</button></option>
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
													日常保洁信息管理
												</h4>
											</div>
											<div class="modal-body">
												<form class="form-horizontal" role="form" action="#" name="form1">
														<div class="form-group">
															<label class="col-sm-3 control-label">表号</label>
																<div class="col-sm-9">
																	<input type="text" class="form-control" id="insert_dcid" placeholder="请输入表号" name="">
																</div>
														</div>
														<div class="form-group">
															<label class="col-sm-3 control-label">消杀日期</label>
																<div class="col-sm-9">
																	<input type="text" class="form-control" id="insert_sterDate" placeholder="请输入消杀日期" name="">
																</div>
														</div>
														
														<div class="form-group">
																<label class="col-sm-3 control-label">消杀场所</label>
																<div class="col-sm-9">
																	<input type="text" class="form-control" id="insert_sterPlac" placeholder="请输入消杀场所" name="">
																</div>
														</div>
														<div class="form-group">
																<label class="col-sm-3 control-label">保洁用品</label>
																<div class="col-sm-9">
																	<input type="text" class="form-control" id="insert_cleaProd" placeholder="请输入保洁用品" name="">
																</div>
														</div>
														<div class="form-group">
																<label class="col-sm-3 control-label">保洁工具</label>
																<div class="col-sm-9">
																	<input type="text" class="form-control" id="insert_tool" placeholder="请输入保洁工具" name="">
																</div>
														</div>
														<div class="form-group">
																<label class="col-sm-3 control-label">工作人</label>
																<div class="col-sm-9">
																	<input type="text" class="form-control" id="insert_staf_id" placeholder="请输入工作人" name="">
																</div>
														</div>
												</form>		
											</div>
											<div class="modal-footer">
												<button type="button" class="btn btn-default" data-dismiss="modal">关闭
												</button>
												<button type="submit" class="btn btn-primary" onclick="return panduan1()">
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
									<th class="col-md-1">表号</th>
									<th class="col-md-2">消杀日期</th>
									<th class="col-md-2">消杀场所</th>
									<th class="col-md-2">保洁用品</th>
									<th class="col-md-2">保洁工具</th>
									<th class="col-md-1">工作人</th>
									<th class="col-md-1">修改</th>
									<th class="col-md-1">删除</th>
								</tr>

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
												日常保洁管理信息
											</h4>
										</div>
										<div class="modal-body">
											<form class="form-horizontal" role="form" id="edit" action="">
												<div class="form-group">
													<label class="col-sm-3 control-label">表号</label>
													<div class="col-sm-9">
														<input type="text" class="form-control" id="update_dcid" name="">
													</div>
												</div>
												<div class="form-group">
													<label class="col-sm-3 control-label">消杀日期</label>
													<div class="col-sm-9">
														<input type="text" class="form-control" id="update_sterDate" name="">
													</div>
												</div>

												<div class="form-group">
													<label class="col-sm-3 control-label">消杀场所</label>
													<div class="col-sm-9">
														<input type="text" class="form-control" id="update_sterPlac" name="">
													</div>
												</div>
												<div class="form-group">
													<label class="col-sm-3 control-label">保洁用品</label>
													<div class="col-sm-9">
														<input type="text" class="form-control" id="update_cleaProd" name="">
													</div>
												</div>
												<div class="form-group">
													<label class="col-sm-3 control-label">保洁工具</label>
													<div class="col-sm-9">
														<input type="text" class="form-control" id="update_tool" name="">
													</div>
												</div>
												<div class="form-group">
													<label class="col-sm-3 control-label">工作人</label>
													<div class="col-sm-9">
														<input type="text" class="form-control" id="update_staf_id" name="">
													</div>
												</div>
											</form>
										</div>
										<div class="modal-footer">
											<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
											<button type="submit" class="btn btn-primary" onclick="return panduan2()">提交更改</button>
										</div>
									</div><!-- /.modal-content -->
								</div><!-- /.modal -->
							</div>
						</div>
					</div>
		         	<!--分页信息-->
					<div class="row">         
						<div class="col-md-7">
							当前为第页，总共有页，共有条记录
						</div>   
						<div class="col-md-5">
							<nav aria-label="Page navigation">
								<ul class="pagination">
									<li><a href="#">首页</a></li>
									<li>                      

									</li>
									<li><a href="#">末页</a></li>
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
        function panduan1(){
            if($("#insert_dcid").val().length==0||$("#update_dcid").val().length==0){
                alert("不能为空啊！");
                return false;
            }
            else if($("#insert_sterDate").val().length==0||$("#update_sterDate").val().length==0){
                alert("不能为空啊！");
                return false;
            }
            else if($("#insert_sterPlac").val().length==0||$("#update_sterPlac").val().length==0){
                alert("不能为空啊！");
                return false;
            }
            else if($("#insert_cleaProd").val().length==0||$("#update_cleaProd").val().length==0){
                alert("不能为空啊！");
                return false;
            }
            else if($("#insert_tool").val().length==0||$("#update_tool").val().length==0){
                alert("不能为空啊！");
                return false;
            }
            else if($("#insert_staf_id").val().length==0||$("#update_staf_id").val().length==0){
                alert("不能为空啊！");
                return false;
            }
            else
            // jq提交表单
				return true;
        }
        function panduan2(){
            if($("#update_dcid").val().length==0){
                alert("不能为空啊！");
                return false;
            }
            else if($("#update_sterDate").val().length==0){
                alert("不能为空啊！");
                return false;
            }
            else if($("#update_sterPlac").val().length==0){
                alert("不能为空啊！");
                return false;
            }
            else if($("#update_cleaProd").val().length==0){
                alert("不能为空啊！");
                return false;
            }
            else if($("#update_tool").val().length==0){
                alert("不能为空啊！");
                return false;
            }
            else if($("#update_staf_id").val().length==0){
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
					window.location.href = "adminLogin.jsp";
				}
			}
			$(function() {
            $(".mylist").each(function(){
                var tmp=$(this).children().eq(6);
                var btn=tmp.children();
                var tmp1=$(this).children().eq(7);
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
        });
	</script>
</body>
</html>