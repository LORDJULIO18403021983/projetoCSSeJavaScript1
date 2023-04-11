<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@taglib prefix="f"uri="http://java.sun.com/jsf/core" %>
    <%@taglib prefix="h"uri="http://java.sun.com/jsf/html" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Altera��o de Filme</title>
<link rel="stylesheet" href="CSS2/estilo2.css">
</head>
<body>
	<f:view>
		<jsp:include page="/menu.jsp"/>
		<h:form>
			<h1>Altera��o de Filme</h1>
			<a href="index.faces">Voltar</a><br>			
			<a href="http://localhost:8080/ServerFaces/index.faces">Voltar2</a> 			
			<h:panelGrid columns="1">
				<h:messages />
			</h:panelGrid>
			
			<h:panelGrid columns="2">
				<h:outputText value="* nome:"/>
				<h:inputText value="#{filmeController.filmeSelecionado.nome}"maxlength="40"size="40" />
				
				<h:outputText value="* valor:"/>
				<h:inputText value="#{filmeController.filmeSelecionado.valor}"maxlength="8"size="15" />
				
				<h:outputText value="* G�nero:"/>
				<h:inputText value="#{filmeController.filmeSelecionado.genero}"maxlength="40"size="40" />
				
				<h:outputText value="* Status:"/>			
				<h:selectOneRadio value="#{filmeController.filmeSelecionado.status}">
					<f:selectItems value="#{filmeController.listaStatusFilme}" />
				</h:selectOneRadio>
				
				<h:commandButton action="#{filmeController.alterar}" value="Alterar" />
				<h:commandButton action="#{filmeController.voltar}" value="Cancelar" />
			</h:panelGrid>		
		</h:form>
	</f:view>
</body>
</html>