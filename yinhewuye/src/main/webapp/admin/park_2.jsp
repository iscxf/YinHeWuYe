<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" import="java.util.*" pageEncoding="utf-8" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%--//时间格式化引用--%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>停车管理</title>

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
                            <a class="active-menu" href="#"><span class="glyphicon glyphicon-map-marker" aria-hidden="true"></span>  停车管理</a>
                        </li>
                        <li>
                            <a href="selectallpark.do"><span class="glyphicon glyphicon-road" aria-hidden="true"></span> 停车场信息</a>

                        </li>
                        <li>
                            <a href="selectallspotmana.do"><span class="glyphicon glyphicon-bullhorn" aria-hidden="true"></span> 停车位信息</a>

                        </li>
                        <li>
                            <a href="selectallhistory.do"><span class="glyphicon glyphicon-duplicate" aria-hidden="true"></span> 历史记录信息</a>
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
							<h2>停车位信息</h2>
						</div>
	   				</div>
					<!--搜索框和添加按钮-->
	   				 <div class="row col-md-offset-7" >
	   				     <div class="col-md-7">
						   <form role="form" id="selecttype" action="doparkselect.do" method="post" style="margin-bottom: 20px;">
						     <div class="input-group" >
						       <div class="input-group-btn">
								 <select class="form-control" name="selecttype" style="width: auto">
									 <option value="3"><button>全部车位</button></option>
									 <option value="4"><button>车位号</button></option>
									 <option value="5"><button>用户id</button></option>
									 <option value="6"><button>已出租</button></option>
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
								    <th>编号</th>
                                    <th>车位号</th>
                                    <th>停车场号</th>
                                    <th>用户id</th>
                                    <th>用户名</th>
                                    <th class="col-md-1">开始时间</th>
                                    <th class="col-md-1">到期时间</th>
                                    <th>应收费用</th>
                                    <th>状态</th>
									<th>修改</th>
									<th>删除</th>
								</tr>
								<c:forEach items="${spotmana.list}" var="spotmana">

									<tr class="mylist">
										<td>${spotmana.id}</td>
										<td>${spotmana.spotid}</td>
										<td>${spotmana.park_id}</td>
										<td>${spotmana.user_id}</td>
										<td>${spotmana.user_name}</td>
										<td><fmt:formatDate value="${spotmana.rentStart}" pattern="yyyy-MM-dd"/></td>
										<td><fmt:formatDate value="${spotmana.rentEnd}" pattern="yyyy-MM-dd"/></td>
										<td>${spotmana.parkFee}</td>
										<td>${spotmana.isRent}</td>
										<td>
											<button class="btn btn-primary btn-sm" data-toggle="modal" data-target="#myModal"  >
												<span class="glyphicon glyphicon-pencil" aria-hidden="true"></span>
												修改
											</button>
										</td>
										<td>
											<button type="button" class="btn btn-danger  btn-sm" id="deletespotmana" >
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
												修改停车位信息
											</h4>
										</div>
										<div class="modal-body">
											<form class="form-horizontal" role="form" action="${pageContext.request.contextPath}/admin/updatespotmanabyid.do" method="post" id="edit">
												<div class="form-group">
													<label class="col-sm-3 control-label">id</label>
													<div class="col-sm-9">
														<input type="text" class="form-control" id="update_id" name="id">
													</div>
												</div>
												<div class="form-group">
													<label class="col-sm-3 control-label">车位号</label>
													<div class="col-sm-9">
														<input type="text" class="form-control" id="update_spotid" name="spotid">
													</div>
												</div>
                                                <div class="form-group">
                                                    <label class="col-sm-3 control-label">停车场号</label>
                                                    <div class="col-sm-9">
                                                        <input type="text" class="form-control" id="update_park_id" name="park_id">
                                                    </div>
                                                </div>
                                                <div class="form-group">
                                                    <label class="col-sm-3 control-label">用户id</label>
                                                    <div class="col-sm-9">
                                                        <input type="text" class="form-control" id="update_user_id" name="user_id">
                                                    </div>
                                                </div>
												<div class="form-group">
													<label class="col-sm-3 control-label">用户名</label>
													<div class="col-sm-9">
														<input type="text" class="form-control" id="update_user_name" name="user_name">
													</div>
												</div>
												<div class="form-group">
													<label class="col-sm-3 control-label">开始时间</label>
													<div class="col-sm-9">
														<input type="date" class="form-control" id="update_rentStart" name="rentStart">
													</div>
												</div>
												<div class="form-group">
													<label class="col-sm-3 control-label">到期时间</label>
													<div class="col-sm-9">
														<input type="date" class="form-control" id="update_rentEnd" name="rentEnd">
													</div>
												</div>
												<div class="form-group">
													<label class="col-sm-3 control-label">应收费用</label>
													<div class="col-sm-9">
														<input type="text" class="form-control" id="update_parkFee" name="parkFee">
													</div>
												</div>
												<div class="form-group">
                                                    <label class="col-sm-3 control-label">状态</label>
                                                    <div class="col-sm-9">
                                                        <label class="radio-inline">
                                                            <input type="radio" name="isRent" id="norent" value="2" checked> 不可出租
                                                        </label>
                                                        <label class="radio-inline">
                                                            <input type="radio" name="isRent" id="isrent"  value="1"> 可出租
                                                        </label>
                                                    </div>

												</div>
											</form>
										</div>
										<div class="modal-footer">
											<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
											<button type="submit" form="edit" class="btn btn-primary" onclick="return panduan2()">提交更改</button>
										</div>
									</div><!-- /.modal-content -->
								</div><!-- /.modal -->
							</div>
						</div>
					</div>
					<!--分页信息-->
					<div class="row">
						<div class="col-md-7">
							当前为第${spotmana.pageNum}页，总共有${spotmana.pages}页，共有${spotmana.total}条记录
						</div>
						<div class="col-md-5">
							<nav aria-label="Page navigation">
								<ul class="pagination">
									<li><a href="${pageContext.request.contextPath}/admin/selectspotmana.do?pn=1">首页</a></li>
									<li>
										<c:if test="${spotmana.hasPreviousPage}">
											<a href="${pageContext.request.contextPath}/admin/selectspotmana.do?pn=${spotmana.pageNum-1}"
											   aria-label="Previous">
												<span aria-hidden="true">&laquo;</span>
											</a>
										</c:if>
									</li>
									<c:forEach items="${spotmana.navigatepageNums}" var="page_num">
										<c:if test="${page_num==spotmana.pageNum}">
											<li class="active"><a
													href="${pageContext.request.contextPath}/admin/selectspotmana.do?pn=${page_num}">${page_num}</a>
											</li>
										</c:if>
										<c:if test="${page_num!=spotmana.pageNum}">
											<li>
												<a href="${pageContext.request.contextPath}/admin/selectspotmana.do?pn=${page_num}">${page_num}</a>
											</li>
										</c:if>
									</c:forEach>

									<li>
										<c:if test="${spotmana.hasNextPage}">
											<a href="${pageContext.request.contextPath}/admin/selectspotmana.do?pn=${spotmana.pageNum+1}"
											   aria-label="Next">
												<span aria-hidden="true">&raquo;</span>
											</a>
										</c:if>
									</li>
									<li><a href="${pageContext.request.contextPath}/admin/selectspotmana.do?pn=${spotmana.pages}">末页</a>
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
    function panduan1(){
        if($("#insert_id").val().length==0){
            alert("不能为空啊！");
            return false;
        }
        else if($("#insert_spotid").val().length==0){
            alert("不能为空啊！");
            return false;
        }
        else if($("#insert_user_name").val().length==0){
            alert("不能为空啊！");
            return false;
        }
        else if($("#insert_rentStart").val().length==0){
            alert("不能为空啊！");
            return false;
        }
        else if($("#insert_rentEnd").val().length==0){
            alert("不能为空啊！");
            return false;
        }
        else if($("#insert_ParkFee").val().length==0){
            alert("不能为空啊！");
            return false;
        }

        else
        // jq提交表单
            return true;
    }
    function panduan2(){
        if($("#update_id").val().length==0){
            alert("不能为空啊！");
            return false;
        }
        else if($("#update_spotid").val().length==0){
            alert("不能为空啊！");
            return false;
        }
        else if($("#update_user_name").val().length==0){
            alert("不能为空啊！");
            return false;
        }
        else if($("#update_rentStart").val().length==0){
            alert("不能为空啊！");
            return false;
        }
        else if($("#update_rentEnd").val().length==0){
            alert("不能为空啊！");
            return false;
        }
        else if($("#update_ParkFee").val().length==0){
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
            var tmp=$(this).children().eq(9);
            var btn=tmp.children();
            var tmp1=$(this).children().eq(10);
            var btn1=tmp1.children();
            btn.bind("click",function(){
            //add为表单form的id
                var td_lenght=$("#edit input").length-1;
                var a=new Array();
                for(var i=0;i< td_lenght;i++){
                    a[i]=btn.parent().parent().children("td").get(i).innerHTML;
                }
                for (var j = 0; j < td_lenght; j++) {
                    $('#edit input').eq(j).val(a[j]);
                }
                $("input[name=id]").attr("readonly","readonly");
            });
            btn1.bind("click",function(){
                var id=btn1.parent().parent().children("td").get(0).innerHTML;
                // alert(id);
                useAjax(id);
            });

        });
    });
    function useAjax(id) {
        $.ajax({
            url: "${pageContext.request.contextPath}/admin/deletespotmanabyid.do",
            // type: 'post',
            // dataType: 'json',
            data: {id:id},
            success:return_data
        });
        function return_data(data){
            alert(data);
            window.location.replace("${pageContext.request.contextPath}/admin/selectallspotmana.do");
        }
    }
</script>
</body>
</html>