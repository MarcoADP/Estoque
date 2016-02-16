
<%@ page import="loja.ItemCompra" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<meta charset="UTF-8">
		<g:set var="entityName" value="${message(code: 'itemCompra.label', default: 'ItemCompra')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		%{--<a href="#show-itemCompra" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>--}%
		<div class="page-header" role="navigation">
			<a class="btn btn-info" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a>
			<g:link class="btn btn-info" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link>
			<g:link class="btn btn-info" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link>
		</div>
		<div id="show-itemCompra" role="main">
			<h1 class="titulo-crud"><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
				<div class="alert alert-success" role="status">${flash.message}</div>
			</g:if>
			<form class="form-horizontal">
			
				<g:if test="${itemCompraInstance}">
				<div class="form-group">
					<label id="quantidade-label" class="col-sm-3 col-md-2 col-lg-1 control-label"><g:message code="itemCompra.quantidade.label" default="Quantidade" /></label>
					<div class="col-xs-4">
					
						<p class="form-control-static" aria-labelledby="quantidade-label"><g:fieldValue bean="${itemCompraInstance}" field="quantidade"/></p>
					
					</div>
				</div>
				</g:if>
			
				<g:if test="${itemCompraInstance}">
				<div class="form-group">
					<label id="pedido-label" class="col-sm-3 col-md-2 col-lg-1 control-label"><g:message code="itemCompra.pedido.label" default="Pedido" /></label>
					<div class="col-xs-4">
					
						<p class="form-control-static" aria-labelledby="pedido-label"><g:link controller="pedido" action="show" id="${itemCompraInstance?.pedido?.id}">${itemCompraInstance?.pedido?.encodeAsHTML()}</g:link></p>
					
					</div>
				</div>
				</g:if>
			
				<g:if test="${itemCompraInstance}">
				<div class="form-group">
					<label id="produto-label" class="col-sm-3 col-md-2 col-lg-1 control-label"><g:message code="itemCompra.produto.label" default="Produto" /></label>
					<div class="col-xs-4">
					
						<p class="form-control-static" aria-labelledby="produto-label"><g:link controller="produto" action="show" id="${itemCompraInstance?.produto?.id}">${itemCompraInstance?.produto?.encodeAsHTML()}</g:link></p>
					
					</div>
				</div>
				</g:if>
			
				<g:if test="${itemCompraInstance}">
				<div class="form-group">
					<label id="total-label" class="col-sm-3 col-md-2 col-lg-1 control-label"><g:message code="itemCompra.total.label" default="Total" /></label>
					<div class="col-xs-4">
					
						<p class="form-control-static" aria-labelledby="total-label"><g:fieldValue bean="${itemCompraInstance}" field="total"/></p>
					
					</div>
				</div>
				</g:if>
			
			</form>
			<hr>
			<g:form url="[resource:itemCompraInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:link class="btn btn-primary" action="edit" resource="${itemCompraInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<a href="#DeleteModal" class="btn btn-danger" data-toggle="modal"><g:message code="default.button.delete.label" default="Delete" /></a>
				</fieldset>
			</g:form>
		</div>
	<g:render template="/layouts/deleteModal" model="[item: item]"/>
	</body>
</html>
