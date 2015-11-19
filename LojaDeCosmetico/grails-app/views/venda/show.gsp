
<%@ page import="loja.Venda" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'venda.label', default: 'Venda')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-venda" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-venda" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list venda">
			
				<g:if test="${vendaInstance?.codVenda}">
				<li class="fieldcontain">
					<span id="codVenda-label" class="property-label"><g:message code="venda.codVenda.label" default="Cod Venda" /></span>
					
						<span class="property-value" aria-labelledby="codVenda-label"><g:fieldValue bean="${vendaInstance}" field="codVenda"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${vendaInstance?.precoTotal}">
				<li class="fieldcontain">
					<span id="precoTotal-label" class="property-label"><g:message code="venda.precoTotal.label" default="Preco Total" /></span>
					
						<span class="property-value" aria-labelledby="precoTotal-label"><g:fieldValue bean="${vendaInstance}" field="precoTotal"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${vendaInstance?.cliente}">
				<li class="fieldcontain">
					<span id="cliente-label" class="property-label"><g:message code="venda.cliente.label" default="Cliente" /></span>
					
						<span class="property-value" aria-labelledby="cliente-label"><g:link controller="cliente" action="show" id="${vendaInstance?.cliente?.id}">${vendaInstance?.cliente?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${vendaInstance?.status}">
				<li class="fieldcontain">
					<span id="status-label" class="property-label"><g:message code="venda.status.label" default="Status" /></span>
					
						<span class="property-value" aria-labelledby="status-label"><g:fieldValue bean="${vendaInstance}" field="status"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${vendaInstance?.dataVenda}">
				<li class="fieldcontain">
					<span id="dataVenda-label" class="property-label"><g:message code="venda.dataVenda.label" default="Data Venda" /></span>
					
						<span class="property-value" aria-labelledby="dataVenda-label"><g:formatDate date="${vendaInstance?.dataVenda}" /></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form url="[resource:vendaInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:link class="edit" action="edit" resource="${vendaInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
