<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@taglib prefix="f"uri="http://java.sun.com/jsf/core" %>
    <%@taglib prefix="h"uri="http://java.sun.com/jsf/html" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Cadastro de Vendedor</title>
	<script type="text/javascript">
		function masc_salario(objeto){
			var numero="";
			var padrao=/\D/g;

			numero=objeto.value.replace(padrao,"");
			objeto.value=numero;
			}

		function masc_cep(objeto){
			var retorno="";
			var numero;
			var padrao=/\D/g;

			numero=objeto.value.replace(padrao,"");

			parte1=numero.substr(0,2);
			if(parte1.length>0)
				retorno=parte1;

			parte2=numero.substr(2,3);
			if(parte2.length>0)
				retorno+="." + parte2;

			parte3=numero.substr(5,3);
			if(parte3.length>0)
				retorno+="-" + parte3;

			objeto.value=retorno;			
			}
		
		function masc_cpf(objeto){
			var retorno="";
			var numero;
			var padrao=/\D/g;

			numero=objeto.value.replace(padrao,"");

			parte1=numero.substr(0,3);
			if(parte1.length>0)
				retorno=parte1;

			parte2=numero.substr(3,3);
			if(parte2.length>0)
				retorno+="." + parte2;

			parte3=numero.substr(6,3);
			if(parte3.length>0)
				retorno+="." + parte3
				;
			parte4=numero.substr(9,2);
			if(parte4.length>0)
				retorno+="-" + parte4;

			objeto.value=retorno;			
			}
	</script>
</head>
<body>
	<f:view>
		<jsp:include page="/menu.jsp"/>
		<h:form>
			<h1>Cadastro de Vendedor</h1>
			<a href="index.faces">Voltar</a><br>			
			<a href="http://localhost:8080/ServerFaces/index.faces">Voltar</a>			
			<h:panelGrid columns="1">
				<h:messages />
			</h:panelGrid>
			
			<h:panelGrid columns="2">
				<h:outputText value="* nome"/>
				<h:inputText value="#{vendedorController.vendedor.nome}"maxlength="40"size="40" />
				
				<h:outputText value="* idade"/>
				<h:inputText value="#{vendedorController.vendedor.idade}"maxlength="3"size="15" onkeyup="masc_salario(this);">
				</h:inputText>
				
				
				<h:outputText value="* cep"/>
				<h:inputText value="#{vendedorController.vendedor.cep}"maxlength="10"size="40" onkeyup="masc_cep(this);">
				</h:inputText>
				
				<h:outputText value="* cpf"/>
				<h:inputText value="#{vendedorController.vendedor.cpf}"maxlength="15"size="20" onkeyup="masc_cpf(this);">
				</h:inputText>
			
				
				<h:commandButton action="#{vendedorController.salvar}" value="Cadastrar" />
				<h:commandButton action="#{vendedorController.voltar}" value="Cancelar" />
			</h:panelGrid>		
		</h:form>
	</f:view>	
</body>
</html>