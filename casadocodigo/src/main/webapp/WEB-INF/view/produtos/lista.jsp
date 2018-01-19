<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="s" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="security" %>
<c:set var="contextPath" value="produtos"/>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" charset="UTF-8">
<title>Livros de java, Android, Iphone, PHP, Ruby e muito mais - Casa do código</title>
</head>
<body>
	<%@ include file="/WEB-INF/view/cabecalho.jsp" %>
	
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