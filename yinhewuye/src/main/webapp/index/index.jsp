<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" import="java.util.*" pageEncoding="utf-8" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<title>银河物业</title>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<!--<script type="text/javascript" src="../js/jquery-3.3.1.min.js"></script>-->
	<script type="text/javascript" src="../js/jquery-3.0.0.js"></script>
	<script src="../js/wow.js"></script>
	<script src="../js/lazyFade.js"></script>
	<!--<script src="../js/bootstrap.min.js"></script>-->
	<script src="../js/userJs.js"></script>
	<link rel="stylesheet" type="text/css" href="../css/animate.css">
	<link rel="stylesheet" type="text/css" href="../css/font-awesome.min.css"/>
	<link rel="stylesheet" type="text/css" href="../css/userBootStyle.css"/>
	<link rel="stylesheet" type="text/css" href="../css/userCssStyle.css"/>	
    
<script>
        $(function() {
            $(".content_li a").lazyFade({
                reverse: false,
                duration: 250,
                delay: 250,
                opacity: {
                    start: 0.01,
                    end: 1
                }
            });
            new WOW().init();
        });
    </script>
</head>
<body>
	<!--导航栏-->
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
	<!--luen播图-->
	<div class="container-fulid" >
		<div id="luenbo" class="carousel slide" data-ride="carousel">
			<ol class="carousel-indicators">
				<li data-target="#luenbo" data-slide-to="0" class="active"></li>
				<li data-target="#luenbo" data-slide-to="1"></li>
				<li data-target="#luenbo" data-slide-to="2"></li>
			</ol>
			<div class="carousel-inner">
				<div class="carousel-item active">
					<img class="d-block w-100" src="../img/004.jpg" alt="First slide">
					<div class="carousel-caption" style="top: 60px;">
						<h2>银河物业</h2>
						<p>竭尽所能，为您服务</p>
					</div>
				</div>
				<div class="carousel-item">
					<img class="d-block w-100" src="../img/005.jpg" alt="Second slide">
					<div class="carousel-caption text-left">
						<h2>银河社区</h2>
						<p>还您江南水乡之美</p>
					</div>
				</div>
				<div class="carousel-item">
					<img class="d-block w-100" src="../img/006.jpg" alt="Third slide">
					<!--<div class="carousel-caption d-md-block text-right">
						<h2>走出课堂亲近大自然</h2>
						<p>亲自感受大自然的魅力</p>
					</div>-->
				</div>
			</div>
			<a class="carousel-control-prev" href="#luenbo" role="button" data-slide="prev">
				<span class="carousel-control-prev-icon" aria-hidden="true"></span>
			</a>
			<a class="carousel-control-next" href="#luenbo" role="button" data-slide="next">
				<span class="carousel-control-next-icon" aria-hidden="true"></span>
			</a>
		</div>
	</div>
	<!--新闻模块-->
	<div class="container" style="margin-top: 2%">
		<div style="border-bottom: 0.1px solid #17A2B8;">
			<h2>社区新闻</h2>
			<a href="javascript:void(0)" class="read-more-btn pull-right" style="margin-top: 0.7em;">更多 <i class="fa fa-chevron-circle-right"></i></a>
		</div>		
		<div class="row content_li wow fadeInUp">
			<div class="col-md-4 col-sm-10 tuwen" style="padding-left:0;margin-top: 1.5em;">
				<img class="img-fluid" src="../img/message1.jpg">
				<div class="text-light" style="background-color: #a2795a;padding:0.6em;border-bottom-left-radius: 0.6em;border-bottom-right-radius: 0.6em;"><h4>热烈庆祝银河物业荣获全国五百强物业公司</h4></div>
			</div>
			<div class="col-md-4 col-sm-10 tuwen" style="padding-left:0;margin-top: 1.5em;">
				<img class="img-fluid" src="../img/message2.jpg">
				<div class="text-light" style="background-color: #ad5bad;padding:0.6em;border-bottom-left-radius: 0.6em;border-bottom-right-radius: 0.6em;"><h4>预祝银河物业成立十周年庆典圆满成功</h4></div>
			</div>
			<div class="col-md-4 col-sm-10 date_icon">
				<div class="row">
					<div class="message_left col-3 text-center">
						<div class="left_top" >1</div>
						<div class="left_bottom" >08-11</div>
					</div>
					<div class="col">
						<a href="javascript:void(0)">社区升级改造进行中</a>
					</div>
				</div>
				<div class="row">
					<div class="message_left col-3 text-center">
						<div class="left_top" >2</div>
						<div class="left_bottom">08-11</div>
					</div>
					<div class="col"><a href="javascript:void(0)">银河物业和世界知名企业合作</a></div>
				</div>
				<div class="row">
					<div class="message_left col-3 text-center">
						<div class="left_top" >3</div>
						<div class="left_bottom">08-11</div>
					</div>
					<div class="col"><a href="javascript:void(0)">社区周年庆活动热烈进行中</a></div>
				</div>
				<div class="row">
					<div class="message_left col-3 text-center">
						<div class="left_top" >4</div>
						<div class="left_bottom">08-11</div>
					</div>
					<div class="col"><a href="javascript:void(0)">社区老人活动中心建设建议收集即日开始</a></div>
				</div>
			</div>
		</div>
	</div>

	<div class="container-fulid text-center" style="margin-top: 2%;">
		<h3 style="display: block;">和谐，舒适</h3>
		<h3>Harmony & Comfort </h3>
	</div>

	<div class="container-fulid" style="background-color: #e2f3ff;margin-top: 2%;padding: 1%">
		<div class="container">
			<div class="row content_li wow fadeInUp">
				<div class="col-md-4 col-sm-10 date_icon">
					<h2>通知公告</h2>
					<div class="row">
						<div class="message_left col-3 text-center">
							<div class="left_top" >1</div>
							<div class="left_bottom">08-11</div>
						</div>
						<div class="col"><a href="javascript:void(0)">关于某业主昨夜噪声扰民问题处理通知</a></div>
					</div>
					<div class="row">
						<div class="message_left col-3 text-center">
							<div class="left_top" >2</div>
							<div class="left_bottom">08-11</div>
						</div>
						<div class="col"><a href="javascript:void(0)">2017—2018年第一期社区整改通知</a></div>
					</div>
					<div class="row">
						<div class="message_left col-3 text-center">
							<div class="left_top" >3</div>
							<div class="left_bottom">08-11</div>
						</div>
						<div class="col"><a href="javascript:void(0)">银河物业2018年公开招标通告</a></div>
					</div>
					<div class="row">
						<div class="message_left col-3 text-center">
							<div class="left_top" >4</div>
							<div class="left_bottom">08-11</div>
						</div>
						<div class="col"><a href="javascript:void(0)">社区2018年8月保洁工作安排通知</a></div>
					</div>
					<div class="row">
						<div class="message_left col-3 text-center">
							<div class="left_top" >5</div>
							<div class="left_bottom">08-11</div>
						</div>
						<div class="col"><a href="javascript:void(0)">社区招聘安保人员通知</a></div>
					</div>
					<a href="javascript:void(0)" class="read-more-btn">更多公告 <i class="fa fa-chevron-circle-right"></i></a>
				</div>
			<div class="col-md-8 col-sm-10 tuwen" style="padding-left:0">
				<h2>综合消息</h2>
				<img class="img-fluid" src="../img/shengyuenhuei2.jpg">
				<div class="text-light" style="background-color: #66a7d3;padding:0.6em;padding-bottom: 3.5em">
					<h5 style="padding-bottom: 0">距离1994年广东省第九届运动会在肇庆的举行，已经整整过去了近24年，然而，那全民投入肇庆市体育中心建设的热情、举市欢庆省九运的浓烈氛围，仍然在许多肇庆老街坊的心头萦绕，未曾散去。</h5>
					<a href="javascript:void(0)" class="text-light" style="padding:5px;margin:5px; border:1px solid #eee;float: right;">阅读更多 <i class="fa fa-chevron-circle-right"></i></a>
				</div>
					<a href="javascript:void(0)" class="read-more-btn">更多消息 <i class="fa fa-chevron-circle-right"></i></a>
			</div>
		</div>
		</div>
	</div>

<div class="container-fulid text-center" style="margin-top: 2%">
		<h3 style="display: block;">风格 理念</h3>
		<h3>Style & Idea</h3>
	</div>

<div class="container-fulid tupian">
	<div class="row justify-content-center row1">
		<div class="single-member effect-1 col-md-3 wow fadeInUp">
			<div class="member-image">
				<img src="../img/011.jpg" alt="photo">
			</div>
			<div class="member-info">
				<div class="social-touch">
					<a class="fb-touch" href="#">生态森林城</a>

				</div>
			</div>
		</div>
		
		<div class="single-member effect-1 col-md-3 wow fadeInUp">
			<div class="member-image">
				<img src="../img/008.jpg" alt="photo">
			</div>
			<div class="member-info">
				<div class="social-touch">
					<a class="fb-touch" href="#">唯美西欧风</a>
				</div>
			</div>
		</div>
		<div class="single-member effect-1 col-md-3 wow fadeInUp">
			<div class="member-image">
				<img src="../img/010.jpg" alt="photo">
			</div>
			<div class="member-info">
				<div class="social-touch">
					<a class="fb-touch" href="#">浪漫海景区
					</a>
				</div>
			</div>
		</div>	
	</div>
</div>
<div class="container-fulid foot1 text-muted" style="background-color: #2f4052;color: #959595; padding:2em 0 2em 0">
	<div class="row justify-content-center text-left">
		<div class="col-3" >
			<h5 style="margin-bottom: 1em"><img class="img-fluid" alt="Responsive image" src="../img/myLogo-white.png" alt="肇庆学院" title="肇庆学院" style="width:10em;"></h5>
			<ul class="list-unstyled">
				<li><p>地址：广东省肇庆市端州区</p></li>
				<li><p>电话：<a href="tel:0785-1234567">0785-1234567</a></p></li>
			</ul>
		</div>
		<div class="col-2">
			<h5 style="margin-bottom: 1em;color: #ccc">关于我们</h5>
			<ul class="list-unstyled">
				<li><a href="#">停车管理</a></li>
				<li><a href="#">办公管理</a></li>
				<li><a href="#">保洁管理</a></li>
				<li><a href="#">安保管理</a></li>
			</ul>
		</div>
		<div class="col-2">
			<h5 style="margin-bottom: 1em;color: #ccc">友情链接</h5>
			<ul class="list-unstyled">
				<li><a href="#">干部在线学习</a></li>
				<li><a href="#">继续教育学习</a></li>
				<li><a href="#">全国征兵网</a></li>
			</ul>
		</div>
		<div class="col-2">
			<h5 style="margin-bottom: 1em"><img src="../img/二维码.png" alt="肇庆学院二维码" title="肇庆学院二维码" style="width:5em;"></h5>
			<p>微信 二维码</p>
		</div>
	</div>


</div>
<div class="container-fulid text-muted" style="background-color: #283645;color: #333">
	<div class="row justify-content-center text-center" style="">
		<div class="col">
			<p>Copyright 2018© 银河物业 | 联系我们：yhwy@163.com</p>
		</div>
	</div>

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
