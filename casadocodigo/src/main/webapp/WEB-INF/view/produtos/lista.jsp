<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="s" %>
<c:set var="contextPath" value="produtos"/>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" charset="UTF-8">
<title>Livros de java, Android, Iphone, PHP, Ruby e muito mais - Casa do código</title>
<c:url value="/resources" var="pathResource"></c:url>
<link rel="stylesheet" href="${pathResource }/css/bootstrap.min.css" />
<link rel="stylesheet" href="${pathResource }/css/bootstrap-theme.min.css" />
<script src="${pathResource }/js/bootstrap.min.js"></script>
<script src="${pathResource }/js/util.js"></script>
<script src="${pathResource }/js/jquery-3.2.1.slim.min.js"></script>
</head>
<body>
	<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
		<a class="navbar-brand" href="${ s:mvcUrl('HC#index').build() }">Casa do código</a>
		<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
		  <span class="navbar-toggler-icon"></span>
		</button>
		<div class="collapse navbar-collapse" id="navbarSupportedContent">
		    <ul class="navbar-nav mr-auto">
		      <li class="nav-item">
		        <a class="nav-link" href="${ s:mvcUrl('PC#listaProdutos').build() }">Lista Produto <span class="sr-only">(current)</span></a>
		      </li>
		      <li class="nav-item">
		        <a class="nav-link" href="${ s:mvcUrl('PC#form').build() }">Cadastro</a>
		      </li>
			</ul>
		    <form class="form-inline my-2 my-lg-0">
				<a class="nav-link" href="${ s:mvcUrl('CCC#itens').build() }" >Carrinho (${carrinhoCompras.quantidade}) </a>
		    </form>			
		</div>
	</nav>
	<div class="container">
		<h2>Lista de Livros</h2>	
		<h4> ${mensagem}</h4>
		
	    <table class="table table-bordered table-striped table-hover">
	        <tr>
	            <th>Título</th>
	            <th>Descrição</th>
	            <th>Páginas</th>
	            <th>Data</th>
	            <th>Possui Arquivo</th>
	        </tr>
	        <c:forEach items="${produtos}" var="produto" varStatus="status">        	
				<tr>
					<td>${produto.titulo }</td>
					<td>${produto.descricao }</td>
					<td>${produto.paginas }</td>
					<td>
						<fmt:formatDate value="${produto.dataLancamento.time }" pattern="dd/MM/yyyy" />
					</td>
					<td>
						<a href="${contextPath}/detalhe/${produto.id}" class="nav-link">Consultar</a>
					</td>
				</tr>
	        </c:forEach>
	    </table>
	</div>	        
</body>
</html>