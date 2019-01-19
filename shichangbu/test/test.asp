<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=EmulateIE9"/>
	<title>TOP300楼宇查询</title>
	<style>
	#div1{
	width: 1200px;
	height: 200px;
	text-align: center;
	}
	#div2{
	width: 200px;
	height: 600px;
	float: left;
	border: 1px solid orange; -ms-border-radius: 5px;
	}
	body{
	background:url(2_4.jpg); 
	background-repeat: no-repeat;
	background-size:2500px 1625px;

	}
	a{margin-top: 30px;
	text-decoration: none;
	border: 1px solid; -ms-border-radius: 5px;
	background-color: rgba(100,100,100,0.5);
	color: orange;
	
	}
	a:link, 
	a:visited { 
	color:orange; 
	text-decoration:none; 
	} 
	a:hover, 
	a:active { 
	color:white; 
	border: 1px solid orange;
	background-color: orange;
	text-decoration:none; 
	} 
 	p{
	color: white;
	margin-left: 30px;
	margin-top: 30px;
	font-size: 13px;margin: 20px
	}

	</style>
</head>

<!-- <frameset rows = "190,*">  
<frame  src = "a.html" frameborder = "1">  
<frameset cols = "200,*">  
<frame src = "b.html" noresize frameborder = "1">  
<frame src = "check1.asp" name = "frame2" frameborder = "1">  
</frameset>  
</frameset>   -->
<body >
	<div style="width: 1200px;position: relative;margin: 0 auto; ">
	<div id="div1"><div style="margin-top: 50px;FONT-SIZE: 48pt; FILTER: dropshadow(color=black,offX=5,offY=3,Positive=1); WIDTH: 100%; 
	COLOR: #ffffff; LINE-HEIGHT: 100%; FONT-FAMILY: 宋体"><strong>TOP300楼宇资料查询系统</strong>
	<br>
	<font size="5px" style="margin-top: 10px">广州移动越秀分公司</font>
	</div>
	</div>
	<div style="width: 1200px;margin-bottom: 50px">
	<div id="div2" style="float: left;margin-bottom: 50px">

 	<a style="padding-left:51px;padding-right: 51px;margin-top: 0px " href = "help.html" target = "frame2"  onclick="javascript:document.getElementsByName('frame3')[0].src='help.html';"style="">查询帮助文档</a>

	<p style="">通过查看帮助文档可详细了解本查询系统的使用</p>
	<a href = "check1.asp" target = "frame2" onclick="javascript:document.getElementsByName('frame3')[0].src='xinxi.asp';" style="padding-left:51px;padding-right: 51px;">基础信息查询</a>
	<p style="">可查询楼宇的基本信息，集团的基本信s息，楼宇经理的基本信息，客户经理的基本信息</p>
	<a href = "check2.asp" target = "frame2" onclick="javascript:document.getElementsByName('frame3')[0].src='check3.asp';"style="padding-left:35px;padding-right: 35px;">楼宇投产信息查询</a>
	<p style="">可查询某个楼宇的投产情况和有关信息</p>  
	<a href = "check3.asp" target = "frame2" onclick="javascript:document.getElementsByName('frame3')[0].src='index.html';" style="padding-left:27px;padding-right: 27px;">楼宇内集团情况查询</a>
	<p style="">可查询楼宇内集团情况和有关信息</p> 
	<a href = "check4.asp" target = "frame2" onclick="javascript:document.getElementsByName('frame3')[0].src='DIV-CHAOchuyingchang.html';" style="padding-left:51px;padding-right: 51px;">统计信息查询</a>
	<p style="">可查询TOP300楼宇是否达标情况，指定楼内客户数进行查询</p>
	</div>
	<div style="float:left; width: 910px">
	<iframe src="check1.asp" allowtransparency="true" style="background-color=transparent;margin-top: 0px;margin-bottom: 0px;marginwidth="0" marginheight="0"" title="test" frameborder="0" width="900px" height="100px" scrolling="auto" name="frame2" marginwidth="0" marginheight="0"  align="top"></iframe>
	<iframe src="xinxi.asp" allowtransparency="true" style="background-color=transparent;margin-top: 0px;margin-bottom: 0px;marginwidth="0" marginheight="0"" title="test" frameborder="0" width="900px" height="500px" scrolling="auto" name="frame3" marginwidth="0" marginheight="0" align="top"></iframe>
	</div>
	</div>
</body>
</div>
</html>

