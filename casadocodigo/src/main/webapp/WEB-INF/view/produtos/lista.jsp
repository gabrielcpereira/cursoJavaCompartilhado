<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Livros de java, Android, Iphone, PHP, Ruby e muito mais - Casa do código</title>
</head>
<body>
	<h1>Lista de livros cadastrados</h1>
	
	<div> ${sucesso}</div>
	
    <table style="border-width: 1;">
        <tr>
            <th>Título</th>
            <th>Descrição</th>
            <th>Páginas</th>
            <th>Data</th>
            <th>Possui Arquivo</th>
        </tr>
        <c:forEach items="${produtos}" var="produto">
        	<tr>
        		<td>${produto.titulo }</td>
        		<td>${produto.descricao }</td>
        		<td>${produto.paginas }</td>
        		<td>
        			<fmt:formatDate value="${produto.dataLancamento.time }" pattern="dd/MM/yyyy" />
        		</td>
        		<td>
        			<c:choose>
        				<c:when test="${produto.sumarioPath == null }">
        					Não
        				</c:when>
        				<c:otherwise>
        					<a href="${produto.sumarioPath}" target="_blank">Consultar Imagem</a>
        				</c:otherwise>
        			</c:choose>
        		</td>
        	</tr>
        </c:forEach>
    </table>
</body>
</html>