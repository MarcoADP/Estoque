
<%@ page import="loja.Produto" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<meta charset="UTF-8">
		<g:set var="entityName" value="${message(code: 'produto.label', default: 'Produto')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-produto" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-produto" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list produto">
			
				<g:if test="${produtoInstance?.codigo}">
				<li class="fieldcontain">
					<span id="codigo-label" class="property-label"><g:message code="produto.codigo.label" default="Codigo" /></span>
					
						<span class="property-value" aria-labelledby="codigo-label"><g:fieldValue bean="${produtoInstance}" field="codigo"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${produtoInstance?.nome}">
				<li class="fieldcontain">
					<span id="nome-label" class="property-label"><g:message code="produto.nome.label" default="Nome" /></span>
					
						<span class="property-value" aria-labelledby="nome-label"><g:fieldValue bean="${produtoInstance}" field="nome"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${produtoInstance?.preco}">
				<li class="fieldcontain">
					<span id="preco-label" class="property-label"><g:message code="produto.preco.label" default="Preco" /></span>
					
						<span class="property-value" aria-labelledby="preco-label"><g:fieldValue bean="${produtoInstance}" field="preco"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${produtoInstance?.quantidade}">
				<li class="fieldcontain">
					<span id="quantidade-label" class="property-label"><g:message code="produto.quantidade.label" default="Quantidade" /></span>
					
						<span class="property-value" aria-labelledby="quantidade-label"><g:fieldValue bean="${produtoInstance}" field="quantidade"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${produtoInstance?.dataFabricacao}">
				<li class="fieldcontain">
					<span id="dataFabricacao-label" class="property-label"><g:message code="produto.dataFabricacao.label" default="Data Fabricacao" /></span>
					
						<span class="property-value" aria-labelledby="dataFabricacao-label"><g:formatDate date="${produtoInstance?.dataFabricacao}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${produtoInstance?.dataVencimento}">
				<li class="fieldcontain">
					<span id="dataVencimento-label" class="property-label"><g:message code="produto.dataVencimento.label" default="Data Vencimento" /></span>
					
						<span class="property-value" aria-labelledby="dataVencimento-label"><g:formatDate date="${produtoInstance?.dataVencimento}" /></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form url="[resource:produtoInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:link class="edit" action="edit" resource="${produtoInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
