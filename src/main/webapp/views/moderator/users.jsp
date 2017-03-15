<%--
 * action-1.jsp
 *
 * Copyright (C) 2014 Paperbet S.A.
 --%>

<%@page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="jstl"	uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@taglib prefix="security" uri="http://www.springframework.org/security/tags"%>
<%@taglib prefix="display" uri="http://displaytag.sf.net"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<jstl:if test="${disable == true}">
		<div class="alert alert-success">
			<button type="button" class="close" data-dismiss="alert">&times;</button>
			<spring:message code="moderator.disable.ok" />
		</div>
</jstl:if>

<jstl:if test="${disable == false}">
		<div class="alert alert-danger">
			<button type="button" class="close" data-dismiss="alert">&times;</button>
			<spring:message code="moderator.disable.error" />
		</div>
</jstl:if>

<jstl:if test="${active == true}">
		<div class="alert alert-success">
			<button type="button" class="close" data-dismiss="alert">&times;</button>
			<spring:message code="moderator.active.ok" />
		</div>
</jstl:if>

<jstl:if test="${active == false}">
		<div class="alert alert-danger">
			<button type="button" class="close" data-dismiss="alert">&times;</button>
			<spring:message code="moderator.active.error" />
		</div>
</jstl:if>

<display:table name="users" pagesize="10" class="table" requestURI="${requestURI}" id="row">

	<spring:message code="user.name" var="nameHeader" />
	<display:column property="name" title="${nameHeader}" sortable="true" />
	
	<spring:message code="user.surname" var="surnameHeader" />
	<display:column property="surname" title="${surnameHeader}" sortable="true" />
	
	<spring:message code="user.email" var="emailHeader" />
	<display:column property="email" title="${emailHeader}" sortable="true" />
	
	<spring:message code="user.phone" var="phoneHeader" />
	<display:column property="phone" title="${phoneHeader}" sortable="true" />
	
	<spring:message code="user.karma" var="karmaHeader" />
	<display:column property="karma" title="${karmaHeader}" />

	<spring:message code="user.money" var="moneyHeader" />
	<display:column property="money" title="${moneyHeader}" sortable="true" />
	
	<spring:message code="moderator.reported" var="isReportedHeader" />
	<display:column property="isReported" title="${isReportedHeader}" sortable="true" />
	
	<spring:message code="moderator.ban" var="ban" />
	<display:column sortable="false">
	<c:if test="${row.isReported && row.userAccount.active}">
		<a href="moderator/disableUser.do?userId=${row.id}" >
			${ban}
		</a>
	</c:if>
	</display:column>
	
	<spring:message code="moderator.active" var="active" />
	<display:column sortable="false">
	<c:if test="${!row.userAccount.active}">
		<a href="moderator/activeUser.do?userId=${row.id}" >
			${active}
		</a>
	</c:if>
	</display:column>
	
	<spring:message code="moderator.deposit" var="deposit" />
	<display:column sortable="false">
		<a href="moderator/deposit.do?userId=${row.id}" >
			${deposit}
		</a>
	</display:column>
	
	<spring:message code="moderator.withdraw" var="withdraw" />
	<display:column sortable="false">
		<a href="moderator/withdraw.do?userId=${row.id}" >
			${withdraw}
		</a>
	</display:column>

</display:table>