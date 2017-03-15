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

<script type="text/javascript">
	$(function() {
		$('#dateOfBirth').datepicker(
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
					changeYear : true,
					yearRange : "1940:-18",
					maxDate : "-18y",
					minDate : "-80y"
				});
	});

	function imgError(image) {
		image.onerror = "";
		image.src = "images/defecto.jpg";
		return true;
	}
</script>

<form:form action="user/editdetails.do" modelAttribute="user"
	class="form-horizontal">

	<div style="width: 100%; margin: 25px;">
		<form:hidden path="id" />
		<form:hidden path="version" />
		<form:hidden path="userAccount" />
		<form:hidden path="karma" />
		<form:hidden path="money" />
		<form:hidden path="votes" />
		<form:hidden path="image" />

		<div class="form-group">
			<form:label class="col-sm-3 control-label" path="name">
				<spring:message code="user.name" />:
			</form:label>
			<form:input path="name" />
			<form:errors cssClass="error" path="name" />
			<br />
		</div>
		<div class="form-group">
			<form:label class="col-sm-3 control-label" path="surname">
				<spring:message code="user.surname" />:
			</form:label>
			<form:input path="surname" />
			<form:errors cssClass="error" path="surname" />
			<br />
		</div>
		<div class="form-group">
			<form:label class="col-sm-3 control-label" path="email">
				<spring:message code="user.email" />:
			</form:label>
			<form:input path="email" />
			<form:errors cssClass="error" path="email" />
			<br />
		</div>
		<div class="form-group">
			<form:label class="col-sm-3 control-label" path="phone">
				<spring:message code="user.phone" />:
			</form:label>
			<form:input path="phone" />
			<form:errors cssClass="error" path="phone" />
			<br />
		</div>
		<div class="form-group">
			<form:label class="col-sm-3 control-label" path="address">
				<spring:message code="user.address" />:
			</form:label>
			<form:input path="address" />
			<form:errors cssClass="error" path="address" />
			<br />
		</div>
		<div class="form-group">
			<form:label class="col-sm-3 control-label" path="dateOfBirth">
				<spring:message code="user.dateOfBirth" />:
			</form:label>
			<form:input path="dateOfBirth" />
			<form:errors cssClass="error" path="dateOfBirth" />
			<br />
		</div>
		<div class="form-group">
			<form:label class="col-sm-3 control-label" path="zipCode">
				<spring:message code="user.zipCode" />:
			</form:label>
			<form:input path="zipCode" />
			<form:errors cssClass="error" path="zipCode" />
			<br />
		</div>
		<div class="form-group">
			<form:label class="col-sm-3 control-label" path="dni">
				<spring:message code="user.dni" />:
			</form:label>
			<form:input path="dni" />
			<form:errors cssClass="error" path="dni" />
			<br />
		</div>
		<div class="form-group">
			<form:label class="col-sm-3 control-label" path="sex">
				<spring:message code="user.sex" />:
			</form:label>
			<form:select path="sex">
				<form:option value="0">
					<spring:message code="user.male" />
				</form:option>
				<form:option value="1">
					<spring:message code="user.female" />
				</form:option>
			</form:select>
			<form:errors cssClass="error" path="sex" />
			<br />
		</div>
		<div class="form-group">
			<form:label class="col-sm-3 control-label" path="province">
				<spring:message code="user.province" />:
			</form:label>
			<form:input path="province" />
			<form:errors cssClass="error" path="province" />
			<br />
		</div>

		<input class="btn btn-default" type="submit" name="save"
			value="<spring:message code="user.save" />" />&nbsp; <input
			class="btn btn-default" type="button" name="cancel"
			value="<spring:message code="user.cancel" />"
			onclick="javascript: window.location.replace('user/showdetails.do');" />
		<br />
	</div>
</form:form>