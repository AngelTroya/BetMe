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

<form:form id="reportForm" action="user/report.do" modelAttribute="form">

	<form:hidden path="betId" />
	<form:hidden path="userId" />
	
	<form:label path="type">
		<spring:message code="moderator.type" />:
	</form:label>
	<form:select path="type">
		<form:option value="0">
			<spring:message code="moderator.irrelevant" />
		</form:option>
		<form:option value="1">
			<spring:message code="moderator.old" />
		</form:option>
		<form:option value="2">
			<spring:message code="moderator.tedious" />
		</form:option>
		<form:option value="3">
			<spring:message code="moderator.spam" />
		</form:option>
		<form:option value="4">
			<spring:message code="moderator.illegal" />
		</form:option>
		<form:option value="5">
			<spring:message code="moderator.duplicate" />
		</form:option>
		<form:option value="6">
			<spring:message code="moderator.wrong" />
		</form:option>
	</form:select>
	<form:errors cssClass="error" path="type" />
	<br />

	<form:label path="text">
	<spring:message code="bet.text" />:
	</form:label>
	<form:textarea path="text" rows="10" cols="40" type="text" id="text" name="text" />
	<form:errors cssClass="error" path="text" />
	<br />
	
	<div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
        <input id="reportSubmit" name="save" type="submit" class="btn btn-primary" value="<spring:message code="bet.report" />" />
    </div>

</form:form>

