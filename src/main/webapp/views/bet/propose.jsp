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
	
	$(function(){
		$("#li-propose").attr('class', 'active');
	});
</script>

<form:form action="bet/propose.do" modelAttribute="form" method="POST" class="form-horizontal" role="form">
<div style="display:block;width:inherit; margin-left:25px;margin-right:25px;">
<div style="width:50%;display:inline-block;float:left;padding-right:5px;">
	<fieldset>
		<legend><spring:message code="bet.details" /></legend>
		<form:label path="type" class="control-label">
			<spring:message code="bet.type" />:
		</form:label>
		<form:select path="type" id="type" name="type" class="form-control" onchange="mostrarOculto()">
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
		
		<form:label path="name" class="control-label">
			<spring:message code="bet.name" />:
		</form:label>
		<form:input path="name" type="text" id="name" name="name" class="form-control" />
		<form:errors cssClass="error" path="name" />		
	
		<form:label path="description" class="control-label">
			<spring:message code="bet.description" />:
		</form:label>
		<form:textarea path="description" class="form-control" type="text" id="description"	name="description" rows="4" />
		<form:errors cssClass="error" path="description" />

		<form:label path="endingDate" class="control-label">
			<spring:message code="bet.endDate" />:
		</form:label>
		<form:input type="text" class="form-control" id="endingDate" name="endingDate" path="endingDate" />
		<form:errors cssClass="error" path="endingDate" />

		<form:label path="category" class="control-label">
			<spring:message code="bet.category" />:
		</form:label>
		<form:select path="category" class="form-control">
			<form:option value="">
				----
			</form:option>
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
	
		<div id="minmax" style="display: none">

			<form:label path="max" class="control-label">
				<spring:message code="bet.betmax" />:
			</form:label>
			<form:input path="max" class="form-control" />
			<form:errors cssClass="error" path="max" />

			<form:label path="min" class="control-label">
				<spring:message code="bet.betmin" />:
			</form:label>
			<form:input path="min" class="form-control" />
			<form:errors cssClass="error" path="min" />
		</div>
	</fieldset>
</div>	
<div style="display:inline-block;width:50%;padding-left:5px;">
	<fieldset>
		<legend>
			<spring:message code="bet.fieldset" />
		</legend>
		<div class="alert alert-danger" style="text-align: center;">
			<spring:message code="bet.advise" />
		</div>
		<div class="control-group">
			<div id="example1" class="controls">
				<div class="list-item">
					<div class="form-group">
					<form:label class="col-sm-2 control-label" path="options[0].name">
						<spring:message code="bet.optionName" />:
					</form:label>
					<div class="col-sm-10">
						<form:input path="options[0].name" class="form-control" />
					</div>
					<form:errors path="options[0].name" cssClass="error" />
					<form:label path="options[0].rate" class="col-sm-2 control-label">
						<spring:message code="bet.optionRate" />:
					</form:label>
					<div class="col-sm-10" style="margin-top: 5px;margin-bottom:5px;">
						<form:input path="options[0].rate" class="form-control"/>
					</div>
					<form:errors cssClass="error" path="options[0].rate" />
					<form:hidden path="options[0].correct" value="false" />
					<form:hidden path="options[0].nGambles" value="0" />
					<a href="#" class="pull-right list-remove btn btn-default btn-sm" style="margin-right:25px;"><i class="glyphicon glyphicon-minus"></i>  <spring:message code="bet.removeOption" /></a>
					<br />
					</div>
				</div>
				<a href="#" class="pull-right list-add btn btn-default btn-sm" style="margin-right:25px;"><i class="glyphicon glyphicon-plus"></i>  <spring:message code="bet.addOption" /></a>
			</div>
		</div>
		
		
	</fieldset>
	<br />
	<input type="submit" name="save" value="<spring:message code="bet.save" />" class="pull-right btn btn-default" />
</div>
</div>
</form:form>
<div class="clearfix"></div>