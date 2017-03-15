<%@page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@taglib prefix="security"	uri="http://www.springframework.org/security/tags"%>
<%@taglib prefix="display" uri="http://displaytag.sf.net"%>

<script type="text/javascript">

function imgError(image){
	image.onerror = "";
	image.src = "images/defecto.jpg";
	return true;
}

$(function(){
	$("#report").click(function(){
		$('#reportModal').modal('show');
		var betId = parseInt($(this).data("bet"), 10);
		$("#reportModalBody").load("bet/report.do?betId="+betId);
	});
});

function likeBet(isVoted,betId){
	$(alert(werwerwerwer));
	alert(isVoted);
	alert(betId);	
}

$(function(){
	$("#like").click(function(){		
		var betId = parseInt($(this).data("bet"), 10);			
			$(window).attr('location', "user/voteBetPos.do?betId="+betId);		
				
	});
});

$(function(){
	$("span[name*='reportUser']").click(function(){
		$('#reportUserModal').modal('show');
		var betId = parseInt($(this).data("bet"), 10);
		var userId = parseInt($(this).data("user"), 10);
		$("#reportUserModalBody").load("user/report.do?betId="+betId+"&userId="+userId);
	});
});

$(function(){
	$("#comment").click(function(){
		$('#commentModal').modal('show');
		var betId = parseInt($(this).data("num"), 10);
		$("#commentModalBody").load("bet/newComment.do?betId="+betId);
	});
});

function votePos(commentId, betId){
	$(window).attr('location', "user/voteCommentPos.do?commentId="+commentId+"&betId="+betId);
}

function voteNeg(commentId, betId){
	$(window).attr('location', "user/voteCommentNeg.do?commentId="+commentId+"&betId="+betId);
}
</script>

<c:if test="${voted == true}">
		<div class="alert alert-success">
			<button type="button" class="close" data-dismiss="alert">&times;</button>
			<spring:message code="bet.votedSuccess" />
		</div>
</c:if>

<c:if test="${voted == false}">
		<div class="alert alert-danger">
			<button type="button" class="close" data-dismiss="alert">&times;</button>
			<spring:message code="bet.votedFailure" />
		</div>
</c:if>

<c:if test="${reported == true}">
		<div class="alert alert-success">
			<button type="button" class="close" data-dismiss="alert">&times;</button>
			<spring:message code="bet.reportedSuccess" />
		</div>
</c:if>

<c:if test="${reported == false}">
		<div class="alert alert-danger">
			<button type="button" class="close" data-dismiss="alert">&times;</button>
			<spring:message code="bet.reportedFailure" />
		</div>
</c:if>

<c:if test="${param.noMoney == true}">
		<div class="alert alert-danger">
			<button type="button" class="close" data-dismiss="alert">&times;</button>
			<spring:message code="bet.noMoney" />
		</div>
</c:if>

<c:if test="${not empty param.error}">
		<div class="alert alert-danger">
			<button type="button" class="close" data-dismiss="alert">&times;</button>
			<spring:message code="${param.error}" />
		</div>
</c:if>

<c:if test="${param.gamble == false}">
		<div class="alert alert-danger">
			<button type="button" class="close" data-dismiss="alert">&times;</button>
			<spring:message code="bet.unsuccessfulGamble" />
		</div>
</c:if>

<c:if test="${param.gamble == true}">
		<div class="alert alert-success">
			<button type="button" class="close" data-dismiss="alert">&times;</button>
			<spring:message code="bet.successfulGamble" />
		</div>
</c:if>

<c:if test="${deleteError == true}">
		<div class="alert alert-success">
			<button type="button" class="close" data-dismiss="alert">&times;</button>
			<spring:message code="bet.successfulDelete" />
		</div>
</c:if>

<c:if test="${deleteError == false}">
		<div class="alert alert-danger">
			<button type="button" class="close" data-dismiss="alert">&times;</button>
			<spring:message code="bet.unsuccessfulDelete" />
		</div>
</c:if>

<c:if test="${deleteError == 'userError'}">
		<div class="alert alert-danger">
			<button type="button" class="close" data-dismiss="alert">&times;</button>
			<spring:message code="bet.notyours" />
		</div>
</c:if>

<div class="modal" id="reportModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
        <h4 class="modal-title" id="myModalLabel"><spring:message code="bet.report"/></h4>
      </div>
      <div id="reportModalBody" class="modal-body">
		
      </div>
    </div>
  </div>
</div>

<div class="modal" id="reportUserModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
        <h4 class="modal-title" id="myModalLabel">Report an user</h4>
      </div>
      <div id="reportUserModalBody" class="modal-body">
		
      </div>
    </div>
  </div>
</div>

<div class="modal" id="commentModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
        <h4 class="modal-title" id="myModalLabel">Add a comment</h4>
      </div>
      <div id="commentModalBody" class="modal-body">
		
      </div>
    </div>
  </div>
</div>

<spring:message code="bet.status" var="statusHeader" />
<spring:message code="bet.name" var="nameHeader" />
<spring:message code="bet.category" var="categoryHeader" />
<spring:message code="bet.positiveVotes" var="posVotesHeader" />
<spring:message code="bet.negativeVotes" var="negVotesHeader" />
<spring:message code="bet.startDate" var="betStartDateHeader" />
<spring:message code="bet.endDate" var="betEndDateHeader" />
<spring:message code="bet.gamble" var="gamble" />
<c:choose>
      				<c:when test="${bet.category == 0}" >	
      					 <c:set var="colorclass" value="panel-info"/>
      				</c:when>
					<c:when test="${bet.category == 3}">
						<c:set var="colorclass" value="panel-primary"/>			
					</c:when>
					<c:when test="${bet.category == 4}">
						<c:set var="colorclass" value="panel-warning"/>			
					</c:when> 					
					<c:when test="${bet.category == 2}">			 
						<c:set var="colorclass" value="panel-success"/>       		 							
					</c:when>					
					<c:otherwise>
						<c:set var="colorclass" value="panel-danger"/>   
					</c:otherwise>
					</c:choose>  

<div id="listcontainer" class="container-fluid row">
 	<div class="panel <c:out value="${colorclass}"/>">
  	  	<div class="panel-heading container-fluid">
  	  	<div class="row container-fluid">
  	  		<div class="col-md-4 col-xs-6">
  	  		<table style="font-size:1.1em;">
			<tr>
			<c:if test="${bet.status == 0}">
				<td>
					<strong><spring:message code="bet.proposed" /></strong>
				</td>
			</c:if>
			<c:if test="${bet.status == 1}">
				<td>
					<strong><spring:message code="bet.pending" /></strong>
				</td>
			</c:if>
			<c:if test="${bet.status == 2}">
				<td>
					<strong><spring:message code="bet.accepted" /></strong>
				</td>
			</c:if>
			<c:if test="${bet.status == 3}">
				<td>
					<strong><spring:message code="bet.rejected" /></strong>
				</td>
			</c:if>	
			</tr>
		</table>
  	  		</div>
			<div class="col-md-4 col-xs-6"> 		
	  	  		<h2 class="panel-title text-center"> 
	  	  			<c:choose>
	      				<c:when test="${bet.category == 0}">		
	      					   
	       		 			<strong>      			
	      						${bet.name} 
	      					</strong>		
							<spring:message code="bet.sport" />	
										
						</c:when>
						<c:when test="${bet.category == 3}">	
						   
	       		 				<strong>      			
	      							${bet.name} 
	      						</strong>							
								<spring:message code="bet.egames" />
										
						</c:when>
						<c:when test="${bet.category == 4}">	
							   
	       		 				<strong>      			
	      						${bet.name} 
	      						</strong>					
								<spring:message code="bet.others" />
									
						</c:when> 					
						<c:when test="${bet.category == 2}">	
							  
	       		 			<strong>      			
	      						${bet.name} 
	      					</strong>							
							<spring:message code="bet.contest" />
										
						</c:when>					
						<c:otherwise>
							  
	       		 			<strong>      			
	      						${bet.name} 
	      					</strong>					
							<spring:message code="bet.chance" />	
										
						</c:otherwise>
						</c:choose>         		
	  			 </h2>
	  			 </div>
	  			 <div class="col-md-4 hidden-xs">
	  	  		<security:authorize access="isAuthenticated()">
	  	  		
	  	  			<c:if test="${not (bet.status == 3)}">
					
					<p class="text-right">
						<span title="<spring:message code="bet.report" /> " class="glyphicon glyphicon-ban-circle initialism pointer" id="report" data-bet="${bet.id}"></span>
					</p>
					</c:if>
				</security:authorize>
			</div>	
			<div class="col-md-12 hidden-md hidden-lg hidden-sm">
	  	  		<security:authorize access="isAuthenticated()">
	  	  		
	  	  			<c:if test="${not (bet.status == 3)}">
					
					<p class="text-right">
						<span title="<spring:message code="bet.report" /> " class="glyphicon glyphicon-ban-circle initialism" id="report" data-bet="${bet.id}"></span>
					</p>
					</c:if>
				</security:authorize>
			</div>	
			</div>
  			  <div class="row">
  				<div class="col-md-6 col-xs-6">
  					<p>
  						<strong><spring:message code="bet.starts" />:</strong> <fmt:formatDate value="${bet.startDate}" type="date" pattern="dd/MM/yyyy" /> 
  						<br>
  						<strong><spring:message code="bet.ends" />:</strong> <fmt:formatDate value="${bet.endingDate}" type="date" pattern="dd/MM/yyyy" />  					
  					</p>  				
  				</div>
 				<div class="col-md-6  col-xs-6"> 				
 					<p class="text-right">
 						<br>
  			 			Karma: ${bet.positiveVotes-bet.negativeVotes} 
  			 			<span class="glyphicon glyphicon-thumbs-up pointer" id="like" data-voted="${votedBet}" data-bet="${bet.id}"></span>
  			 		</p>
 				</div>
			</div> 
	</div>
    <div class="collapse-in">
      <div class="panel-body">
		<div id="topbody">
			 <p class="text-justify">
  			 	${bet.description}
  			 </p>
		</div>
		<div class="row container-fluid" style="float: left; clear: none;">  
			<c:forEach var="option" items="${bet.options}">
								 						
					<ul style="display: inline-block;">					
						<li class="list-group-item text-center" style="background-color:#333;color:#eee">
								${option.name}
						</li>
						<li class="list-group-item text-center">
								${option.rate}
						</li>
						
						<security:authorize access="hasRole('CUSTOMER')">
						
						<li class="list-group-item text-center">
							 					
							<form:form action="gamble/gamble.do" method="POST" modelAttribute="form">								
								<form:hidden path="betId" value="${bet.id}"/>
								<form:hidden path="betOptionId" value="${option.id}"/>
								<div class="row" style="display:table-cell;">
   									<input class="form-control" type="text" name="amount" style="width:80px; text-align:center" placeholder="€"/> 														
								</div>
																
								<input class="btn betme" type="submit" value="${gamble}" />
							</form:form>
																
						</li>					
						</security:authorize>
									
					</ul>		
			</c:forEach>
		</div>
   	</div>
</div>
</div>
</div>


<c:if test="${not empty comments}">

	<spring:message code="bet.user" var="userHeader" />
	<spring:message code="bet.text" var="textHeader" />
	<spring:message code="bet.positiveVotes" var="posVotesHeader" />
	<spring:message code="bet.negativeVotes" var="negVotesHeader" />
	<spring:message code="bet.deleteMine" var="deleteComment" />
	<spring:message code="bet.report" var="report" />
	
	<c:forEach var="comment" items="${comments}" varStatus="row">
	
		<div class="media comment-panel">
			<div class="pull-left comment-photo">
				<img src="${pageContext.request.contextPath}/user/streamPhoto.do?user=${comment.user.id}"
				class="comment-responsive img-thumbnail center-block"
				alt = "Fallo en la imagen"
				onerror="imgError(this);" />
			</div>
			<div class="media-body">
				<p class="comment-header">
					${comment.user.userAccount.username}
					<span class="pull-right">
						<security:authorize access="hasRole('CUSTOMER')">	
							<c:if test="${comment.user.id eq userid}">
								<a href="bet/deleteComment.do?commentId=${comment.id}" >
									<span class="glyphicon glyphicon-remove"></span>
								</a>
							</c:if>
							<c:if test="${comment.user.id ne userid}">
								<span title="<spring:message code="bet.report" />" class="glyphicon glyphicon-ban-circle pointer" name="reportUser${row}" data-bet="${bet.id}" data-user="${comment.user.id}"> </span>
							</c:if>
						</security:authorize>
					</span>	
				</p>
				<p class="comment-body">${comment.text}</p>
			</div>
			<div>
				<p>
					<span class="glyphicon glyphicon-thumbs-up vote pointer" onclick="javascript:votePos(${comment.id}, ${bet.id});"></span> (${comment.positiveVotes})
				</p>
			</div>
		</div>
	
	</c:forEach>	  
</c:if>

<security:authorize access="hasRole('CUSTOMER')">
	<input class="btn betme" id="comment" type="button" data-num="${bet.id}" value="<spring:message code="bet.comment" /> "/>
</security:authorize>
