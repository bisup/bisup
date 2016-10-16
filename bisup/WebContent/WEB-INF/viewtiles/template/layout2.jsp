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
			<tiles:insertAttribute name="header" />
		</div>
		
		<div>
			<div id="m_content">
				<div>
					<tiles:insertAttribute name="left_top" />
				</div>
				<div>
					<tiles:insertAttribute name="left_bottom" />
				</div>
			</div>
			
			<div id="m_content">
				<div>
					<tiles:insertAttribute name="right_top" />
				</div>
				<div>
					<tiles:insertAttribute name="right_bottom" />
				</div>
			</div>
		</div>
		<br><br>
		<div id="bottom">
			<tiles:insertAttribute name="footer" />
		</div>
	
</body>


</html>