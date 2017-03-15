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
	function seeDetails(betId){
		$(window).attr('location', "moderator/betDetails.do?betId="+betId);
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
<spring:message code="moderator.accept" var="accept" />
<spring:message code="moderator.reject" var="reject" />

<table class="table table-hover">
	<thead>
		<tr>
			<th>${statusHeader}</th>
			<th>${nameHeader}</th>
			<th>${descriptionHeader}</th>
			<th>${categoryHeader}</th>
			<th>${posVotesHeader}</th>
			<th>${negVotesHeader}</th>
			<th>${betStartDateHeader}</th>
			<th>${betEndDateHeader}</th>
			<th></th>
			<th></th>
			<th></th>
		</tr>
	</thead>
	<tbody>
		<c:forEach var="bet" items="${bets}" varStatus="status">
			<tr onclick="javascript:seeDetails(${bet.id})">
				<c:if test="${bet.status == 0}">
					<td><spring:message code="bet.proposed" /></td>
				</c:if>
				<c:if test="${bet.status == 1}">
					<td><spring:message code="bet.pending" /></td>
				</c:if>
				<c:if test="${bet.status == 2}">
					<td><spring:message code="bet.accepted" /></td>
				</c:if>
				<c:if test="${bet.status == 3}">
					<td><spring:message code="bet.rejected" /></td>
				</c:if>
				<td>${bet.name}</td>
				<td>${bet.description}</td>
				<c:if test="${bet.category == 0}">
				<td>
					<spring:message code="bet.sport" />
				</td>
			</c:if>
			<c:if test="${bet.category == 1}">
				<td>
					<spring:message code="bet.chance" />
				</td>
			</c:if>
			<c:if test="${bet.category == 2}">
				<td>
					<spring:message code="bet.contest" />
				</td>
			</c:if>
			<c:if test="${bet.category == 3}">
				<td>
					<spring:message code="bet.egames" />
				</td>
			</c:if>
			<c:if test="${bet.category == 4}">
				<td>
					<spring:message code="bet.others" />
				</td>
			</c:if>
				<td>${bet.positiveVotes}</td>
				<td>${bet.negativeVotes}</td>
				<td>
					<fmt:formatDate value="${bet.startDate}" type="date" pattern="dd/MM/yyyy" />
				</td>
				<td>
					<fmt:formatDate value="${bet.endingDate}" type="date" pattern="dd/MM/yyyy" />
				</td>
				<td>
					<a href="moderator/betDetails.do?betId=${bet.id}" >
						${details}
					</a>
					
				</td>
				<td>
					<c:if test="${bet.status == 0}">
						<a href="moderator/accept2.do?betId=${bet.id}" >
							${accept}
						</a>
					</c:if>
					<c:if test="${bet.status == 1}">
						<a href="moderator/accept3.do?betId=${bet.id}" >
							${accept}
						</a>
					</c:if>
					<c:if test="${bet.status == 2}">
					</c:if>
					<c:if test="${bet.status == 3}">
						<a href="moderator/accept1.do?betId=${bet.id}" >
							${accept}
						</a>
					</c:if>
				</td>
				<td>
					<c:if test="${bet.status == 0}">
						<a href="moderator/reject2.do?betId=${bet.id}" >
							${reject}
						</a>
					</c:if>
					<c:if test="${bet.status == 1}">
						<a href="moderator/reject3.do?betId=${bet.id}" >
							${reject}
						</a>
					</c:if>
					<c:if test="${bet.status == 2}">
						<a href="moderator/reject1.do?betId=${bet.id}" >
							${reject}
						</a>
					</c:if>
					<c:if test="${bet.status == 3}">
						<a href="moderator/deleteBet.do?betId=${bet.id}" >
							${reject}
						</a>
					</c:if>
				</td>
			</tr>	
		</c:forEach>
	</tbody>
</table>

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