<%--
 * layout.jsp
 *
* Copyright (C) 2014 Paperbet S.A.
 --%>

<%@page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@taglib prefix="jstl" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>

<!DOCTYPE html>
<html>
<head>

<base
	href="${pageContext.request.scheme}://${pageContext.request.serverName}:${pageContext.request.serverPort}${pageContext.request.contextPath}/" />

<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

<link rel="shortcut icon" href="favicon.ico"/> 

<script type="text/javascript" src="scripts/jquery.js"></script>
<script type="text/javascript" src="scripts/jquery-ui.js"></script>
<script type="text/javascript" src="scripts/jmenu.js"></script>
<script type="text/javascript" src="scripts/jquery.dynamiclist.min.js"></script>
<script type="text/javascript" src="styles/bootstrap/js/bootstrap.min.js"></script>
<script type="text/javascript" src="scripts/jquery.cookie.js"></script>
<script type="text/javascript" src="scripts/jquery.complexify.js"></script>

<link rel="stylesheet" href="styles/bootstrap/css/bootstrap.css">
<link rel="stylesheet" href="styles/bootstrap/css/bootstrap-theme.min.css">
<link rel="stylesheet" href="//code.jquery.com/ui/1.10.4/themes/smoothness/jquery-ui.css">
<link rel="stylesheet" href="/resources/demos/style.css">
<link rel="stylesheet" href="styles/common.css" type="text/css">
<link rel="stylesheet" href="styles/jmenu.css" media="screen" type="text/css" />

<title>
	<tiles:insertAttribute name="title" ignore="true" />
</title>

</head>

<body>

	<div>
		<tiles:insertAttribute name="header" />
	</div>
	<div>
		<tiles:insertAttribute name="body" />	
		<jstl:if test="${message != null}">
			<br />
			<span class="message"><spring:message code="${message}" /></span>
		</jstl:if>	
	</div>
	<div>
		<tiles:insertAttribute name="footer" />
	</div>

</body>
</html>