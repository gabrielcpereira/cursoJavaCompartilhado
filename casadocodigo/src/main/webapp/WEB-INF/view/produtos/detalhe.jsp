<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <%@ taglib uri = "http://java.sun.com/jsp/jstl/fmt" prefix ="fmt" %>
    <%@ taglib uri="http://www.springframework.org/tags" prefix="s"%>
    <%@ taglib uri="http://www.springframework.org/security/tags" prefix="security"%>
    <%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
	<%@ taglib tagdir="/WEB-INF/tags/" prefix="tag"  %>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="UTF-8">
</head>
<body>
	<tag:master titulo="${produto.titulo }" >	
		<div class="container">
		    <form:form servletRelativeAction="/carrinho/add" method="post" >	    	
				<input type="hidden" name="idProduto" value="${produto.id }">
	    		<input type="hidden" name="${_csrf.parameterName }" value="${_csrf.token }" />
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
			</form:form>
		</div>
	</tag:master>
</body>
</html>