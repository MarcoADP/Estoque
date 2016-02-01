
<%@ page import="loja.Cliente" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<meta charset="UTF-8">
		<g:set var="entityName" value="${message(code: 'cliente.label', default: 'Cliente')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		%{--<a href="#show-cliente" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>--}%
		<div class="page-header" role="navigation">
			<a class="btn btn-info" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a>
			<g:link class="btn btn-info" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link>
			<g:link class="btn btn-info" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link>
		</div>
		<div id="show-cliente" role="main">
			<h1 class="titulo-crud"><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
				<div class="alert alert-success" role="status">${flash.message}</div>
			</g:if>
			<div class="row bs-callout bs-callout-info">
			<form class="form-horizontal">
			
				<g:if test="${clienteInstance}">
				<div class="form-group">
					<label id="nome-label" class="col-sm-3 col-md-2 col-lg-1 control-label"><g:message code="cliente.nome.label" default="Nome" /></label>
					<div class="col-xs-4">
					
						<p class="form-control-static" aria-labelledby="nome-label"><g:fieldValue bean="${clienteInstance}" field="nome"/></p>
					
					</div>
				</div>
				</g:if>
			
				<g:if test="${clienteInstance}">
				<div class="form-group">
					<label id="cpf-label" class="col-sm-3 col-md-2 col-lg-1 control-label"><g:message code="cliente.cpf.label" default="Cpf" /></label>
					<div class="col-xs-4">
					
						<p class="form-control-static" aria-labelledby="cpf-label"><g:fieldValue bean="${clienteInstance}" field="cpf"/></p>
					
					</div>
				</div>
				</g:if>
			
				<g:if test="${clienteInstance}">
				<div class="form-group">
					<label id="endereco-label" class="col-sm-3 col-md-2 col-lg-1 control-label"><g:message code="cliente.endereco.label" default="Endereco" /></label>
					<div class="col-xs-4">
					
						<p class="form-control-static" aria-labelledby="endereco-label"><g:fieldValue bean="${clienteInstance}" field="endereco"/></p>
					
					</div>
				</div>
				</g:if>
			
				<g:if test="${clienteInstance}">
				<div class="form-group">
					<label id="telefone-label" class="col-sm-3 col-md-2 col-lg-1 control-label"><g:message code="cliente.telefone.label" default="Telefone" /></label>
					<div class="col-xs-4">
					
						<p class="form-control-static" aria-labelledby="telefone-label"><g:fieldValue bean="${clienteInstance}" field="telefone"/></p>
					
					</div>
				</div>
				</g:if>
			
				<g:if test="${clienteInstance}">
				<div class="form-group">
					<label id="dataNascimento-label" class="col-sm-3 col-md-2 col-lg-1 control-label"><g:message code="cliente.dataNascimento.label" default="Data Nascimento" /></label>
					<div class="col-xs-4">
					
						<p class="form-control-static" aria-labelledby="dataNascimento-label"><g:formatDate date="${clienteInstance?.dataNascimento}" /></p>
					
					</div>
				</div>
				</g:if>
			
				<g:if test="${clienteInstance}">
				<div class="form-group">
					<label id="idade-label" class="col-sm-3 col-md-2 col-lg-1 control-label"><g:message code="cliente.idade.label" default="Idade" /></label>
					<div class="col-xs-4">
					
						<p class="form-control-static" aria-labelledby="idade-label"><g:fieldValue bean="${clienteInstance}" field="idade"/></p>
					
					</div>
				</div>
				</g:if>
			
				<g:if test="${clienteInstance}">
				<div class="form-group">
					<label id="dateCreated-label" class="col-sm-3 col-md-2 col-lg-1 control-label"><g:message code="cliente.dateCreated.label" default="Date Created" /></label>
					<div class="col-xs-4">
					
						<p class="form-control-static" aria-labelledby="dateCreated-label"><g:formatDate date="${clienteInstance?.dateCreated}" /></p>
					
					</div>
				</div>
				</g:if>
			
			</form>
			</div>
			<hr>
			<g:form url="[resource:clienteInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:link class="btn btn-primary" action="edit" resource="${clienteInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<a href="#DeleteModal" class="btn btn-danger" data-toggle="modal"><g:message code="default.button.delete.label" default="Delete" /></a>
				</fieldset>
			</g:form>
		</div>
	<g:render template="/layouts/deleteModal" model="[item: item]"/>
	</body>
</html>
