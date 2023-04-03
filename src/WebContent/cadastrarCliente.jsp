<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@taglib prefix="f"uri="http://java.sun.com/jsf/core" %>
    <%@taglib prefix="h"uri="http://java.sun.com/jsf/html" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Cadastro de Cliente</title>
</head>
<body>
	<f:view>
		<jsp:include page="/WebContent/menu.jsp"/>
		<h:form>
			<h1>Cadastro de Cliente</h1>
			<a href="index.faces">Voltar</a><br>			
			<a href="http://localhost:8080/ServerFaces/index.faces">Voltar</a>			
			<h:panelGrid columns="1">
				<h:messages />
			</h:panelGrid>
			
			<h:panelGrid columns="2">
				<h:outputText value="* nome"/>
				<h:inputText value="#{clienteController.cliente.nome}"maxlength="40"size="40" />
				
				<h:outputText value="* idade"/>
				<h:inputText value="#{clienteController.cliente.idade}"maxlength="3"size="15" />
				
				<h:outputText value="* endereco"/>
				<h:inputText value="#{clienteController.cliente.endereco}"maxlength="40"size="40" />
				
				<h:outputText value="* cidade"/>
				<h:inputText value="#{clienteController.cliente.cidade}"maxlength="20"size="20" />
				
				<h:outputText value="* estado"/>
				<h:inputText value="#{clienteController.cliente.estado}"maxlength="5"size="15" />
				
				<h:commandButton action="#{clienteController.salvar}" value="Cadastrar" />
				<h:commandButton action="#{clienteController.voltar}" value="Cancelar" />
			</h:panelGrid>		
		</h:form>
	</f:view>
</body>
</html>