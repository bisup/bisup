<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<html>
<head>
<title><tiles:getAsString name="title"/></title>
</head>
<body>
<tiles:insertAttribute name="header_m"/>
<br>
<tiles:insertAttribute name="body"/><br><br><br>
<tiles:insertAttribute name="footer"/>
</body>
</html>