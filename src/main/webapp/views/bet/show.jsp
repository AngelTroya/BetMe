<%@page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@taglib prefix="security"	uri="http://www.springframework.org/security/tags"%>
<%@taglib prefix="display" uri="http://displaytag.sf.net"%>

<script type="text/javascript">

	$(function(){
		$("#ajaxResponse").load("bet/searchAjax.do");
	});
	
	$(function(){
		$("#inputSearch").keyup(function(){
			var value = $(this).val();
			if(value.length >= 0){
				var select = $("#cat").val();
				var search = $("#inputSearch").val();
				var proposed = $("#inputProposed").val();
				var p = 1;
				var pageSize = 10;
				var url="bet/searchAjax.do?cat="+select+"&search="+search+"&p="+p+"&ps="+pageSize+"&proposedByUser="+proposed;
				$("#ajaxResponse").load(url);
			}
			if(value.length == 0){
				var select = $("#cat").val();
				var proposed = $("#inputProposed").val();
				var p = 1;
				var pageSize = 10;
				var url="bet/searchAjax.do?cat="+select+"&p="+p+"&ps="+pageSize+"&proposedByUser="+proposed;
				$("#ajaxResponse").load(url);
			}
		});
	});

	function reloadBets(){
		var select = $("#cat").val();
		var search = $("#inputSearch").val();
		var proposed = $("#inputProposed").val();
		var p = 1;
		var pageSize = 10;
		var url = "bet/searchAjax.do?cat="+select+"&search="+search+"&p="+p+"&ps="+pageSize+"&proposedByUser="+proposed;
		$("#ajaxResponse").load(url);
	}
	
	function goToPage(page){
		var select = $("#cat").val();
		var search = $("#inputSearch").val();
		var proposed = $("#inputProposed").val();
		var p = page;
		var pageSize = 10;
		var url = "bet/searchAjax.do?cat="+select+"&search="+search+"&p="+p+"&ps="+pageSize+"&proposedByUser="+proposed;
		$("#ajaxResponse").load(url);
	}
	
	$(function(){
		$("#searchForm").submit(function(e){
			e.preventDefault();
			reloadBets();
		});
	});

</script>

<input type="hidden" id="menuCat" value="${cat}" />
<input type="hidden" id="inputProposed" value="${proposedByUser}" />

<c:if test="${not empty cat}">
	<script type="text/javascript">
		window.addEventListener("load", function(){
			var cat = $("#menuCat").val();
			var search = $("#inputSearch").val();
			var p = 1;
			var pageSize = 10;
			var url = "bet/searchAjax.do?cat="+cat+"&search="+search+"&p="+p+"&ps="+pageSize;
			$("#ajaxResponse").load(url);
		});		
	</script>
</c:if>

<c:if test="${not empty proposedByUser}">
	<script type="text/javascript">
		window.addEventListener("load", function(){
			var url = "bet/searchAjax.do?cat=&search=&p=1&pageSize=10&proposedByUser=true";
			$("#ajaxResponse").load(url);
		});		
	</script>
</c:if>

<c:if test="${param.showPropose == true}">
		<div class="alert alert-success">
			<button type="button" class="close" data-dismiss="alert">&times;</button>
			<spring:message code="bet.proposedSuccess" />
		</div>
</c:if>

<c:if test="${param.showPropose == false}">
		<div class="alert alert-danger">
			<button type="button" class="close" data-dismiss="alert">&times;</button>
			<spring:message code="bet.proposedFailure" />
		</div>
</c:if>

<c:if test="${param.showLoginError == true}">
		<div class="alert alert-danger">
		<button type="button" class="close" data-dismiss="alert">&times;</button>
		<spring:message code="security.login.failed" />
	</div>
</c:if>

<c:if test="${param.delete == true}">
		<div class="alert alert-success">
			<button type="button" class="close" data-dismiss="alert">&times;</button>
			<spring:message code="security.login.delete" />
		</div>
</c:if>

<form action="bet/searchAjax.do" method="get" class="form-inline" id="searchForm">
	<div class="row">
		<select class="pull-left form-control" name="cat" id="cat" onchange="javascript:reloadBets()" style="margin-left:20px;">
			<option value="">----</option>
			<option value="0" <c:if test="${cat == 0}">selected="selected"</c:if>><spring:message code="bet.sport" /></option>
			<option value="1" <c:if test="${cat == 1}">selected="selected"</c:if>><spring:message code="bet.chance" /></option>
			<option value="2" <c:if test="${cat == 2}">selected="selected"</c:if>><spring:message code="bet.contest" /></option>
			<option value="3" <c:if test="${cat == 3}">selected="selected"</c:if>><spring:message code="bet.egames" /></option>
			<option value="4" <c:if test="${cat == 4}">selected="selected"</c:if>><spring:message code="bet.others" /></option>
		</select>
	<div class="col-lg-8" style="padding-left:0px;">
		<div class="form-group has-feedback">
			<input id="inputSearch" class="form-control" type="search" value="${search}" placeholder=<spring:message code="bet.search" /> name="search">
			<span class="glyphicon glyphicon-search form-control-feedback"></span>
		</div>
		<button type="submit" name="submit" class="btn btn-default" style="display:none;"><spring:message code="bet.search" /></button>
	</div>
	</div>
</form>
<div id="ajaxResponse" style="margin-top:15px;">

</div>