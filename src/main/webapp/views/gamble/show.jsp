<%@page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@taglib prefix="security"	uri="http://www.springframework.org/security/tags"%>
<%@taglib prefix="display" uri="http://displaytag.sf.net"%>

<!-- Listing grid -->

<display:table name="gambles" pagesize="15" class="table table-hover"
	requestURI="${requestURI}" id="row">
	
	<spring:message code="gamble.bet" var="betHeader" />
	<display:column property="bet.name" title="${betHeader}" sortable="true" />
	
	<spring:message code="gamble.betOption" var="betOptionHeader" />
	<display:column property="betOption.name" title="${betOptionHeader}" sortable="true" />
	
	<spring:message code="gamble.amount" var="amountHeader" />
	<display:column property="amount" title="${amountHeader}" sortable="true" />
	
	<spring:message code="gamble.rate" var="rateHeader" />
	<display:column property="rate" title="${rateHeader}" sortable="true" />

	<spring:message code="gamble.betEndingDate" var="betHeader" />
	<display:column property="bet.endingDate" title="${betHeader}" sortable="true" format="{0,date,dd/MM/yyyy HH:mm}" />

</display:table>