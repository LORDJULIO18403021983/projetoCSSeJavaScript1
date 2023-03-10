<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib prefix="f" uri="http://java.sun.com/jsf/core"%>
<%@taglib prefix="h" uri="http://java.sun.com/jsf/html"%>
<%@taglib prefix="rich" uri="http://richfaces.org/rich"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Consulta Filme</title>
</head>
<body>
	<f:view>
		<jsp:include page="/menu.jsp" />
		<h:form>
			<h1>Consulta de Filme</h1>
			<a href="index.faces">Voltar</a><br>
			<a href="http://localhost:8080/ServerFaces/index.faces">Voltar</a>
			<h:panelGrid columns="1">
				<h:messages />
			</h:panelGrid>
			
			<h:panelGrid columns="2">
				<h:outputText value="Nome" />
				<h:inputText value="#{filmeController.filme.nome}" maxlength="45" size="40" />
			</h:panelGrid>
			
			<h:panelGrid columns="1">
				<h:commandButton value="Pesquisar Filme" action="#{filmeController.filmePesquisar}" />
			</h:panelGrid>
			
			<h:panelGrid columns="1" width="410">
				<rich:dataTable id="listaFilme" value="#{filmeController.listaFilme}" var="filme" width="100%">
				
				<f:facet name="caption">
					<h:outputText value="..::lista de filmes::.." />
				</f:facet>
				<f:facet name="header">
					<rich:columnGroup>
						<rich:column>
							<h:outputText value="Código" />
						</rich:column>
						<rich:column>
							<h:outputText value="Nome" />
						</rich:column>
						<rich:column>
							<h:outputText value="Genero" />
						</rich:column>
					</rich:columnGroup>
				</f:facet>
				
				<rich:column>
					<h:outputText value="#{filme.codigo}" />
				</rich:column>
				<rich:column>
					<h:outputText value="#{filme.nome}" />
				</rich:column>
				<rich:column>
					<h:outputText value="#{filme.genero}" />
				</rich:column>					
				</rich:dataTable>
			</h:panelGrid>
		</h:form>
	</f:view>
</body>
</html>