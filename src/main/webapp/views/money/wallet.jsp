<%--
 * action-1.jsp
 *
 * Copyright (C) 2014 Paperbet S.A.
 --%>

<%@page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>

<%@taglib prefix="jstl"	uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@taglib prefix="security" uri="http://www.springframework.org/security/tags"%>
<%@taglib prefix="display" uri="http://displaytag.sf.net"%>

<form:form modelAttribute="user">

	<form:hidden path="id" />
	<form:hidden path="version" />
	
	<form:label path="money">
	<spring:message code="money.money" />:
	</form:label>
	<form:input path="money" readonly="true"/>
	<form:errors cssClass="error" path="money" />
	<br />
	
	<a class="btn btn-default" href="money/deposit.do?userId=${user.id}">
	<spring:message code="money.deposit" />
	</a>&nbsp;
	<a class="btn btn-default" href="money/withdraw.do?userId=${user.id}">
	<spring:message code="money.withdraw" />
	</a>

</form:form>