<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@taglib prefix="f" uri="http://java.sun.com/jsf/core" %>
    <%@taglib prefix="h" uri="http://java.sun.com/jsf/html" %>
    <%@taglib prefix="rich" uri="http://richfaces.org/rich" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Server Faces</title>
</head>
<body>
	<div>
		<f:subview id="view">
			<h:form id="tbPrincipal">
				<rich:toolBar>
					<rich:dropDownMenu value="Cadastro Filme">
						<rich:menuItem id="menu1" value="Filme"
						action="#{filmeController.cadastrarMenu}"></rich:menuItem>
					</rich:dropDownMenu>
					<rich:dropDownMenu value="Consulta Filme">
						<rich:menuItem id="menu2" value="Filme"
						action="#{filmeController.consultarMenu}"></rich:menuItem>
					</rich:dropDownMenu>
					<rich:dropDownMenu value="Cadastro Cliente">
						<rich:menuItem id="menu3" value="Cliente"
						action="#{clienteController.cadastrarMenu}"></rich:menuItem>
					</rich:dropDownMenu>
					<rich:dropDownMenu value="Consulta Cliente">
						<rich:menuItem id="menu4" value="Cliente"
						action="#{clienteController.consultarMenu}"></rich:menuItem>
					</rich:dropDownMenu>
				</rich:toolBar>
			</h:form>
		</f:subview>
	</div>
</body>
</html>