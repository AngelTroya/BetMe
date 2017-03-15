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
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<script type="text/javascript">
	function imgError(image){
		image.onerror = "";
		image.src = "images/defecto.jpg";
		return true;
	}
	
	$(function(){
		$("#depositMoney").click(function(){
			$(window).attr('location', 'money/deposit.do?userId=${user.id}');
		});
	});
	
	$(function(){
		$("#withdrawMoney").click(function(){
			$(window).attr('location', 'money/withdraw.do?userId=${user.id}');
		});
	});
	
	$(function(){
		$("#edit").click(function(){
			$(window).attr('location', 'user/editdetails.do');
		});
	});
	
	$(function(){
		$("#showActive").click(function(){
			$(window).attr('location', 'gamble/showactive.do');
		});
	});
	
	$(function(){
		$("#showPast").click(function(){
			$(window).attr('location', 'gamble/showpast.do');
		});
	});
	
	$(function(){
		$("#showProposed").click(function(){
			$(window).attr('location', 'bet/myProposedBets.do?');
		});
	});
	
	$(function(){
		$("#delete").click(function(){
			var confirm = confirmDelete();
			if(confirm){
				$(window).attr('location', 'user/delete.do');	
			}			
		});
	});
	
	function confirmDelete(){
		return confirm("Desea eliminar?");
	}
</script>

<div class="modal fade" id="uploadModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
        <h4 class="modal-title" id="myModalLabel"><spring:message code="user.upload" /></h4>
      </div>
      <div class="modal-body">
        <form:form action="user/uploadPhoto.do" method="POST" enctype="multipart/form-data" modelAttribute="uploadForm">
			<form:label path="fileData" for="fileData">
				<spring:message code="user.image" />:
			</form:label> <br />
			<form:input path="fileData" type="file" id="image" />
			<div class="modal-footer">
       			<button type="button" class="btn btn-default" data-dismiss="modal"><spring:message code="security.close" /></button>
        		<button id="submitbutton" type="submit" class="btn btn-primary"><spring:message code="security.addImage" /></button>
      		</div>
		</form:form>
      </div>      
    </div>
  </div>
</div>

<div class="modal fade" id="changePassModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
        <h4 class="modal-title" id="myModalLabel"><spring:message code="user.changePass" /></h4>
      </div>
      <div class="modal-body">
        <form:form action="user/changePass.do" method="POST" modelAttribute="changePassForm" class="form-horizontal">
        	<div class="form-group">
        		<form:label path="oldPass" for="oldPass" class="control-label">
					<spring:message code="user.oldPass" />:
				</form:label> <br />
				<form:input path="oldPass" type="password" class="form-control" />
        	</div>
			<div class="form-group">
				<form:label path="newPass1" for="newPass1" class="control-label">
					<spring:message code="user.newPass1" />:
				</form:label> <br />
				<form:input path="newPass1" type="password" class="form-control" />
			</div>
			<div class="form-group">
				<form:label path="newPass2" for="newPass2" class="control-label">
					<spring:message code="user.newPass2" />:
				</form:label> <br />
				<form:input path="newPass2" type="password" class="form-control" />
			</div>
			
			<div class="modal-footer">
       			<button type="button" class="btn btn-default" data-dismiss="modal"><spring:message code="security.close" /></button>
        		<button type="submit" class="btn btn-primary"><spring:message code="user.changePass" /></button>
      		</div>
		</form:form>
      </div>      
    </div>
  </div>
</div>

<aside class="profile">
	<section>
		<img src="${pageContext.request.contextPath}/user/streamPhoto.do?user=${user.id}"
			class="img-responsive img-thumbnail center-block"
			alt = "Fallo en la imagen"
			onerror="imgError(this);" />
	</section>
	<section>
		<div class="profileButtons">
			<button type="button" class="btn btn-default profile" data-toggle="modal" data-target="#uploadModal"><spring:message code="user.upload" />&nbsp;&nbsp;<span class="glyphicon glyphicon-camera"></span></button>
		</div>
		<div class="profileButtons" style="padding-top: 10px;">
			<div class="progress" style="height: 34px;vertical-align: middle;">
				<div class="progress-bar progress-bar-success" role="progressbar" aria-valuenow="${user.karma}" aria-valuemin="0" aria-valuemax="20" style="width:${user.karma * 5}%;padding-top:7px;">
					<fmt:formatNumber maxFractionDigits="2" value="${user.karma}" />
				</div>
			</div>
		</div>
		<div class="profileButtons">
			<button id="depositMoney" type="button" class="btn btn-default profile"><spring:message code="money.deposit" />&nbsp;&nbsp;<span class="glyphicon glyphicon-plus"></span></button>
		</div>
		<div class="profileButtons">
			<button id="withdrawMoney" type="button" class="btn btn-default profile"><spring:message code="money.withdraw" />&nbsp;&nbsp;<span class="glyphicon glyphicon-minus"></span></button>
		</div>
		<div class="profileButtons">
			<button id="edit" type="button" class="btn btn-default profile"><spring:message code="user.edit" />&nbsp;&nbsp;<span class="glyphicon glyphicon-pencil"></span></button>
		</div>
		<div class="profileButtons">
			<button id="changePassword" type="button" class="btn btn-default profile" data-toggle="modal" data-target="#changePassModal"><spring:message code="user.changePass" />&nbsp;&nbsp;<span class="glyphicon glyphicon-certificate"></span></button>
		</div>
		<div class="profileButtons">
			<button id="delete" type="button" class="btn btn-default profile"><spring:message code="master.page.user.delete" />&nbsp;&nbsp;<span class="glyphicon glyphicon-trash"></span></button>
		</div>
	</section>
</aside>
<section class="profile">
<form class="form-horizontal">
	<div class="form-account">
	<div class="form-group">
		<label class="col-sm-2 control-label"><spring:message code="security.register.username" />: </label>
		<div class="col-sm-6">
			<p class="form-control-static">${user.userAccount.username}</p>
		</div>
	</div>
	<div class="form-group">
		<label class="col-sm-2 control-label"><spring:message code="security.register.pass" />: </label>
		<div class="col-sm-6">
			<p class="form-control-static">**********</p>
		</div>
	</div>
	<div class="form-group">
		<label class="col-sm-2 control-label"><spring:message code="user.money" />: </label>
		<div class="col-sm-6">
			<p class="form-control-static">${user.money}  <span class="glyphicon glyphicon-euro"></span></p>
		</div>
	</div>
	</div>
	<div class="form-account">
	<div class="form-group">
		<label class="col-sm-2 control-label"><spring:message code="user.name" />: </label>
		<div class="col-sm-6">
			<p class="form-control-static">${user.name}</p>
		</div>
	</div>
	<div class="form-group">
		<label class="col-sm-2 control-label"><spring:message code="user.surname" />: </label>
		<div class="col-sm-6">
			<p class="form-control-static">${user.surname}</p>
		</div>
	</div>
	<div class="form-group">
		<label class="col-sm-2 control-label"><spring:message code="user.email" />: </label>
		<div class="col-sm-6">
			<p class="form-control-static">${user.email}</p>
		</div>
	</div>
	<div class="form-group">
		<label class="col-sm-2 control-label"><spring:message code="user.dateOfBirth" />: </label>
		<div class="col-sm-6">
			<p class="form-control-static">
				<fmt:formatDate value="${user.dateOfBirth}" type="date" pattern="dd/MM/yyyy"/>
			</p>
		</div>
	</div>
	<div class="form-group">
		<label class="col-sm-2 control-label"><spring:message code="user.phone" />: </label>
		<div class="col-sm-6">
			<p class="form-control-static">${user.phone}</p>
		</div>
	</div>
	<div class="form-group">
		<label class="col-sm-2 control-label"><spring:message code="user.sex" />: </label>
		<div class="col-sm-6">
			<c:if test="${user.sex eq 0}">
				<p class="form-control-static"><spring:message code="user.male" /></p>
			</c:if>
			<c:if test="${user.sex eq 1}">
				<p class="form-control-static"><spring:message code="user.female" /></p>
			</c:if>
		</div>
	</div>
	<div class="form-group">
		<label class="col-sm-2 control-label"><spring:message code="user.address" />: </label>
		<div class="col-sm-6">
			<p class="form-control-static">${user.address}</p>
		</div>
	</div>
	<div class="form-group">
		<label class="col-sm-2 control-label"><spring:message code="security.register.city" />: </label>
		<div class="col-sm-6">
			<p class="form-control-static">${user.city}</p>
		</div>
	</div>
	<div class="form-group">
		<label class="col-sm-2 control-label"><spring:message code="security.register.cp" />: </label>
		<div class="col-sm-6">
			<p class="form-control-static">${user.zipCode}</p>
		</div>
	</div>
	<div class="form-group">
		<label class="col-sm-2 control-label"><spring:message code="security.register.province" />: </label>
		<div class="col-sm-6">
			<p class="form-control-static">${user.province}</p>
		</div>
	</div>
	</div>
</form>
</section>
<div class="pull-right" style="display:inline-block;width:18%;">
	<section>
		<div class="profileButtons">
			<button id="showActive" type="button" class="btn btn-default profile"><spring:message code="master.page.user.showactive" />&nbsp;&nbsp;<span class="glyphicon glyphicon-play"></span></button>
		</div>
		<div class="profileButtons">
			<button id="showPast" type="button" class="btn btn-default profile"><spring:message code="master.page.user.showpast" />&nbsp;&nbsp;<span class="glyphicon glyphicon-stop"></span></button>
		</div>
		<div class="profileButtons">
			<button id="showProposed" type="button" class="btn btn-default profile"><spring:message code="master.page.user.showProposed" />&nbsp;&nbsp;<span class="glyphicon glyphicon-pause"></span></button>
		</div>
	</section>
</div>

<div class="clearfix"></div>
