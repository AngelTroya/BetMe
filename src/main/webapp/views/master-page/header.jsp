<%--
 * header.jsp
 *
* Copyright (C) 2014 Paperbet S.A.
 --%>

<%@page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="security" uri="http://www.springframework.org/security/tags"%>
<%@taglib prefix="jstl"	uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>


<script type="text/javascript">
	$(function(){
		$("#loginForm").load("security/login.do");
	});
	$(function(){
		$(".sports").click(function(){
			var search = $("#inputSearch").val();
			if(search == undefined)
				search = "";
			$(window).attr('location', "bet/showBets.do?menuCat=0&search="+search);
		});
	});
	$(function(){
		$(".contest").click(function(){
			var search = $("#inputSearch").val();
			if(search == undefined)
				search = "";
			$(window).attr('location', "bet/showBets.do?menuCat=2&search="+search);
		});
	});
	$(function(){
		$(".egames").click(function(){
			var search = $("#inputSearch").val();
			if(search == undefined)
				search = "";
			$(window).attr('location', "bet/showBets.do?menuCat=3&search="+search);
		});
	});
	$(function(){
		$(".chance").click(function(){
			var search = $("#inputSearch").val();
			if(search == undefined)
				search = "";
			$(window).attr('location', "bet/showBets.do?menuCat=1&search="+search);
		});
	});
	$(function(){
		$(".others").click(function(){
			var search = $("#inputSearch").val();
			if(search == undefined)
				search = "";
			$(window).attr('location', "bet/showBets.do?menuCat=4&search="+search);
		});
	});
	$(function(){
		$("#propose").click(function(){
			$(window).attr('location', 'bet/propose.do');
		});
	});
	$(function(){
		$("#register").click(function(){
			$(window).attr('location', 'user/register.do');
		});
	});
	$(function(){
		$("#proposed").click(function(){
			$(window).attr('location', 'moderator/proposed.do');
		});
	});
	$(function(){
		$("#accepted").click(function(){
			$(window).attr('location', 'moderator/accepted.do');
		});
	});
	$(function(){
		$("#pending").click(function(){
			$(window).attr('location', 'moderator/pending.do');
		});
	});
	$(function(){
		$("#rejected").click(function(){
			$(window).attr('location', 'moderator/rejected.do');
		});
	});
	$(function(){
		$("#reports").click(function(){
			$(window).attr('location', 'moderator/reports.do');
		});
	});
	$(function(){
		$("#users").click(function(){
			$(window).attr('location', 'moderator/users.do');
		});
	});
	$(function(){
		$("#bets").click(function(){
			$(window).attr('location', 'moderator/bets.do');
		});
	});
	
	
</script>

<div>
	<img src="images/logo.png" alt="Bet Me" style="max-height: 200px;"/>
</div>

<div>
	<security:authorize access="hasRole('ADMIN')">
		<!-- Menú para el admin -->		
	</security:authorize>
	
	<security:authorize access="hasRole('CUSTOMER')">
			<nav class="navbar navbar-inverse" role="navigation">
  				<div class="container-fluid">
  				
   				 <!-- Brand and toggle get grouped for better mobile display -->
   					<div class="navbar-header">
     					 <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#TopMenu">
       						 <span class="sr-only">Toggle navigation</span>
       						 <span class="icon-bar"></span>
     						 <span class="icon-bar"></span>
       						 <span class="icon-bar"></span>
     					 </button>
    				</div>

  				<!-- Collect the nav links, forms, and other content for toggling -->
   					<div class="collapse navbar-collapse" id="TopMenu">
      					<ul class="nav navbar-nav">
      						<li><a href="welcome/index.do"><span class="glyphicon glyphicon-home"></span></a></li>
      						<li id="li-egames"><a class="egames pointer" data-toggle="tab"><spring:message code="master.menu.egames" /></a></li>
       						<li id="li-sports"><a class="sports pointer" data-toggle="tab"><spring:message code="master.menu.sports" /></a></li>
       						<li id="li-chance"><a class="chance pointer" data-toggle="tab"><spring:message code="master.menu.chance" /></a></li>       					
       						<li id="li-contest"><a class="contest pointer" data-toggle="tab"><spring:message code="master.menu.contest" /></a></li>
       						<li id="li-others"><a class="others pointer" data-toggle="tab"><spring:message code="master.menu.otros" /></a></li>
       						<li id="li-propose"><a data-toggle="tab" id="propose" class="pointer"><spring:message code="master.page.user.propose" /></a></li>       					
     					 </ul>      					 
      					 <ul class="nav navbar-nav navbar-right">
      					 	<li class="dropdown">
      					 	<a href="#" class="dropdown-toggle" data-toggle="dropdown"><spring:message code="master.page.settings" />&nbsp;<span class="glyphicon glyphicon-cog" ></span>&nbsp;<b class="caret"></b></a>
      					 	<ul class="dropdown-menu">
      					 		<li><a href="user/showdetails.do"><spring:message code="master.page.profile" /><span class="pull-right glyphicon glyphicon-user"></span></a></li>
            					<li><a href="money/wallet.do"><spring:message code="master.page.user.wallet" /><span class="pull-right glyphicon glyphicon-euro"></span></a></li>
            					<li><a href="j_spring_security_logout"><spring:message code="master.page.logout" /><span class="pull-right glyphicon glyphicon-off"></span></a>
      						</ul>
      						</li>
     			 		</ul>
   			 		</div><!-- /.navbar-collapse -->
  				</div><!-- /.container-fluid -->
			</nav>
		</security:authorize>
		
		<security:authorize access="hasRole('MODERATOR')">
			<nav class="navbar navbar-inverse" role="navigation">
  				<div class="container-fluid">
  				
   				 <!-- Brand and toggle get grouped for better mobile display -->
   					<div class="navbar-header">
     					 <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#TopMenu">
       						 <span class="sr-only">Toggle navigation</span>
       						 <span class="icon-bar"></span>
     						 <span class="icon-bar"></span>
       						 <span class="icon-bar"></span>
     					 </button>
    				</div>

  				<!-- Collect the nav links, forms, and other content for toggling -->
   					<div class="collapse navbar-collapse" id="TopMenu">
      					<ul class="nav navbar-nav">
      						<li><a href="welcome/index.do"><span class="glyphicon glyphicon-home"></span></a></li>
      						<li id="li-bets"><a data-toggle="tab" id="bets" class="pointer"><spring:message code="master.page.moderator.bets" /></a></li>
       						<li id="li-proposed"><a data-toggle="tab" id="proposed" class="pointer"><spring:message code="master.page.moderator.proposed" /></a></li>
       						<li id="li-pending"><a data-toggle="tab" id="pending" class="pointer"><spring:message code="master.page.moderator.pending" /></a></li>
       						<li id="li-accepted"><a data-toggle="tab" id="accepted" class="pointer"><spring:message code="master.page.moderator.accepted" /></a></li>
       						<li id="li-rejected"><a data-toggle="tab" id="rejected" class="pointer"><spring:message code="master.page.moderator.rejected" /></a></li>
       						<li id="li-reports"><a data-toggle="tab" id="reports"class="pointer"><spring:message code="master.page.moderator.reports" /></a></li>
       						<li id="li-users"><a data-toggle="tab" id="users" class="pointer"><spring:message code="master.page.moderator.users" /></a></li>       					
     					 </ul>
      					 <ul class="nav navbar-nav navbar-right">
      					 	<li><a href="j_spring_security_logout"><spring:message code="master.page.logout" />&nbsp;&nbsp;<span class="pull-right glyphicon glyphicon-off"></span></a></li>
     			 		</ul>
   			 		</div><!-- /.navbar-collapse -->
  				</div><!-- /.container-fluid -->
			</nav>
		</security:authorize>
		
		<security:authorize access="isAnonymous()">
		
			<nav class="navbar navbar-inverse" role="navigation">
  				<div class="container-fluid">  				
   					 <!-- Brand and toggle get grouped for better mobile display -->
   					<div class="navbar-header">
     					 <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#TopMenu">
       						 <span class="sr-only">Toggle navigation</span>
       						 <span class="icon-bar"></span>
     						 <span class="icon-bar"></span>
       						 <span class="icon-bar"></span>
     					 </button>
    				</div>

  					<!-- Collect the nav links, forms, and other content for toggling -->
   					<div class="collapse navbar-collapse" id="TopMenu">
      					<ul class="nav navbar-nav">
      						<li><a href="welcome/index.do"><span class="glyphicon glyphicon-home"></span></a>
      							<li id="li-egames"><a class="egames pointer" data-toggle="tab"><spring:message code="master.menu.egames" /></a></li>
       						<li id="li-sports"><a class="sports pointer" data-toggle="tab"><spring:message code="master.menu.sports" /></a></li>
       						<li id="li-chance"><a class="chance pointer" data-toggle="tab"><spring:message code="master.menu.chance" /></a></li>       					
       						<li id="li-contest"><a class="contest pointer" data-toggle="tab"><spring:message code="master.menu.contest" /></a></li>
       						<li id="li-others"><a class="others pointer" data-toggle="tab"><spring:message code="master.menu.otros" /></a></li>        					
     					</ul>
						
									
   			 		</div><!-- /.navbar-collapse -->
  				</div><!-- /.container-fluid -->
			</nav>
		
		<div id="fl_menu" class="container-fluid collapse navbar-collapse">
   			<button id="register" type="button" class="btn btn-default navbar-btn navbar-right" style="margin-left:5px;">
				<spring:message code="master.page.register" />
			</button>
			<ul id="loginForm" class="nav navbar-nav navbar-right" style="margin-right:0px;">					
      											
			</ul>  			 
		</div>
		
		</security:authorize>
</div>