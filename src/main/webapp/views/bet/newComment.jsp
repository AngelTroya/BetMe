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

<form:form action="bet/newComment.do" modelAttribute="form">

	<form:hidden path="idBet" />

	<form:textarea path="text" rows="7" cols="89" type="text" id="text" name="text" />
	<form:errors cssClass="error" path="text" />
	<br />
	
	<div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
        <input id="commentSubmit" name="save" type="submit" class="btn btn-primary" value="<spring:message code="bet.comment" />" />
    </div>

</form:form>

