<%@ tag language="java" pageEncoding="UTF-8"%>
<%@ attribute name="titulo" required="true" %>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="s"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="security" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd"> 
<head>
	<meta http-equiv="Content-Type"  charset="UTF-8" />		
	<title>
		Casa do Código
		<c:if test="${not empty titulo}">
			- ${titulo }
		</c:if>
	</title>
</head>

<%@ include file="/WEB-INF/view/cabecalho.jsp" %>

<jsp:doBody/>