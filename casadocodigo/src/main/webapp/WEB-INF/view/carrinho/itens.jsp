<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="s" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="security" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib tagdir="/WEB-INF/tags/" prefix="tag"  %>
<html>
<head>
<meta http-equiv="Content-Type" charset="UTF-8">
</head>
<body>
	<c:url value="produtos" var="produtos"></c:url>
	<c:url value="carrinho" var="carrinho"></c:url>	
	<tag:master titulo="${produto.titulo }" >	
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
						    <form:form id="form_${item.produto.id }" servletRelativeAction="${carrinho }/remover" methodParam="post">					    						    	
						    	<input type="hidden" name="idProduto" value="${item.produto.id }">
						    	<input type="hidden" name="tipo" value="${item.tipoPreco}">					    	
						    	<input type="hidden" name="${_csrf.parameterName }" value="${_csrf.token }">
						    	<a href="javascript:document.getElementById('form_${item.produto.id }').submit()">Excluir Item</a>
						    </form:form>					
						</th>
					</tr>
				</c:forEach>
			</table>
			<form:form servletRelativeAction="pagamento/finalizar" method="post">
				<input type="hidden" name="${_csrf.parameterName }" value="${_csrf.token }" />
				<div>
					<input type="submit" class="btn btn-primary" value="Finalizar Compra">
				</div>
			</form:form>
		</c:if>
		<c:if test="${ carrinhoCompras.getQuantidadeItens() == 0}">
			<h3>Carrinho sem produtos <a href='produtos'>clique aqui</a> para adicionar</h3>
		</c:if>
		</div>
	</tag:master>
</body>
</html>