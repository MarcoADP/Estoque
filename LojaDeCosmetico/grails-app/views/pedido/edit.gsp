<%@ page import="loja.Pedido" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'pedido.label', default: 'Pedido')}" />
		<title><g:message code="default.edit.label" args="[entityName]" /></title>
	</head>
	<body>
		%{--<a href="#edit-pedido" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>--}%
		<div class="page-header" role="navigation">
			<a class="btn btn-info" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a>
			<g:link class="btn btn-info" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link>
			<g:link class="btn btn-info" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link>
		</div>
		<div id="edit-pedido" role="main">
			<h1 class="titulo-crud"><g:message code="default.edit.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
				<div class="alert alert-success" role="status">${flash.message}</div>
			</g:if>
			<g:hasErrors bean="${pedidoInstance}">
				<div class="alert alert-danger">
					<ul class="errors" role="alert">
						<g:eachError bean="${pedidoInstance}" var="error">
						<li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
						</g:eachError>
					</ul>
				</div>
			</g:hasErrors>
			<g:form url="[resource:pedidoInstance, action:'update']" method="PUT"  class="form-horizontal">
				<g:hiddenField name="version" value="${pedidoInstance?.version}" />

				<g:render template="form"/>

				<hr>
				<fieldset class="buttons">
					<g:actionSubmit class="btn btn-success" action="update" value="${message(code: 'default.button.update.label', default: 'Update')}" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
