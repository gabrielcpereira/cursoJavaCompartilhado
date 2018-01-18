<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <%@ taglib uri = "http://java.sun.com/jsp/jstl/fmt" prefix ="fmt" %>
    <%@ taglib uri="http://www.springframework.org/tags" prefix="s"%>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="UTF-8">
<title>Casa do código - ${produto.titulo }</title>

<script type="text/javascript" >

	function addCarrinho(){
		$().redirect('adicionar');
	}

</script>
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
	    <form action='<c:url value="/carrinho/add" />' method="post" class="container">
	    	
			<input type="hidden" name="idProduto" value="${produto.id }">
			<h2>${produto.titulo }</h2>
			<div>
				Descrição: 
			</div>
			<div>
				${produto.descricao }
			</div>
			<br/>
			<c:if test="${produto.dataLancamento.time != null }">
				<div>Data Lançamento:</div>
				<div>
					<fmt:formatDate value="${produto.dataLancamento.time }" pattern="dd/MM/yyyy"  />
				</div>
			</c:if>
			<br/>
			<div>Paginas:</div>
			<div>
				<fmt:formatNumber value="${produto.paginas }" ></fmt:formatNumber>		
			</div>
			<br/>
			<div>Preços:</div>
			<div>		
				<ul>
					<c:forEach items="${produto.precos }" var="preco" varStatus="status">				
						<li>
							${preco.tipo } : ${preco.valor } <input type="radio" name="tipo" value="${preco.tipo }">
						</li>
					</c:forEach>		
				</ul>
				<c:if test="${mensagemValidacaoTipo != null }">
					${mensagemValidacaoTipo }
				</c:if>
			</div>
			<input type="submit" class="btn btn-primary" value="Adicionar" />
		</form>
	</div>
</body>
</html>