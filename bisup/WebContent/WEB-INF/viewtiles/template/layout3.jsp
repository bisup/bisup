<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<html>
<head>
<link href="/bisup/css/reset.css" rel="stylesheet" type="text/css">
<link href="/bisup/css/global.css?ver=1.3" rel="stylesheet" type="text/css">
<link href="/bisup/css/style.css?ver=1.5" rel="stylesheet" type="text/css">
<title><tiles:getAsString name="title" /></title>
</head>
<body oncontextmenu="return false" onselectstart="return false" ondragstart="return false">
	  
		<div id="top">
			<tiles:insertAttribute name="header_m" />
		</div>
		<div id="left">
			<tiles:insertAttribute name="menu" />
		</div>
		<div id="content">
			<tiles:insertAttribute name="body" />
		</div>
		<br><br><br>
		<div id="bottom">
			<tiles:insertAttribute name="footer" />
		</div>

</body>
</html>

