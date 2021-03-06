<%@page import="com.fasterxml.jackson.annotation.JsonInclude.Include"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="s"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="security" %>
<%@ taglib tagdir="/WEB-INF/tags/" prefix="tag"  %>

<html>	
	<tag:master titulo="Livros, acessórios, etc.." >
		<body>	
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
	</tag:master>
</html>