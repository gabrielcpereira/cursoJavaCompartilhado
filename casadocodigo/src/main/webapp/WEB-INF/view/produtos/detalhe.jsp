<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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

</head>
<body>
    <form action='<c:url value="/carrinho/add" />' method="post" class="container">
    	<a href="/cart" rel="nofollow">Carrinho (${carrinhoCompras.quantidade}) </a>
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
		</div>
		<input type="submit" value="Adicionar" />
	</form>
</body>
</html>