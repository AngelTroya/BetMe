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

<jstl:if test="${rejected == true}">
		<div class="alert alert-success">
			<button type="button" class="close" data-dismiss="alert">&times;</button>
			<spring:message code="moderator.rejected.ok" />
		</div>
</jstl:if>

<jstl:if test="${rejected == false}">
		<div class="alert alert-danger">
			<button type="button" class="close" data-dismiss="alert">&times;</button>
			<spring:message code="moderator.rejected.error" />
		</div>
</jstl:if>

<jstl:if test="${pending == true}">
		<div class="alert alert-success">
			<button type="button" class="close" data-dismiss="alert">&times;</button>
			<spring:message code="moderator.pending.ok" />
		</div>
</jstl:if>

<jstl:if test="${pending == false}">
		<div class="alert alert-danger">
			<button type="button" class="close" data-dismiss="alert">&times;</button>
			<spring:message code="moderator.pending.error" />
		</div>
</jstl:if>

<display:table name="bets" pagesize="10" class="table" requestURI="${requestURI}" id="row">
	
	<spring:message code="bet.status" var="statusHeader" />
	<c:if test="${row.status == 0}">
		<display:column title="${statusHeader}" sortable="true">
			<spring:message code="bet.proposed" />
		</display:column>
	</c:if>
	<c:if test="${row.status == 1}">
		<display:column title="${statusHeader}" sortable="true">
			<spring:message code="bet.pending" />
		</display:column>
	</c:if>
	<c:if test="${row.status == 2}">
		<display:column title="${statusHeader}" sortable="true">
			<spring:message code="bet.accepted" />
		</display:column>
	</c:if>
	<c:if test="${row.status == 3}">
		<display:column title="${statusHeader}" sortable="true">
			<spring:message code="bet.rejected" />
		</display:column>
	</c:if>
	
	<spring:message code="bet.name" var="nameHeader" />
	<display:column property="name" title="${nameHeader}" sortable="true" />
	
	<spring:message code="bet.description" var="descriptionHeader" />
	<display:column property="description" title="${descriptionHeader}" sortable="true" />
	
	<spring:message code="bet.category" var="categoryHeader" />
	<c:if test="${row.category == 0}">
		<display:column title="${categoryHeader}" sortable="true">
			<spring:message code="bet.sport" />
		</display:column>
	</c:if>
	<c:if test="${row.category == 1}">
		<display:column title="${categoryHeader}" sortable="true">
			<spring:message code="bet.chance" />
		</display:column>
	</c:if>
	<c:if test="${row.category == 2}">
		<display:column title="${categoryHeader}" sortable="true">
			<spring:message code="bet.contest" />
		</display:column>
	</c:if>
	<c:if test="${row.category == 3}">
		<display:column title="${categoryHeader}" sortable="true">
			<spring:message code="bet.egames" />
		</display:column>
	</c:if>
	<c:if test="${row.category == 4}">
		<display:column title="${categoryHeader}" sortable="true">
			<spring:message code="bet.others" />
		</display:column>
	</c:if>
	
	<spring:message code="bet.positiveVotes" var="posVotesHeader" />
	<display:column property="positiveVotes" title="${posVotesHeader}" sortable="true" />
	
	<spring:message code="bet.negativeVotes" var="negVotesHeader" />
	<display:column property="negativeVotes" title="${negVotesHeader}" sortable="true" />

	<spring:message code="bet.startDate" var="betStartDateHeader" />
	<display:column property="startDate" title="${betStartDateHeader}" sortable="true" format="{0,date,dd/MM/yyyy HH:mm}" />
	
	<spring:message code="bet.endDate" var="betEndDateHeader" />
	<display:column property="endingDate" title="${betEndDateHeader}" sortable="true" format="{0,date,dd/MM/yyyy HH:mm}" />
	
	<spring:message code="bet.details" var="details" />
	<display:column sortable="false">
		<a href="moderator/detailsProposed.do?betId=${row.id}" >
			${details}
		</a>
	</display:column>
	
	<spring:message code="moderator.accept" var="action" />
	<display:column sortable="false">
		<a href="moderator/accept2.do?betId=${row.id}" >
			${action}
		</a>
	</display:column>
	
	<spring:message code="moderator.reject" var="action" />
	<display:column sortable="false">
		<a href="moderator/reject2.do?betId=${row.id}" >
			${action}
		</a>
	</display:column>

</display:table>