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

<script type="text/javascript">
	(function($) {
    	$(document).ready(function() {
        	$("#example1").dynamiclist({
        		minSize:2,
        		maxSize:15
        	});
    	});
	 })(jQuery);
	$(function() {
		$('#endingDate').datepicker(
				{
					firstDay : 1,
					monthNames : [ 'Enero', 'Febrero', 'Marzo', 'Abril',
							'Mayo', 'Junio', 'Julio', 'Agosto', 'Septiembre',
							'Octubre', 'Noviembre', 'Diciembre' ],
					monthNamesShort : [ 'Ene', 'Feb', 'Mar', 'Abr', 'May',
							'Jun', 'Jul', 'Ago', 'Sep', 'Oct', 'Nov', 'Dic' ],
					dayNames : [ 'Domingo', 'Lunes', 'Martes', 'Miércoles',
							'Jueves', 'Viernes', 'Sábado' ],
					dayNamesShort : [ 'Dom', 'Lun', 'Mar', 'Mie;', 'Juv',
							'Vie', 'Sab' ],
					dayNamesMin : [ 'Do', 'Lu', 'Ma', 'Mi', 'Ju', 'Vi', 'Sa' ],
					currentText : 'Ahora',
					closeText : 'Aceptar',
					timeText : 'Fecha',
					hourText : 'Hora',
					dateFormat : 'dd/mm/yy',
					changeMonth : true,
					changeYear : true
				});
	});

	function mostrarOculto() {
		var selected = document.getElementById("type").value;
		var div = document.getElementById("minmax");
		if (selected == 1) {
			div.style.display = 'block';
		} else {
			div.style.display = 'none';
		}
	}
</script>

<form:form action="bet/edit.do" modelAttribute="form" method="POST">

	<form:hidden path="betId" />
	
	<form:label path="type">
		<spring:message code="bet.type" />:
	</form:label>
	<form:select path="type" id="type" name="type" onchange="mostrarOculto()">
		<form:option value="2">
			----
		</form:option>
		<form:option value="0">
			<spring:message code="bet.against" />
		</form:option>
		<form:option value="1">
			<spring:message code="bet.winwin" />
		</form:option>
	</form:select>
	<form:errors cssClass="error" path="type" />
	<br />

	<form:label path="name">
		<spring:message code="bet.name" />:
	</form:label>
	<form:input path="name" type="text" id="name" name="name" />
	<form:errors cssClass="error" path="name" />
	<br />

	<form:label path="description">
		<spring:message code="bet.description" />:
	</form:label>
	<form:input path="description" type="text" id="description"
		name="description" />
	<form:errors cssClass="error" path="description" />
	<br />

	<form:label path="endingDate">
		<spring:message code="bet.endDate" />:
	</form:label>
	<form:input type="text" id="endingDate" name="endingDate"
		path="endingDate" />
	<form:errors cssClass="error" path="endingDate" />
	<br />

	<form:label path="category">
		<spring:message code="bet.category" />:
	</form:label>
	<form:select path="category">
		<form:option value="0">
			<spring:message code="bet.sport" />
		</form:option>
		<form:option value="1">
			<spring:message code="bet.chance" />
		</form:option>
		<form:option value="2">
			<spring:message code="bet.contest" />
		</form:option>
		<form:option value="3">
			<spring:message code="bet.egames" />
		</form:option>
		<form:option value="4">
			<spring:message code="bet.others" />
		</form:option>
	</form:select>
	<form:errors cssClass="error" path="category" />
	<br />

	<div id="minmax" style="display: none">
		<form:label path="max">
			<spring:message code="bet.betmax" />:
		</form:label>
		<form:input path="max" />
		<form:errors cssClass="error" path="max" />
		<br />
		<form:label path="min">
			<spring:message code="bet.betmin" />:
		</form:label>
		<form:input path="min" />
		<form:errors cssClass="error" path="min" />
		<br />
	</div>
	
	<br />
	<br />
	<spring:message code="bet.advise" />
	<br />	
	
	<fieldset>
		<legend>
			<spring:message code="bet.fieldset" />
		</legend>
		<div class="control-group">
        	<label class="control-label">Option List</label>
			<div id="example1" class="controls">
				<div class="list-item">
					<c:forEach var="option" items="${form.options}" varStatus="status">
						<form:label class="control-group" path="options[${status}].name">
							<spring:message code="bet.optionName" />:
						</form:label>
						<form:input path="options[0].name"/>
						<form:errors path="options[0].name" cssClass="error" />
						<form:label path="options[0].rate">
							<spring:message code="bet.optionRate" />:
						</form:label>
						<form:input path="options[0].rate" />
						<form:errors cssClass="error" path="options[0].rate" />
						<form:hidden path="options[0].correct" />
						<form:hidden path="options[0].nGambles"/>
						<a href="#" class="list-remove btn btn-small"><i class="icon-minus"></i><spring:message code="bet.removeOption" /></a>
						<br />
					</c:forEach>
				</div>
				<a href="#" class="list-add btn btn-small"><i class="icon-plus"></i><spring:message code="bet.addOption" /></a>
			</div>
		</div>
	</fieldset>
	<br />
	
	<input type="submit" name="save"
		value="<spring:message code="bet.save" />" />&nbsp; 
	<input type="button" name="cancel"
		value="<spring:message code="bet.cancel" />"
		onclick="javascript: window.location.replace('bet/showBets.do');" />
	<br />

</form:form>
<br>