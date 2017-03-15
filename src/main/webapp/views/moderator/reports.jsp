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

<display:table name="betReports" pagesize="10" class="table" requestURI="${requestURI}" id="row">

	<spring:message code="moderator.bet" var="betHeader" />
	<display:column property="bet.name" title="${betHeader}" sortable="true" />
	
	<spring:message code="moderator.type" var="typeHeader" />
	<c:if test="${row.type == 0}">
		<display:column title="${typeHeader}" sortable="true">
			<spring:message code="moderator.irrelevant" />
		</display:column>
	</c:if>
	<c:if test="${row.type == 1}">
		<display:column title="${typeHeader}" sortable="true">
			<spring:message code="moderator.old" />
		</display:column>
	</c:if>
	<c:if test="${row.type == 2}">
		<display:column title="${typeHeader}" sortable="true">
			<spring:message code="moderator.tedious" />
		</display:column>
	</c:if>
	<c:if test="${row.type == 3}">
		<display:column title="${typeHeader}" sortable="true">
			<spring:message code="moderator.spam" />
		</display:column>
	</c:if>
	<c:if test="${row.type == 4}">
		<display:column title="${typeHeader}" sortable="true">
			<spring:message code="moderator.illegal" />
		</display:column>
	</c:if>
	<c:if test="${row.type == 5}">
		<display:column title="${typeHeader}" sortable="true">
			<spring:message code="moderator.duplicate" />
		</display:column>
	</c:if>
	<c:if test="${row.type == 6}">
		<display:column title="${typeHeader}" sortable="true">
			<spring:message code="moderator.wrong" />
		</display:column>
	</c:if>
	
	<spring:message code="bet.text" var="textHeader" />
	<display:column property="text" title="${textHeader}" sortable="false" />

</display:table>

<display:table name="userReports" pagesize="10" class="table" requestURI="${requestURI}" id="row">

	<spring:message code="user.name" var="nameHeader" />
	<display:column property="user.name" title="${nameHeader}" sortable="true" />
	
	<spring:message code="user.surname" var="surnameHeader" />
	<display:column property="user.surname" title="${surnameHeader}" sortable="true" />
	
	<c:if test="${row.type == 0}">
		<display:column title="${typeHeader}" sortable="true">
			<spring:message code="moderator.irrelevant" />
		</display:column>
	</c:if>
	<c:if test="${row.type == 1}">
		<display:column title="${typeHeader}" sortable="true">
			<spring:message code="moderator.old" />
		</display:column>
	</c:if>
	<c:if test="${row.type == 2}">
		<display:column title="${typeHeader}" sortable="true">
			<spring:message code="moderator.tedious" />
		</display:column>
	</c:if>
	<c:if test="${row.type == 3}">
		<display:column title="${typeHeader}" sortable="true">
			<spring:message code="moderator.spam" />
		</display:column>
	</c:if>
	<c:if test="${row.type == 4}">
		<display:column title="${typeHeader}" sortable="true">
			<spring:message code="moderator.illegal" />
		</display:column>
	</c:if>
	<c:if test="${row.type == 5}">
		<display:column title="${typeHeader}" sortable="true">
			<spring:message code="moderator.duplicate" />
		</display:column>
	</c:if>
	<c:if test="${row.type == 6}">
		<display:column title="${typeHeader}" sortable="true">
			<spring:message code="moderator.wrong" />
		</display:column>
	</c:if>
	
	<display:column property="text" title="${textHeader}" sortable="false" />	
	
	<spring:message code="moderator.ban" var="ban" />
	<display:column sortable="false">
	<c:if test="${row.user.isReported && row.user.userAccount.active}">
		<a href="moderator/disableUser.do?userId=${row.user.id}" >
			${ban}
		</a>
	</c:if>
	</display:column>
	
	<spring:message code="moderator.active" var="active" />
	<display:column sortable="false">
	<c:if test="${!row.user.userAccount.active}">
		<a href="moderator/activeUser.do?userId=${row.id}" >
			${active}
		</a>
	</c:if>
	</display:column>

</display:table>