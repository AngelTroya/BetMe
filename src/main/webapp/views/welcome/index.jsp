<%--
 * index.jsp
 *
* Copyright (C) 2014 Paperbet S.A.
 --%>

<%@page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>

<%@taglib prefix="jstl"	uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@taglib prefix="security" uri="http://www.springframework.org/security/tags"%>
<%@taglib prefix="display" uri="http://displaytag.sf.net"%>

<security:authorize access="hasRole('CUSTOMER')">
	<jsp:include page="../bet/show.jsp" />
</security:authorize> 

<security:authorize access="isAnonymous()">
	<jsp:include page="../bet/show.jsp" />
</security:authorize> 

<security:authorize access="hasRole('MODERATOR')">
	<jsp:include page="../moderator/show.jsp" />
</security:authorize> 