<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<html>
<head>
<title></title>
</head>
<body>
<div id="container" align="center">
<table>
<tr>
<td><tiles:insertAttribute name="one"/></td>
<td><tiles:insertAttribute name="two"/></td>
</tr>
<tr>
<td colspan="2"><tiles:insertAttribute name="three"/></td>
</tr>
</table>
</div>
</body>
</html>