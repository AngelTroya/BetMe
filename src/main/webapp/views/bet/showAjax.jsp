<%@page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@taglib prefix="security"	uri="http://www.springframework.org/security/tags"%>
<%@taglib prefix="display" uri="http://displaytag.sf.net"%>
<%@taglib prefix="jstl" uri="http://java.sun.com/jsp/jstl/core"%>

<script type="text/javascript">
	function seeDetails(betId){
		$(window).attr('location', "bet/seeDetails.do?betId="+betId);
	}
	function seePublicDetails(betId){
		$(window).attr('location', "bet/seePublicDetails.do?betId="+betId);
	}
</script>

<spring:message code="bet.status" var="statusHeader" />
<spring:message code="bet.name" var="nameHeader" />
<spring:message code="bet.description" var="descriptionHeader" />
<spring:message code="bet.category" var="categoryHeader" />
<spring:message code="bet.positiveVotes" var="posVotesHeader" />	
<spring:message code="bet.negativeVotes" var="negVotesHeader" />
<spring:message code="bet.startDate" var="betStartDateHeader" />	
<spring:message code="bet.endDate" var="betEndDateHeader" />	
<spring:message code="bet.details" var="details" />

<script type="text/javascript">
$(function(){
	$("span[name*='report']").click(function(){
		$('#reportModal').modal('show');
		var betId = parseInt($(this).data("bet"), 10);
		$("#reportModalBody").load("bet/report.do?betId="+betId);
	});
});
</script>

<jstl:if test="${bet.reported eq true}">
		<div class="alert alert-success">
			<button type="button" class="close" data-dismiss="alert">&times;</button>
			<spring:message code="bet.reportedSuccess" />
		</div>
</jstl:if>
<jstl:if test="${bet.reported eq false}">
		<div class="alert alert-danger">
			<button type="button" class="close" data-dismiss="alert">&times;</button>
			<spring:message code="bet.reportedFailure" />
		</div>
</jstl:if>
<jstl:if test="${noProposed eq true}">
		<div class="alert alert-danger">
			<button type="button" class="close" data-dismiss="alert">&times;</button>
			<spring:message code="bet.noProposedBets" />
		</div>
</jstl:if>

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

<div id="listcontainer" class="container-fluid row">
<c:forEach var="bet" items="${bets}" varStatus="status" step="2">
 <div class="panel-group container-fluid col-md-6" id="accordion">
 	<div class="panel panel-default">
  	  	<div class="panel-heading container-fluid">
  	  	
  	  		<security:authorize access="isAuthenticated()">
  	  		
  	  			<c:if test="${not (bet.status == 3)}">
				
				<p class="text-right">
					<span title="<spring:message code="bet.report" /> " class="glyphicon glyphicon-ban-circle initialism pointer" name="report${status}" data-bet="${bet.id}"></span>
				</p>
				</c:if>
			</security:authorize>  	  		
  	  		<h2 class="panel-title text-center"> 
  	  			<c:choose>
      				<c:when test="${bet.category == 0}">		
      					<a class="btn btn-info" data-toggle="collapse" data-parent="#accordion" href="#collapse${bet.id}">   
       		 			<strong>      			
      						${bet.name} 
      					</strong>		
						<spring:message code="bet.sport" />	
						</a>			
					</c:when>
					<c:when test="${bet.category == 3}">	
						<a class="btn btn-primary2" data-toggle="collapse" data-parent="#accordion" href="#collapse${bet.id}">   
       		 				<strong>      			
      							${bet.name} 
      						</strong>							
							<spring:message code="bet.egames" />
						</a>			
					</c:when>
					<c:when test="${bet.category == 4}">	
						<a class="btn btn-warning2" data-toggle="collapse" data-parent="#accordion" href="#collapse${bet.id}">   
       		 				<strong>      			
      						${bet.name} 
      						</strong>					
							<spring:message code="bet.others" />
						</a>			
					</c:when> 					
					<c:when test="${bet.category == 2}">	
						<a class="btn btn-success2" data-toggle="collapse" data-parent="#accordion" href="#collapse${bet.id}">   
       		 			<strong>      			
      						${bet.name} 
      					</strong>							
						<spring:message code="bet.contest" />
						</a>				
					</c:when>					
					<c:otherwise>
						<a class="btn btn-danger2" data-toggle="collapse" data-parent="#accordion" href="#collapse${bet.id}">   
       		 			<strong>      			
      						${bet.name} 
      					</strong>					
						<spring:message code="bet.chance" />	
						</a>			
					</c:otherwise>
					</c:choose>         		
  			 </h2>
  			  <div class="row">
  				<div class="col-md-6 col-xs-6">
  					<p>
  						<strong><spring:message code="bet.starts" />:</strong> <fmt:formatDate value="${bet.startDate}" type="date" pattern="dd/MM/yyyy" /> 
  						--
  						<strong><spring:message code="bet.ends" />:</strong> <fmt:formatDate value="${bet.endingDate}" type="date" pattern="dd/MM/yyyy" />  					
  					</p>  				
  				</div>
 				<div class="col-md-6  col-xs-6"> 				
 					<p class="text-right">
  			 			Karma: ${bet.positiveVotes-bet.negativeVotes}  <span class="glyphicon glyphicon-thumbs-up"></span>
  					</p>
 				</div>
			</div> 
				
			
		</div>
    <div id="collapse${bet.id}" class="panel-collapse collapse">
      <div class="panel-body">
		<div id="topbody">
			 <p class="text-justify">
  			 	${bet.description}
  			 </p>
		</div>
		
		
		<div class="row container-fluid" style="float: left; clear: none;">  
			<c:forEach var="option" items="${bet.options}">
								 						
					<ul style="display: inline-block;">					
							<li class="list-group-item"  style="background-color:#333;color:#eee">
									${option.name}
							</li>
							<li class="list-group-item">
									${option.rate}
							</li>						 					
					</ul>		
				</c:forEach>
		</div>
		<security:authorize access="isAnonymous()">
			<div class="row">
 				<div class="col-xs-12"> 				
 					 <p class="text-center">
  			 			<a class="btn btn-default" href="bet/seePublicDetails.do?betId=${bet.id}" >
							<spring:message code="bet.details" />
						</a>
  					 </p>
 				</div>
			</div>
		</security:authorize>
		<security:authorize access="isAuthenticated()">
			<div class="row">
 				<div class="col-xs-12"> 				
 					 <p class="text-center">
  			 			<a class="btn btn-default" href="bet/seeDetails.do?betId=${bet.id}" >
							<spring:message code="bet.details" />
						</a>
  					 </p>
 				</div>
			</div>
		</security:authorize>			 
   	</div>
</div>
</div>
</div>

<c:if test="${not empty bets[status.index+1]}">

<div class="panel-group container-fluid col-md-6" id="accordion">
 	<div class="panel panel-default">
  	  	<div class="panel-heading container-fluid">
  	  	
  	  		<security:authorize access="isAuthenticated()">
  	  		
  	  			<c:if test="${not (bets[status.index+1].status == 3)}">
				
				<p class="text-right">
					<span title="<spring:message code="bet.report" /> " class="glyphicon glyphicon-ban-circle initialism pointer" name="report${status.index + 1}" data-bet="${bets[status.index+1].id}"></span>
				</p>
				</c:if>
			</security:authorize>  	  		
  	  		<h2 class="panel-title text-center"> 
  	  			<c:choose>
      				<c:when test="${bets[status.index+1].category == 0}">		
      					<a class="btn btn-info" data-toggle="collapse" data-parent="#accordion" href="#collapse${bets[status.index+1].id}">   
       		 			<strong>      			
      						${bets[status.index+1].name} 
      					</strong>		
						<spring:message code="bet.sport"/>
						</a>			
					</c:when>
					<c:when test="${bets[status.index+1].category == 3}">	
						<a class="btn btn-primary2" data-toggle="collapse" data-parent="#accordion" href="#collapse${bets[status.index+1].id}">   
       		 				<strong>      			
      							${bets[status.index+1].name} 
      						</strong>							
							<spring:message code="bet.egames" />
						</a>			
					</c:when>
					<c:when test="${bets[status.index+1].category == 4}">	
						<a class="btn btn-warning2" data-toggle="collapse" data-parent="#accordion" href="#collapse${bets[status.index+1].id}">   
       		 				<strong>      			
      						${bets[status.index+1].name} 
      						</strong>					
							<spring:message code="bet.others" />
						</a>			
					</c:when>
					<c:when test="${bets[status.index+1].category == 2}">	
						<a class="btn btn-success2" data-toggle="collapse" data-parent="#accordion" href="#collapse${bets[status.index+1].id}">   
       		 			<strong>      			
      						${bets[status.index+1].name} 
      					</strong>							
						<spring:message code="bet.contest" />
						</a>				
					</c:when>					
					<c:otherwise>
						<a class="btn btn-danger2" data-toggle="collapse" data-parent="#accordion" href="#collapse${bets[status.index+1].id}">   
       		 			<strong>      			
      						${bets[status.index+1].name} 
      					</strong>					
						<spring:message code="bet.chance" />	
						</a>			
					</c:otherwise>  
				</c:choose>        		
  			 </h2>
  			  <div class="row">
  				<div class="col-md-6 col-xs-6">
  					<p>
  						<strong><spring:message code="bet.starts" />:</strong> <fmt:formatDate value="${bets[status.index+1].startDate}" type="date" pattern="dd/MM/yyyy" /> 
  						--
  						<strong><spring:message code="bet.ends" />:</strong> <fmt:formatDate value="${bets[status.index+1].endingDate}" type="date" pattern="dd/MM/yyyy" />  					
  					</p>  				
  				</div>
 				<div class="col-md-6  col-xs-6"> 				
 					<p class="text-right">
  			 			Karma: ${bets[status.index+1].positiveVotes-bets[status.index+1].negativeVotes}  <span class="glyphicon glyphicon-thumbs-up"></span>
  					</p>
 				</div>
			</div> 
				
			
		</div>
    <div id="collapse${bets[status.index+1].id}" class="panel-collapse collapse">
      <div class="panel-body">
		<div id="topbody">
			 <p class="text-justify">
  			 	${bets[status.index+1].description}
  			 </p>
		</div>
		
		<div class="row container-fluid" style="float: left; clear: none;">  
			<c:forEach var="option" items="${bets[status.index+1].options}">
								 						
					<ul style="display: inline-block;">					
							<li class="list-group-item" style="background-color:#333;color:#eee">
									${option.name}
							</li>
							<li class="list-group-item">
									${option.rate}
							</li>						 					
					</ul>		
				</c:forEach>
		</div>
		<security:authorize access="isAnonymous()">
			<div class="row">
 				<div class="col-xs-12"> 				
 					 <p class="text-center">
  			 			<a class="btn btn-default" href="bet/seePublicDetails.do?betId=${bets[status.index+1].id}" >
							<spring:message code="bet.details" />
						</a>
  					 </p>
 				</div>
			</div>
		</security:authorize>
		<security:authorize access="isAuthenticated()">
			<div class="row">
 				<div class="col-xs-12"> 				
 					 <p class="text-center">
  			 			<a class="btn btn-default" href="bet/seeDetails.do?betId=${bets[status.index+1].id}" >
							<spring:message code="bet.details" />
						</a>
  					 </p>
 				</div>
			</div>
		</security:authorize>
   	</div>
</div>
</div>
</div>
</c:if>
</c:forEach>
</div>



<c:if test="${numPages gt 1}">
	<c:if test="${page eq 1}">
		<ul class="pagination">
  			<li class="disabled"><a>&laquo;</a></li>
 			<li class="active"><a>${page}</a></li>
  			<li><a onclick="javascript:goToPage(${page + 1})">${page + 1}</a></li>
  			<c:if test="${numPages gt 2}"><li><a onclick="javascript:goToPage(${page + 2})">${page + 2}</a></li></c:if>
  			<c:if test="${numPages gt 3}"><li><a onclick="javascript:goToPage(${page + 3})">${page + 3}</a></li></c:if>
  			<c:if test="${numPages gt 4}"><li><a onclick="javascript:goToPage(${page + 4})">${page + 4}</a></li></c:if>
  			<li <c:if test="${numPages eq 1}"> class="disabled" </c:if> ><a <c:if test="${numPages gt 1}"> onclick="javascript:goToPage(${page + 1})" </c:if>>&raquo;</a></li>
		</ul>
	</c:if>
	<c:if test="${page eq 2}">
		<ul class="pagination">
  			<li><a onclick="javascript:goToPage(${page - 1})">&laquo;</a></li>
 			<li><a onclick="javascript:goToPage(${page -1})">${page - 1}</a></li>
  			<li class="active"><a>${page}</a></li>
  			<c:if test="${numPages gt 2}"><li><a onclick="javascript:goToPage(${page + 1})">${page + 1}</a></li></c:if>
  			<c:if test="${numPages gt 3}"><li><a onclick="javascript:goToPage(${page + 2})">${page + 2}</a></li></c:if>
  			<c:if test="${numPages gt 4}"><li><a onclick="javascript:goToPage(${page + 3})">${page + 3}</a></li></c:if>
  			<li <c:if test="${numPages eq 2}"> class="disabled" </c:if>><a <c:if test="${numPages gt 2}"> onclick="javascript:goToPage(${page + 1})" </c:if>>&raquo;</a></li>
		</ul>
	</c:if>
	<c:if test="${page ge 3}">
		<ul class="pagination">
  			<li><a onclick="javascript:goToPage(${page - 1})">&laquo;</a></li>
 			<li><a onclick="javascript:goToPage(${page - 2})">${page - 2}</a></li>
  			<li><a onclick="javascript:goToPage(${page - 1})">${page - 1}</a></li>
  			<li class="active"><a onclick="javascript:goToPage(${page + 1})">${page}</a></li>
  			<c:if test="${numPages gt page + 1}"><li><a onclick="javascript:goToPage(${page + 1})">${page + 1}</a></li></c:if>
  			<c:if test="${numPages gt page + 2}"><li><a onclick="javascript:goToPage(${page + 2})">${page + 2}</a></li></c:if>
  			<li <c:if test="${numPages eq page}">class="disabled"</c:if>><a <c:if test="${numPages gt page}"> onclick="javascript:goToPage(${page + 1})" </c:if>>&raquo;</a></li>
		</ul>
	</c:if>
</c:if>