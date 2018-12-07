<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" import="java.util.*" pageEncoding="utf-8" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<title>住户建议</title>
	<meta charset="utf-8">
	 <meta name="viewport" content="width=device-width, initial-scale=1.0" />
	 
	<script type="text/javascript" src="js/jquery-3.3.1.min.js"></script>
	<script src="js/wow.js"></script>
	<script src="js/lazyFade.js"></script>
	<script src="js/bootstrap.min.js"></script>
	<link rel="stylesheet" type="text/css" href="../css/animate.css">
	<link rel="stylesheet" type="text/css" href="../css/font-awesome.min.css"/>
	<link rel="stylesheet" type="text/css" href="../css/userBootStyle.css"/>
	<link rel="stylesheet" type="text/css" href="../css/userCssStyle.css"/>
	<link rel="stylesheet" type="text/css" href="../css/basic.css"/>
 
	
    
</head>
<body>

	<div class="container-fulid navTmp" >
		<!--nav-->
		<nav class="navbar navbar-expand-md fixed-top text-light head_nav">
			<div class="col-md-1 col-lg-1"></div>
			<a class="navbar-brand" href="index.jsp">
				<img src="../img/myLogo-white.png" alt="银河物业" title="银河物业" style="width:8em;">
			</a>
			<button class="navbar-toggler navbar-toggler-right" type="button" data-toggle="collapse" data-target="#top_nav" aria-controls="top_nav" aria-expanded="false" aria-label="Toggle navigation text-light" style="color: #FFFFFF">
				<span class="navbar-toggler-icon text-light"></span>
			</button>
			<div class="collapse navbar-collapse" id="top_nav">
				<ul class="navbar-nav">
					<li class="nav-item dropdown " style="padding:1em">
				        <a href="#" class="nav-link"  aria-expanded="false">
				        关于银河物业
				        </a>
				        <div class="dropdown-menu text-left" style="margin-left: 0em; width: 320px; line-height: 40px">
				          <a class="dropdown-item" href="aboutUs.jsp#introduce">公司简介</a>
				          <a class="dropdown-item" href="aboutUs.jsp#culture">企业文化</a>
				          <a class="dropdown-item" href="aboutUs.jsp#history">发展历程</a>
				          <a class="dropdown-item" href="aboutUs.jsp#strategy">公司战略</a>
				        </div>
				    </li>
					<li class="nav-item dropdown " style="padding:1em">
				        <a href="#" class="nav-link"  aria-expanded="false">
				          住户服务申请
				        </a>
				        <div class="dropdown-menu text-left" style="margin-left: 0em; width: 320px; line-height: 40px;">
							<a class="dropdown-item" href="${pageContext.request.contextPath}/index/tousu.do">我要投诉</a>
							<a class="dropdown-item" href="${pageContext.request.contextPath}/index/jianyi.do">我要建议</a>
							<a class="dropdown-item" href="${pageContext.request.contextPath}/index/baoxiu.do">我要报修</a>
				        </div>
				    </li>					
					<li class="nav-item dropdown " style="padding:1em">
				        <a href="#" class="nav-link"  aria-expanded="false">
				          个人信息查询
				        </a>
				        <div class="dropdown-menu text-left" style="margin-left: 0em; width: 320px; line-height: 40px">
							<a class="dropdown-item" href="${pageContext.request.contextPath}/index/queryUserInfo.do">房产信息</a>
							<a class="dropdown-item" href="${pageContext.request.contextPath}/index/selectspotmanabyuser.do">停车信息</a>
							<a class="dropdown-item" href="${pageContext.request.contextPath}/index/queryUserCharge.do">缴费信息</a>
				        </div>
				   </li>
				</ul>					
			</div>
			<div class="col-nd-4 col-lg-4" style="margin-right: -80px;">
				<div class="collapse navbar-collapse">
					<ul class="navbar-nav">
						<li class="nav-item" style="margin-top: -1px;">
							<a href="" class="nav-link" style="font-size:16px">
								<i class="fa fa-user-o"></i>
								您好，
								<span id="usrName">${sessionScope.user.userName}</span>
							</a>
						</li>
						<li class="nav-item">
							<a href="javascript:void(0);" onclick="logout();" target="_parent" class="nav-link" title="退出系统">
								<i class="fa fa-power-off"></i>
								<span style="font-weight:300;font-size: 22px;margin-top: -2px;">
									Exit
								</span>
							</a>
						</li>
					</ul>
				</div>
			</div>
		</nav>
		<!--nav-bottom-->
	</div>
	<!--===============================-->
	<div>
		<!--<div class="page-inner">-->
			<div class="container-fluid"  style="margin-top: -3px;">
				<div class="row">
					<!--pill-->
					<div class="col-sm-3 col-md-3 col-lg-3" id="pill-nav">
				        <div class="nav flex-column nav-pills" id="v-pills-tab" role="tablist" aria-orientation="vertical">
						   <a class="nav-link active" id="v-pills-home-tab" data-toggle="pill" href="index.jsp" role="tab" aria-controls="v-pills-home" aria-selected="true" title="回到首页" style="height: 4em;">
						   		<h1 style="color: #000000;">银河物业</h1>
						   		<i class="fa fa-bank" style="font-size:30px; margin-left: 2em;"></i>
						   </a>
						   <a class="nav-link"  id="v-pills-profile-tab" data-toggle="pill" href="#v-pills-profile" role="tab" aria-controls="v-pills-profile" aria-selected="false">
						   		<i class="fa fa-phone" style="font-size:36px"></i>
						   		<h3>住户服务</h3>
						   </a>
						   <a class="nav-link" id="v-pills-messages-tab" data-toggle="pill" href="tousu.jsp" role="tab" aria-controls="v-pills-messages" aria-selected="false">
						   		<i class="fa fa-exclamation-triangle" style="font-size:24px"></i>
						   		<h5>投诉</h5>
						   </a>
						   <a class="nav-link" id="v-pills-messages-tab" data-toggle="pill" href="jianyi.jsp" role="tab" aria-controls="v-pills-messages" aria-selected="false"  style="background-color: #E6E6E6;">
						   		<i class="fa fa-envelope-o" style="font-size:24px"></i>
						   		<h5>建议</h5>
						   </a>
						   <a class="nav-link" id="v-pills-messages-tab" data-toggle="pill" href="baoxiu.jsp" role="tab" aria-controls="v-pills-messages" aria-selected="false">
						   		<i class="fa fa-wrench" style="font-size:24px"></i>
						   		<h5>报修</h5>
						   </a>
						</div>
				    </div>
				    <!--pill-bottom-->
   
				    <!--form-->
				    <div class="col-sm-9 col-md-9 col-lg-9" id="form-tousu">
				    	<table class="position-now">
				    			<tbody>
				    				<tr>
				    					<td>
				    						当前位置：
				    						<a href="index.jsp">首页</a>
				    						<span>>></span>
				    						<a href="#">住户服务申请</a>
				    						<span>>></span>
				    						<a href="jianyi.jsp">我要建议</a>
				    					</td>
				    				</tr>
				    			</tbody>
				    	</table>
				    	<fieldset id="">
				    		<legend>住户建议表</legend>
							<form action="${pageContext.request.contextPath}/index/addcsr.do" id="suggestform" method="post">
								<input hidden name="csrType" value="2"/>
								<input hidden name="user_id" value="${sessionScope.user.userid}"/>
						    	<div class="form-group">
								    <label for="exampleFormControlTextarea1">请输入建议内容</label>
								    <textarea class="form-control" name="csrText" id="exampleFormControlTextarea1" rows="5" placeholder="请输入..."></textarea>
									<small id="passwordHelpBlock" class="form-text text-muted">
	 	 							请简述您的建议内容
									</small>
						    	</div>
								<div class="form-row">
									<div class="form-group col-md-7">
										<label for="inputName">请输入您的名字</label>
										<input type="text" name="csrName" id="inputName" class="form-control" placeholder="请输入...">
										<small  class="form-text text-muted">
											名字不能为空
										</small>
									</div>
									<div class="form-group col-md-7">
										<label for="inputTel">请输入您的联系电话</label>
										<input type="text" name="csrPhone" id="inputTel" class="form-control" placeholder="家庭固话/手机号码">
										<small  class="form-text text-muted">
											联系方式可以为空
										</small>
									</div>
								</div>
								<button type="submit" class="btn btn-primary" onclick="return tips()">提交</button>
							</form>
						</fieldset>
		   			</div>
		   			<!--form-bottom-->
		   		</div>
	   	 	</div>
		<!--</div>-->
	</div>
	<script>
        function tips() {
            alert("提交成功！感谢你的支持！");
            return true;
        }
		/**退出系统**/
		function logout(){
			if(confirm("您确定要退出本系统吗？")){
				window.location.href = "/index/userLogout.do";
			}
		}
	</script>
</body>
</html>
