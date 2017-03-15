<%@page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@taglib prefix="security"	uri="http://www.springframework.org/security/tags"%>
<%@taglib prefix="display" uri="http://displaytag.sf.net"%>
<%@taglib prefix="jstl"	uri="http://java.sun.com/jsp/jstl/core"%>

<script type="text/javascript">
	
	$(function(){
		$("#editBet").click(function(){
			var betId = $("#betid").val();
			$(window).attr('location', "bet/edit.do?betId="+betId);
		});
	});
	
</script>

<jstl:if test="${edited == true}">
		<div class="alert alert-success">
			<button type="button" class="close" data-dismiss="alert">&times;</button>
			<spring:message code="moderator.edited.ok" />
		</div>
</jstl:if>

<jstl:if test="${edited == false}">
		<div class="alert alert-danger">
			<button type="button" class="close" data-dismiss="alert">&times;</button>
			<spring:message code="moderator.edited.error" />
		</div>
</jstl:if>

<display:table name="bet" class="table" id="bet">

	<spring:message code="bet.status" var="statusHeader" />
	<c:if test="${bet.status == 0}">
		<display:column title="${statusHeader}" sortable="true">
			<spring:message code="bet.proposed" />
		</display:column>
	</c:if>
	<c:if test="${bet.status == 1}">
		<display:column title="${statusHeader}" sortable="true">
			<spring:message code="bet.pending" />
		</display:column>
	</c:if>
	<c:if test="${bet.status == 2}">
		<display:column title="${statusHeader}" sortable="true">
			<spring:message code="bet.accepted" />
		</display:column>
	</c:if>
	<c:if test="${bet.status == 3}">
		<display:column title="${statusHeader}" sortable="true">
			<spring:message code="bet.rejected" />
		</display:column>
	</c:if>
	
	<spring:message code="bet.name" var="nameHeader" />
	<display:column property="name" title="${nameHeader}" sortable="true" />
	
	<spring:message code="bet.description" var="descriptionHeader" />
	<display:column property="description" title="${descriptionHeader}" sortable="true" />
	
	<spring:message code="bet.category" var="categoryHeader" />
	<c:if test="${bet.category == 0}">
		<display:column title="${categoryHeader}" sortable="true">
			<spring:message code="bet.sport" />
		</display:column>
	</c:if>
	<c:if test="${bet.category == 1}">
		<display:column title="${categoryHeader}" sortable="true">
			<spring:message code="bet.chance" />
		</display:column>
	</c:if>
	<c:if test="${bet.category == 2}">
		<display:column title="${categoryHeader}" sortable="true">
			<spring:message code="bet.contest" />
		</display:column>
	</c:if>
	<c:if test="${bet.category == 3}">
		<display:column title="${categoryHeader}" sortable="true">
			<spring:message code="bet.egames" />
		</display:column>
	</c:if>
	<c:if test="${bet.category == 4}">
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

</display:table>

<div>
	<div>
		<input type="hidden" id="betid" value="${bet.id}" />
		<button id="editBet" type="button" class="btn" <c:if test="${bet.status == 2}"> disabled="disabled"</c:if>>
			 <spring:message code="moderator.bet" />
		</button> 
	</div>
</div>

<display:table name="options" class="table" id="row">

	<spring:message code="bet.optionName" var="optionHeader" />
	<display:column property="name" title="${optionHeader}" sortable="true" />
	
	<spring:message code="bet.rate" var="rateHeader" />
	<display:column property="rate" title="${rateHeader}" sortable="true" />
	
	<spring:message code="bet.nGambles" var="nGamblesHeader" />
	<display:column property="nGambles" title="${nGamblesHeader}" sortable="true" />
	
	<spring:message code="bet.edit" var="edit" />
	<display:column title="${edit}" sortable="false">
		<a href="moderator/edit.do?optionId=${row.id}" >
			${edit}
		</a>
	</display:column>

</display:table>

<display:table name="comments" class="table" id="row">

	<spring:message code="bet.user" var="userHeader" />
	<display:column property="user.name" title="${userHeader}" sortable="true" />
	
	<spring:message code="bet.text" var="textHeader" />
	<display:column property="text" title="${textHeader}" sortable="false" />
	
	<spring:message code="bet.positiveVotes" var="posVotesHeader" />
	<display:column property="positiveVotes" title="${posVotesHeader}" sortable="true" />
	
	<spring:message code="bet.negativeVotes" var="negVotesHeader" />
	<display:column property="negativeVotes" title="${negVotesHeader}" sortable="true" />
	
	<spring:message code="bet.delete" var="deleteComment" />
	<display:column title="${deleteComment}" sortable="false">
		<a href="moderator/deleteComment.do?commentId=${row.id}" >
			${deleteComment}
		</a>
	</display:column>

</display:table>