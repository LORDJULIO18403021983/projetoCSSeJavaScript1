<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib prefix="f" uri="http://java.sun.com/jsf/core"%>
<%@taglib prefix="h" uri="http://java.sun.com/jsf/html"%>
<%@taglib prefix="rich" uri="http://richfaces.org/rich"%>
<%@taglib prefix="a4j" uri="http://richfaces.org/a4j"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="ISO-8859-1">
	<title>Consulta Cliente</title>
</head>
<body>
<f:view>
	<jsp:include page="/WebContent/menu.jsp"/>
	<h:form>
		<h1>Consulta de Cliente</h1>

		<h:panelGrid columns="1">
			<h:messages/>
		</h:panelGrid>

		<h:panelGrid columns="2">
			<h:outputText value="Nome"/>
			<h:inputText value="#{clienteController.cliente.nome}" maxlength="45" size="40"/>
			</h:panelGrid>
			
			<h:panelGrid columns="1">
				<h:commandButton value="Pesquisar Cliente" action="#{clienteController.clientePesquisar}" />
			</h:panelGrid>
			
			<h:panelGrid columns="1" width="410">
				<rich:dataTable id="listaCliente" value="#{clienteController.listaCliente}" var="cliente" width="200%">
				
				<f:facet name="caption">
					<h:outputText value="..::lista de clientes::.." />
				</f:facet>
				<f:facet name="header">
					<rich:columnGroup>
						<rich:column>
							<h:outputText value="Código"/>
						</rich:column>
						<rich:column>
							<h:outputText value="Nome" />
						</rich:column>
						<rich:column>
							<h:outputText value="Idade" />
						</rich:column>
						<rich:column>
							<h:outputText value="Endereco" />
						</rich:column>
						<rich:column>
							<h:outputText value="Cidade" />
						</rich:column>
						<rich:column>
							<h:outputText value="Estado" />
						</rich:column>
						<rich:column colspan="2">
							<h:outputText value="Ações"/>
						</rich:column>
					</rich:columnGroup>
				</f:facet>
				
				<rich:column>
					<h:outputText value="#{cliente.codigo}" />
				</rich:column>
				<rich:column>
					<h:outputText value="#{cliente.nome}" />
				</rich:column>
				<rich:column>
					<h:outputText value="#{cliente.idade}" />
				</rich:column>					
				<rich:column>
					<h:outputText value="#{cliente.endereco}" />
				</rich:column>					
				<rich:column>
					<h:outputText value="#{cliente.cidade}" />
				</rich:column>					
				<rich:column>
					<h:outputText value="#{cliente.estado}" />
				</rich:column>	
				     <rich:column>
					   <h:commandLink  
							value="Alterar" 
							action="#{clienteController.clienteAlterar}">
							<f:setPropertyActionListener 
							value="#{cliente}" 
							target="#{clienteController.clienteSelecionado}" />
						</h:commandLink>
				     </rich:column>
											
				     <rich:column>
						<a4j:commandLink  
							value="Excluir" 
							action="#"
							onclick="Richfaces.showModalPanel('modalExcluirCliente')"
							>
							<f:setPropertyActionListener 
							value="#{cliente}" 
							target="#{clienteController.clienteSelecionado}" />
						</a4j:commandLink>
				    </rich:column>						
				</rich:dataTable>
			</h:panelGrid>
		</h:form>
		
		<rich:modalPanel height="70" width="150" id="modalExcluirCliente">
			<f:facet name="header">
				<h:outputText value="Excluir Cliente" />
			</f:facet>
			<a4j:form id="formExclusao">
				<h:panelGrid columns="2">
					<a4j:commandButton value="Sim"
						action="#{clienteController.clienteExcluir}"
						onclick="Richfaces.hideModalPanel('modalExcluirCliente')"
						reRender="listaCliente">
					</a4j:commandButton>
					<a4j:commandButton value="Não" action="#"
									   onclick="Richfaces.hideModalPanel('modalExcluirCliente')">
					</a4j:commandButton>
				</h:panelGrid>
			</a4j:form>
		</rich:modalPanel>		
	</f:view>
	<a href="index.faces">Voltar</a><br>
	<a href="http://localhost:8080/ServerFaces/index.faces">Voltar2</a>
</body>
</html>