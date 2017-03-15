<%--
 * action-1.jsp
 *
 * Copyright (C) 2014 Paperbet S.A.
 --%>

<%@page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@taglib prefix="security"
	uri="http://www.springframework.org/security/tags"%>
<%@taglib prefix="display" uri="http://displaytag.sf.net"%>

<style>body{margin:2em}.list-item{padding-bottom:.25em}.list-remove{display:none}</style>

<form:form action="moderator/edit.do" modelAttribute="form" method="POST">

	<form:hidden path="optionId" />

	<form:label path="rate">
	<spring:message code="bet.rate" />:
	</form:label>
	<form:input path="rate" />
	<form:errors cssClass="error" path="rate" />
	<br />
	
	<input type="submit" name="save"
		value="<spring:message code="bet.save" />" />&nbsp; 
	<br />

</form:form>
<br>