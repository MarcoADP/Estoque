
<%@ page import="loja.Fornecedor" %>
<!DOCTYPE html>
<html>
		<head>
			<meta name="layout" content="main">
			<meta charset="UTF-8">
			<g:set var="entityName" value="${message(code: 'fornecedor.label', default: 'Fornecedor')}" />
			<title><g:message code="default.show.label" args="[entityName]" /></title>
		</head>
		<body>
			%{--<a href="#show-fornecedor" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>--}%
			<div class="page-header" role="navigation">
				<a class="btn btn-info" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a>
				<g:link class="btn btn-info" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link>
				<g:link class="btn btn-info" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link>
			</div>
			<div id="show-fornecedor" role="main">
				<h1 class="titulo-crud"><g:message code="default.show.label" args="[entityName]" /></h1>
				<g:if test="${flash.message}">
					<div class="alert alert-success" role="status">${flash.message}</div>
				</g:if>
				<div class="row bs-callout bs-callout-info">
					<form class="form-horizontal">

						<g:if test="${fornecedorInstance}">
						<div class="form-group">
							<label id="nome-label" class="col-sm-3 col-md-2 col-lg-1 control-label"><g:message code="fornecedor.nome.label" default="Nome" /></label>
							<div class="col-xs-4">
								<p class="form-control-static" aria-labelledby="nome-label"><g:fieldValue bean="${fornecedorInstance}" field="nome"/></p>

							</div>
						</div>
						</g:if>

						<g:if test="${fornecedorInstance}">
						<div class="form-group">
							<label id="cnpj-label" class="col-sm-3 col-md-2 col-lg-1 control-label"><g:message code="fornecedor.cnpj.label" default="Cnpj" /></label>
							<div class="col-xs-4">

								<p class="form-control-static" aria-labelledby="cnpj-label"><g:fieldValue bean="${fornecedorInstance}" field="cnpj"/></p>

							</div>
						</div>
						</g:if>

						<g:if test="${fornecedorInstance}">
						<div class="form-group">
							<label id="codFor-label" class="col-sm-3 col-md-2 col-lg-1 control-label"><g:message code="fornecedor.codFor.label" default="Cod For" /></label>
							<div class="col-xs-4">

								<p class="form-control-static" aria-labelledby="codFor-label"><g:fieldValue bean="${fornecedorInstance}" field="codFor"/></p>

							</div>
						</div>
						</g:if>

						<g:if test="${fornecedorInstance}">
						<div class="form-group">
							<label id="empresa-label" class="col-sm-3 col-md-2 col-lg-1 control-label"><g:message code="fornecedor.empresa.label" default="Empresa" /></label>
							<div class="col-xs-4">

								<p class="form-control-static" aria-labelledby="empresa-label"><g:fieldValue bean="${fornecedorInstance}" field="empresa"/></p>

							</div>
						</div>
						</g:if>

					</form>
				</div>
				<hr>
				<g:form url="[resource:fornecedorInstance, action:'delete']" method="DELETE">
					<fieldset class="buttons">
						<g:link class="btn btn-primary" action="edit" resource="${fornecedorInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
						<a href="#DeleteModal" class="btn btn-danger" data-toggle="modal"><g:message code="default.button.delete.label" default="Delete" /></a>
					</fieldset>
				</g:form>
			</div>
		<g:render template="/layouts/deleteModal" model="[item: item]"/>
		</body>
</html>
