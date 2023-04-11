<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib prefix="f" uri="http://java.sun.com/jsf/core"%>
<%@taglib prefix="h" uri="http://java.sun.com/jsf/html"%>
<%@taglib prefix="rich" uri="http://richfaces.org/rich"%>
<%@taglib prefix="a4j" uri="http://richfaces.org/a4j"%>
<%@ page import="java.sql.*, java.util.*, br.com.orbit.serverfaces.dao.*,
br.com.orbit.serverfaces.backingbean.*,br.com.orbit.serverfaces.bean.*,br.com.orbit.serverfaces.util.*" %>
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
								<rich:column colspan="2">
									<h:outputText value="Ações" />
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
						<rich:column>
							<h:commandLink  
								value="Alterar" 
								action="#{filmeController.filmeAlterar}">
								<f:setPropertyActionListener 
								value="#{filme}" 
								target="#{filmeController.filmeSelecionado}" />
							</h:commandLink>
						</rich:column>
											
						<rich:column>
							<a4j:commandLink  
								value="Excluir" 
								action="#"
								onclick="Richfaces.showModalPanel('modalExcluirFilme')"
								>
								<f:setPropertyActionListener 
									value="#{filme}" 
									target="#{filmeController.filmeSelecionado}" />
							</a4j:commandLink>
						</rich:column>									
				</rich:dataTable>
			</h:panelGrid>
		</h:form>

		<rich:modalPanel height="70" width="150" id="modalExcluirFilme">
			<f:facet name="header">
				<h:outputText value="Excluir Filme" />
			</f:facet>
			<a4j:form id="formExclusao">
				<h:panelGrid columns="2">
					<a4j:commandButton value="Sim"
						action="#{filmeController.filmeExcluir}"
						onclick="Richfaces.hideModalPanel('modalExcluirFilme')"
						reRender="listaFilme">
					</a4j:commandButton>
					<a4j:commandButton value="Não" action="#"
						onclick="Richfaces.hideModalPanel('modalExcluirFilme')">
					</a4j:commandButton>
				</h:panelGrid>
			</a4j:form>
		</rich:modalPanel>
	</f:view>
	<a href="index.faces">Voltar</a><br>
	<a href="http://localhost:8080/ServerFaces/index.faces">Voltar2</a>
</body>
</html>