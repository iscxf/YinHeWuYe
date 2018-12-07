<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" import="java.util.*" pageEncoding="utf-8" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<title>住户缴费信息</title>
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
    <!--<link rel="stylesheet" type="text/css" href=."../css/basic.css" />-->
    <!--<link rel="stylesheet" type="text/css" href="../layui-v2.3.0/layui/css/layui.css"/>-->
 
	
    
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
						<li class="nav-item" style="margin-top: 6px;">
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
			<div class="container-fluid">
				<div class="row">
					<!--pill-->
					<div class="col-sm-3 col-md-3 col-lg-3" id="pill-nav">
				        <div class="nav flex-column nav-pills" id="v-pills-tab" role="tablist" aria-orientation="vertical">
						   <a class="nav-link active" id="v-pills-home-tab" data-toggle="pill" href="index.jsp" role="tab" aria-controls="v-pills-home" aria-selected="true" title="回到首页">
						   		<h1>银河物业</h1>
						   		<i class="fa fa-bank" style="font-size:30px; margin-left: 2em;"></i>
						   </a>
						   <a class="nav-link"  id="v-pills-profile-tab" data-toggle="pill" href="#v-pills-profile" role="tab" aria-controls="v-pills-profile" aria-selected="false">
						   		<i class="fa fa-id-card" style="font-size:36px"></i>
						   		<h3>个人信息查询</h3>
						   </a>
						   <a class="nav-link" id="v-pills-messages-tab" data-toggle="pill" href="${pageContext.request.contextPath}/index/queryUserInfo.do" role="tab" aria-controls="v-pills-messages" aria-selected="false">
						   		<i class="fa fa-home" style="font-size:24px;margin-left: 0.1em;"></i>
						   		<h5 style="margin-left: 0.6em;">房产信息</h5>
						   </a>
						   <a class="nav-link" id="v-pills-messages-tab" data-toggle="pill" href="${pageContext.request.contextPath}/index/selectspotmanabyuser.do" role="tab" aria-controls="v-pills-messages" aria-selected="false">
						   		<i class="fa fa-car" style="font-size:24px"></i>
						   		<h5 style="margin-left: 0.4em;">停车信息</h5>
						   </a>
						   <a class="nav-link" id="v-pills-messages-tab" data-toggle="pill" href="${pageContext.request.contextPath}/index/queryUserCharge.do" role="tab" aria-controls="v-pills-messages" aria-selected="false" style="background-color: #E6E6E6;">
						   		<i class="fa fa-cny" style="font-size:24px;margin-left: 0.3em;"></i>
						   		<h5 style="margin-left: 0.7em;">缴费信息</h5>
						   </a>
						</div>
				    </div>
				    <!--pill-bottom-->
   
				    <!--form-->
				    <div class="col-sm-9 col-md-9 col-lg-9" style="margin-top: 6em;padding: 20px;border-left: 1em solid white;background-color: #EEEEEE;border-radius: 1em;">
				    	<table class="position-now">
				    			<tbody>
				    				<tr>
				    					<td>
				    						当前位置：
				    						<a href="index.jsp">首页</a>
				    						<span>>></span>
				    						<a href="#">个人信息查询</a>
				    						<span>>></span>
				    						<a href="${pageContext.request.contextPath}/index/queryUserCharge.do">缴费信息</a>
				    					</td>
				    				</tr>
				    			</tbody>
				    	</table>
				    	
				    	<div class="container">                   
	                        <!--标题-->
	                        <div class="row">
	                            <div style="margin-left: 23.4em;">
	                                <h2>缴费记录表</h2>
	                            </div>
	                        </div>
					    	<!--表格-->
	                        <div class="row">
	                            <div class="col-md-12" style="margin-top: 1em;">
	                                <div class="table-responsive">
		                                <table class="table table-hover">
		                                    <tr style="border-bottom: 2px solid #DDDDDD;">
		                                        <th>收费编号</th>
		                                        <th>房产号</th>
		                                        <th>物业费(/元)</th>
		                                        <th>水电费(/元)</th>
		                                      
		                                        <th>收费办理人</th>
		                                        <th>收费时间</th>
		                                    </tr> 
		                                    <c:forEach items="${sessionScope.charges}" var="charge">
                                                <tr style="border-bottom: 2px solid #DDDDDD;">
                                                    <td id="charid">${charge.charid}</td>
                                                    <td id="hp_id">${charge.hp_id}</td>
                                                    <td id="propFee">${charge.propFree}</td>
                                                    <td id="waeFee">${charge.waeFee}</td>
                                                    <td id="staf_id">${charge.staff.stafName}</td>
                                                    <td id="CharDate"><fmt:formatDate value="${charge.charDate}" pattern="yyyy-MM-dd"/> </td>
                                                </tr>
                                            </c:forEach>
		                                </table>
	                                </div>		
	                            </div>
	                        </div>
	                        
				    	</div>
		   			</div>
		   			<!--form-bottom-->
		   		</div>
	   	 	</div>
		<!--</div>-->
	</div>
	<script>
			/**退出系统**/
			function logout(){
				if(confirm("您确定要退出本系统吗？")){
					window.location.href = "/index/userLogout.do";
				}
			}
	</script>	
	
</body>
</html>
