 <%--
 * login.jsp
 *
* Copyright (C) 2014 Paperbet S.A.
 --%>

<%@page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>

<%@taglib prefix="jstl"	uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@taglib prefix="security" uri="http://www.springframework.org/security/tags"%>

<form:form action="j_spring_security_check" class="navbar-form navbar-right" modelAttribute="credentials">
	<div class="form-group">
		<form:input path="username" placeholder="Username" class="form-control" />	
	</div>
	<div class="form-group">
		<form:password path="password" placeholder="Password" class="form-control" />
	</div>
	
	<input type="submit" class="btn btn-default" value="<spring:message code="security.login" />" />
	
</form:form>