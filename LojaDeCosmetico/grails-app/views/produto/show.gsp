
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
		%{--<a href="#show-produto" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>--}%
		<div class="page-header" role="navigation">
			<a class="btn btn-info" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a>
			<g:link class="btn btn-info" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link>
			<g:link class="btn btn-info" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link>
		</div>
		<div id="show-produto" role="main">
			<h1 class="titulo-crud"><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
				<div class="alert alert-success" role="status">${flash.message}</div>
			</g:if>

			<div class="row bs-callout bs-callout-info">
			<form class="form-horizontal">
			
				<g:if test="${produtoInstance}">
				<div class="form-group">
					<label id="codigo-label" class="col-sm-3 col-md-2 col-lg-1 control-label"><g:message code="produto.codigo.label" default="Codigo" /></label>
					<div class="col-xs-4">
					
						<p class="form-control-static" aria-labelledby="codigo-label"><g:fieldValue bean="${produtoInstance}" field="codigo"/></p>
					
					</div>
				</div>
				</g:if>
			
				<g:if test="${produtoInstance}">
				<div class="form-group">
					<label id="nome-label" class="col-sm-3 col-md-2 col-lg-1 control-label"><g:message code="produto.nome.label" default="Nome" /></label>
					<div class="col-xs-4">
					
						<p class="form-control-static" aria-labelledby="nome-label"><g:fieldValue bean="${produtoInstance}" field="nome"/></p>
					
					</div>
				</div>
				</g:if>
			
				<g:if test="${produtoInstance}">
				<div class="form-group">
					<label id="preco-label" class="col-sm-3 col-md-2 col-lg-1 control-label"><g:message code="produto.preco.label" default="Preco" /></label>
					<div class="col-xs-4">
					
						<p class="form-control-static" aria-labelledby="preco-label"><g:fieldValue bean="${produtoInstance}" field="preco"/></p>
					
					</div>
				</div>
				</g:if>
			
				<g:if test="${produtoInstance}">
				<div class="form-group">
					<label id="quantidade-label" class="col-sm-3 col-md-2 col-lg-1 control-label"><g:message code="produto.quantidade.label" default="Quantidade" /></label>
					<div class="col-xs-4">
					
						<p class="form-control-static" aria-labelledby="quantidade-label"><g:fieldValue bean="${produtoInstance}" field="quantidade"/></p>
					
					</div>
				</div>
				</g:if>
			
				<g:if test="${produtoInstance}">
				<div class="form-group">
					<label id="dataFabricacao-label" class="col-sm-3 col-md-2 col-lg-1 control-label"><g:message code="produto.dataFabricacao.label" default="Data Fabricacao" /></label>
					<div class="col-xs-4">
					
						<p class="form-control-static" aria-labelledby="dataFabricacao-label"><g:formatDate date="${produtoInstance?.dataFabricacao}" /></p>
					
					</div>
				</div>
				</g:if>
			
				<g:if test="${produtoInstance}">
				<div class="form-group">
					<label id="dataVencimento-label" class="col-sm-3 col-md-2 col-lg-1 control-label"><g:message code="produto.dataVencimento.label" default="Data Vencimento" /></label>
					<div class="col-xs-4">
					
						<p class="form-control-static" aria-labelledby="dataVencimento-label"><g:formatDate date="${produtoInstance?.dataVencimento}" /></p>
					
					</div>
				</div>
				</g:if>
			
			</form>
			</div>
			<hr>
			<g:form url="[resource:produtoInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:link class="btn btn-primary" action="edit" resource="${produtoInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<a href="#DeleteModal" class="btn btn-danger" data-toggle="modal"><g:message code="default.button.delete.label" default="Delete" /></a>
				</fieldset>
			</g:form>
		</div>
	<g:render template="/layouts/deleteModal" model="[item: item]"/>
	</body>
</html>
