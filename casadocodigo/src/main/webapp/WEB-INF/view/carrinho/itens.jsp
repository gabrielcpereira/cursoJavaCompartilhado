<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="s" %>
<html>
<head>
<meta http-equiv="Content-Type" charset="UTF-8">
<title>Insert title here</title>
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
	<h3>${mensagem }</h3>
	<c:if test="${ carrinhoCompras.getQuantidadeItens() > 0}">
		<h1>Itens do carrinho</h1>
		<h3>${mensagem }</h3>
		<table class="table table-hover">
			<tr>
				<th>Titulo</th>
				<th>Quantidade</th>
				<th>Tipo</th>
				<th>Preço</th>
				<th></th>
			</tr>
			<c:forEach items="${carrinhoCompras.getItens() }" var="item" >
				<tr>
					<td>${item.produto.titulo }</td>
					<td>
						<input type="number" min="0" id="quantidade" name="quantidade" value="${carrinhoCompras.getQuantidade(item) }" />					
					</td>	
					<td>
						${item.tipoPreco }
					</td>			
					<td>${carrinhoCompras.getTotal(item)}</td>
					<th>
					    <form id="form_${item.produto.id }" action="${s:mvcUrl('CCC#remover').arg(0, item.produto.id).arg(1,item.tipoPreco).build() }" method="post">
					    	<a href="javascript:document.getElementById('form_${item.produto.id }').submit()">Excluir Item</a>
					    </form>					
					</th>
				</tr>
			</c:forEach>
		</table>
		<form action="${ s:mvcUrl('PC#finalizar').build() }" method="post">
			<div>
				<input type="submit" class="btn btn-primary" value="Finalizar Compra">
			</div>
		</form>
	</c:if>
	<c:if test="${ carrinhoCompras.getQuantidadeItens() == 0}">
		<h3>Carrinho sem produtos <a href='produtos'>clique aqui</a> para adicionar</h3>
	</c:if>
	</div>
</body>
</html>