<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="s"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Livros de Java, Android, iPhone, Ruby, PHP e muito mais - Casa do Código</title>
<style type="text/css">
	ul {
		list-style-type: none;
	}

	li {
		text-align:center;
	    float: left;
	}

	
</style>
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
	    <h1>Casa do Código</h1>
	    <div class="album text-muted">
	    	<div class="container">
	    		<div class="row">
		    		<c:forEach items="${produtos}" var="produto">
		    			<div class="card" >
		    				<input type="image" style="width: 100%;height: 280px;" src="https://images-na.ssl-images-amazon.com/images/I/51tjK8swIOL.jpg">&nbsp;&nbsp;		    			
			    			<p class="card-text" style="text-align: center;">
			    				<a href="${s:mvcUrl('PC#detalhesProduto').arg(0, produto.id).build() }" >${produto.titulo } </a>
			    			</p>
		    			</div>
		    		</c:forEach>
	    		</div>
	    	</div>
	    </div>	    
    </div>
</body>
</html>