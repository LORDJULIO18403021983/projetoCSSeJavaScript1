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
					<rich:dropDownMenu value="Cadastro">
							<rich:menuItem id="menu1" value="Cliente"
								action="#{clienteController.cadastrarMenu}">
							</rich:menuItem>
							<rich:menuItem id="menu2" value="Filme"
								action="#{filmeController.cadastrarMenu}">
							</rich:menuItem>						
							<rich:menuItem id="menu3" value="Vendedor"
								action="#{vendedorController.cadastrarMenu}">
							</rich:menuItem>						
					</rich:dropDownMenu>
					<rich:dropDownMenu value="Consulta">
							<rich:menuItem id="menu4" value="Cliente"
								action="#{clienteController.consultarMenu}">
							</rich:menuItem>
							<rich:menuItem id="menu5" value="Filme"
								action="#{filmeController.consultarMenu}">
							</rich:menuItem>
					</rich:dropDownMenu>
					<rich:dropDownMenu value="Imagens CSS">
							<rich:menuItem id="menu6" value="Imagens css"
								action="#">
							</rich:menuItem>
							<rich:menuItem id="menu7" value="Botões"
								action="#">
							</rich:menuItem>
					</rich:dropDownMenu>
				</rich:toolBar>
			</h:form>
		</f:subview>
	</div>
	<a href = "http://localhost:8080/ServerFaces/imagensCSS.html">Imagens CSS</a><br><br>
	<a href = "http://localhost:8080/ServerFaces/botao.html">Botão CSS</a><br><br>
</body>
</html>