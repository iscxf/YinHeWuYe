<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" import="java.util.*" pageEncoding="utf-8" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<title>关于我们</title>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<script type="text/javascript" src="../js/jquery-3.3.1.min.js"></script>
	<script src="../js/wow.js"></script>
	<script src="../js/lazyFade.js"></script>
	<script src="../js/bootstrap.min.js"></script>
	<link rel="stylesheet" type="text/css" href="../css/animate.css">
	<link rel="stylesheet" type="text/css" href="../css/font-awesome.min.css"/>
	<link rel="stylesheet" type="text/css" href="../css/userBootStyle.css"/>
	<link rel="stylesheet" type="text/css" href="../css/userCssStyle.css"/>	
    
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
						<li class="nav-item" style="margin-top: 4px;">
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
	
	<div class="container-fluid">
		<div class="row">
			<div class="col-md-3">
				<table>
					<tr>
						<td>
							<span>
								<a href="#introduce" id="intr">公司简介</a>
							</span>
						</td>
					</tr>
					<tr>
						<td>
							<span>
								<a href="#culture" id="cult">企业文化</a>
							</span>
						</td>
					</tr>
					<tr>
						<td>
							<span>
								<a href="#history" id="hist">发展历程</a>
							</span>
						</td>
					</tr>
					<tr>
						<td>
							<span>
								<a href="#strategy" id="stra">公司战略</a>
							</span>
						</td>
					</tr>
				</table>
			</div>
			
			<div class="col-md-9" style="margin-top: 6em;margin-left: -3em;-webkit-box-shadow: 3px 5px 10px rgba(0,0,0,0.5);margin-bottom: 30em;">
				<table class="position-now">
	    			<tbody>
	    				<tr>
	    					<td>
	    						当前位置：
	    						<a href="index.jsp">首页</a>
	    						<span>>></span>
	    						<a href="aboutUs.jsp">关于银河物业</a>
	    					</td>
	    				</tr>
	    			</tbody>
	    		</table>
				
				<table>
					<tbody id="introduce">
						<tr>
							<td align="center">
								<span style="color: #FF4400;;font-size: 20px; font-family: '微软雅黑';">
									<h2>公司简介</h2>
								</span>
							</td>
						</tr>
						<tr style="border-bottom: 0.1em solid #DDDDDD;">
							<td style="text-indent: 2em;">
								<h4>银河物业是什么</h4>
								<p>
									银河物业是中国新型城镇化进程的身体力行者，是全球绿色生态智慧城市的建造者，不仅为超过400个城镇带来现代化的城市面貌，提升当地人民的居住条件和生活品质，还在新加坡旁以当今世界先进的城市设计理念首建立体分层现代城市——森林城市。
								</p>
								<p>
									森林城市地面都是公园，车辆在底层穿行，地面是无污染轨道交通，建筑外墙长满垂直分布的植物，每一天，人们就都生活在花园里，呼吸在森林里，愉悦在自然之中。森林城市将是未来城市的榜样。
								</p>
								<p>
									20多年来，银河物业都是所在城市亮丽风景线和名片。园林景观、生活广场使当地人民流连忘返，会所、物业服务令人生活舒适、安全。城市的建筑、园林、管理都应经得起历史的检验，银河物业在每座城市都将小区品质做到一步到位：建世界一流的小区！所以现已有超过300万业主选择在银河物业安居乐业。
								</p>
							</td>
						</tr>
					</tbody >
					<tbody  id="culture">
						<tr>
							<td align="center">
								<span style="color: #FF4400;font-size: 20px; font-family: '微软雅黑';">
									<h2>企业文化</h2>
								</span>
							</td>
						</tr>
						<tr style="border-bottom: 0.1em solid #DDDDDD;">
							<td>
								<p>
									价值观：我们要做有良心、有社会责任感的阳光企业
								</p>
								<p>
									企业使命：希望社会因我们的存在而变得更加美好
								</p>
								<p>
									企业精神：对人好，对社会好
								</p>
								<p>
									品牌理念：给您一个五星级的家
								</p>
								<p>
									质量方针：过程精品，人居典范
								</p>
								<p>
									人才理念：以德为本，德才兼备；不拘一格，能者居上
								</p>
								<p>
									战略愿景：做全球最具竞争力的房地产公司
								</p>
							</td>
						</tr>
					</tbody >
					<tbody  id="history">
						<tr>
							<td align="center">
								<span style="color: #FF4400;font-size: 20px; font-family: '微软雅黑';">
									<h2>发展历程</h2>
								</span>
							</td>
						</tr>
						<tr style="border-bottom: 0.1em solid #DDDDDD;">
							<td style="text-indent: 2em;">
								<p>1996年，公司在广州成立，从零开始，在亚洲金融风暴中逆市出击，凭借“小面积、低价格、低成本”的策略抢占先机，1997年开发的第一个楼盘金碧花园两个小时内抢购一空，实现销售额8000万，获得了起步发展极其宝贵的第一桶金。经过三年艰苦奋斗，1999年银河物业从2000多家广州房企中脱颖而出，成为广州地产10强。</p>
								<p>从2000年开始，公司进一步夯实发展基础，着力于整合资源、规范流程、提升管理，陆续开发“金碧”系列精品楼盘，企业品牌和实力突飞猛进，位居广州房地产最具竞争力10强企业第一名。</p>
								<p>2003年开始，公司实施紧密型集团化管理模式，采用统一规划、统一招标、统一采购、统一配送的标准化运营模式，确立了全精装修交楼的民生地产定位。2004年5月，公司砸掉金碧世纪花园耗资千万但不符合精品标准的中心园林，开始实施精品战略，不断实现产品升级换代，为全国拓展奠定了坚实基础。</p>
								<p>2006年开始，公司布局全国，从广州迅速拓展到上海、天津、武汉、成都等全国20多个主要城市，开发项目从2个增至50多个，跻身中国房企20强。同时，成功引进了淡马锡、德意志银行和美林银行等国际投资者，成为中国房地产企业迈向国际的标杆。
2008年底，公司各项核心经济指标较2006年都实现了10至20倍的超常规增长，创造了公司跨越发展的奇迹。</p>
								<p>2009年，公司在香港成功上市，成为在港市值最高的内房企。到2011年末，公司已在全国120多个主要城市开发项目200多个，土地储备、在建面积、销售面积、竣工面积、利润指标等重要经济指标均列行业第一，品牌价值突破210亿元，规模与品牌进一步取得大幅跨越。</p>
								<p>2012年起，公司全面实施向管理要效益的方针，深化基础管理、完善制度建设，提升各级管理团队和员工队伍综合素质。
2013年，公司销售额首次突破千亿。到2014年末，公司销售额、销售面积、净利润、开工面积、竣工面积等各项核心指标连续五年实现平均30%以上的增长，再创高速增长的新纪录。 </p>
								<p>2015年，公司在进一步夯实房地产主业的基础上，拓展金融、文化旅游及健康等多元产业。2016年，银河物业跻身世界500强，并成为全球第一房企。
到2016年底，公司完成了多元化发展的产业布局，实现了由“房地产业”向“房地产+服务业”的转型，即由“房地产业”向“房地产+健康+旅游+金融”的转型，也就是由“房地产”向“房地产+服务老人+服务儿童+服务社会”的转型。
2017年，公司启动战略转型。在发展模式上，从“规模型”向“规模+效益型”模式转变；在经营模式上，从高负债、高杠杆、高周转、低成本的“三高一低”模式向低负债、低杠杆、低成本、高周转的“三低一高”模式转变。多项核心数据均创行业第一，战略转型成效显著，公司位列世界500 强第338 名，一举跃升158 位，成为世界500 强排名提升最快的企业之一。</p>
							</td>
						</tr>
					</tbody >
					<tbody id="strategy" style="text-indent: 2em;">
						<tr>
							<td align="center">
								<span style="color: #FF4400;font-size: 20px; font-family: '微软雅黑';margin-left: -3.5em;">
									<h2>公司战略</h2>
								</span>
							</td>
						</tr>
						<tr>
							<td>
								<h4>规模战略</h4>
								<p>公司成立以来，一直坚持规模取胜的发展战略，在规模上做大做强。2006年之前，公司扎根广东，迅速做大规模；2006年开始，公司拓展全国，高速发展。对比2006年与2017年主要数据，公司销售额、现金余额、利税、总资产等多项主要经济指标实现了142-294倍的增长，创造了企业发展的增长奇迹。</p>
							</td>
						</tr>
						<tr>
							<td>
								<h4>
									品牌战略
								</h4>
								<p>
									公司持续实施精品战略，制定了项目规划设计、工程施工、园林配套、装修及材料设备等6000多条“精品工程标准”，与国内外800多家上下游龙头企业建立了稳固的战略联盟，成为行业唯一一家全部精装修交楼的大型房企，屡创销售奇迹。公司以前瞻性的品牌战略、科学高效的品牌运营，塑造了享誉中外的品牌形象。
								</p>
							</td>
						</tr>
						<tr>
							<td>
								<h4>
									人才战略
								</h4>
								<p>
									公司创立之初即明确队伍建设标准，建立高标准的人才引入及培养机制，95%以上员工具有大学本科及以上学历。同时，公司充分发挥薪资保障和绩效考核双重作用，不断优化人才结构，打造了一支优秀的领导团队及高素质、执行力超强的铁军队伍，成为银河物业稳健快速发展的强有力保障。
								</p>
							</td>
						</tr>
						<tr>
							<td>
								<h4>
									管理战略
								</h4>
								<p>
									公司创立独特的目标计划管理体系，把计划管理和目标管理合二为一，成为银河物业跨越发展的制胜法宝。公司实施紧密型集团化管理模式，在上马项目、规划设计、材料供应、招投标、预决算、工程管理、质量管理、销售及交楼方面由集团直接把控，地区公司严格执行，实现成本控制和质量管控双效合一，确保了公司健康高速增长。
								</p>
							</td>
						</tr>
						<tr>
							<td>
								<h4>
									文化战略
								</h4>
								<p>
									公司在成立之初即确立“质量树品牌，诚信立伟业”的恒大宗旨，“艰苦创业、无私奉献、努力拼搏、开拓进取”的银河精神，“精心策划、狠抓落实、办事高效”的银河作风，一直延续至今。同时，建立与时俱进的激励机制和约束机制，重奖重罚、从严管理，对于保证公司健康发展、树立良好企业文化，起到非常重要的作用。
								</p>
							</td>
						</tr>
					</tbody>
				</table>
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
