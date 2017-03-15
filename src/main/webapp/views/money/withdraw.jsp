<%--
 * action-1.jsp
 *
 * Copyright (C) 2014 Paperbet S.A.
 --%>

<%@page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@taglib prefix="security" uri="http://www.springframework.org/security/tags"%>
<%@taglib prefix="display" uri="http://displaytag.sf.net"%>

<security:authorize access="hasRole('MODERATOR')">
<form:form action="moderator/withdraw.do" modelAttribute="user">

	<form:hidden path="id" />
	<form:hidden path="version" />
	<form:hidden path="name" />
	<form:hidden path="surname" />
	<form:hidden path="email" />
	<form:hidden path="phone" />
	<form:hidden path="address" />
	<form:hidden path="dateOfBirth" />
	<form:hidden path="zipCode" />
	<form:hidden path="dni" />
	<form:hidden path="sex" />
	<form:hidden path="province" />
	<form:hidden path="karma" />
	<form:hidden path="image" />
	<form:hidden path="votes" />
	<form:hidden path="userAccount" />
	<form:hidden path="isReported"/>
	<form:hidden path="city"/>

	<form:label path="money">
	<spring:message code="money.money" />:
	</form:label>
	<form:input path="money"/>
	<form:errors cssClass="error" path="money" />
	<br />
	
	<input class="btn btn-default" type="submit" name="save"
		value="<spring:message code="money.withdraw" />" />&nbsp; 
	<input class="btn btn-default" type="button" name="cancel"
		value="<spring:message code="money.cancel" />"
		onclick="javascript: window.location.replace('money/wallet.do');" />
	<br />

</form:form>
</security:authorize>

<security:authorize access="hasRole('CUSTOMER')">
<spring:message code="money.withinfo" />
</security:authorize>
