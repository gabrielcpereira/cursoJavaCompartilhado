<%-- <%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> --%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="s"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="security" %>

<c:url value="/resources" var="pathResource"></c:url>
<link rel="stylesheet" href="${pathResource }/css/bootstrap.min.css" />
<link rel="stylesheet" href="${pathResource }/css/bootstrap-theme.min.css" />
<script src="${pathResource }/js/bootstrap.min.js"></script>
<script src="${pathResource }/js/util.js"></script>
<script src="${pathResource }/js/jquery-3.2.1.slim.min.js"></script>    

<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
	<a class="navbar-brand" href="${ s:mvcUrl('HC#index').build() }">Casa do código</a>
	<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
	  <span class="navbar-toggler-icon"></span>
	</button>
	<div class="collapse navbar-collapse" id="navbarSupportedContent">
	    <ul class="navbar-nav mr-auto">
		    <security:authorize access="isAuthenticated()">
				<li class="nav-item">
				  <a class="nav-link" href="<c:url value="produtos"></c:url>">Lista Produto <span class="sr-only">(current)</span></a>
				</li>
			</security:authorize>
			<security:authorize access="hasRole('ROLE_ADMIN')">
				<li class="nav-item">
				  <a class="nav-link" href="<c:url value="produtos/form"></c:url>">Cadastro</a>
				</li>				
			</security:authorize>
		</ul>
		<security:authorize access="isAuthenticated()">
		    <form class="form-inline my-2 my-lg-0">
				<a class="nav-link" href="<c:url value="carrinho"></c:url>" >Carrinho (${carrinhoCompras.quantidade}) </a>
		    </form>
			<ul class="nav navbar-nav navbar-right">
			  <li>
					<a href="#">
					    <security:authentication property="principal" var="usuario"/>
						Usuário: ${usuario.username}
					</a>
			  </li>
			</ul>			    
	    </security:authorize>			
	</div>
</nav>