<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="s" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="security" %>
<%@ taglib tagdir="/WEB-INF/tags/" prefix="tag"  %>
	
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="UTF-8">
</head>
<body>
	<tag:master titulo="Cadastro de Produtos" >
		<form:form action="${ s:mvcUrl('PC#gravar').build() }" cssClass="container" cssStyle="padding-top:20px;padding-bottom: 20px;" method="post" commandName="produto" enctype="multipart/form-data">
				<input type="hidden" name="${_csrf.parameterName }" value="${_csrf.token }">
			    <div class="form-group">
			        <label>Título</label> 
			        <form:input class="form-control form-control-sm" path="titulo" />
			        <form:errors path="titulo" />
			    </div>
			    <div class="form-group">
			        <label>Descricao</label>
			        <form:textarea class="form-control form-control-sm" rows="10" cols="20" path="descricao" />
			        <form:errors path="descricao" />
			    </div>
			    <div class="form-group">
			        <label>Páginas</label>
			        <form:input class="form-control form-control-sm" path="paginas" />
			        <form:errors path="paginas" /> 
			    </div>
			    <div class="form-group">
			        <label>Data de Lançamento</label>
			        <form:input class="form-control form-control-sm" path="dataLancamento" />
			        <form:errors path="dataLancamento" />
			    </div>
				<div class="form-group">
				    <label>Sumário</label>
				    <input name="sumario" class="form-control-file" type="file" />
				</div>
			    <c:forEach items="${tiposPreco}" var="tipoPreco" varStatus="status">
				    <div class="form-group">	 		        
			            <label>${tipoPreco}</label> 
			            <form:input class="form-control form-control-sm" path="precos[${status.index}].valor" /> 
			            <form:hidden path="precos[${status.index}].tipo" value="${tipoPreco}" />
				    </div>
			    </c:forEach>
			    <button type="submit" class="btn btn-primary">Cadastrar</button>
		    
		</form:form>
	</tag:master>
</body>
</html>