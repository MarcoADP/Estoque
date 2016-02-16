
<%@ page import="loja.Pedido" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<meta charset="UTF-8">
		<g:set var="entityName" value="${message(code: 'pedido.label', default: 'Pedido')}" />
		<g:set var="val" value="${fieldValue(bean: pedidoInstance, field: "valor")}"/>
		<g:set var="quant" value="${fieldValue(bean: pedidoInstance, field: "quantidade")}"/>
		<g:set var="total" value="${pedidoInstance.valor * Float.parseFloat(quant.toString())}"/>
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		%{--<a href="#show-pedido" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>--}%
		<div class="page-header" role="navigation">
			<a class="btn btn-info" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a>
			<g:link class="btn btn-info" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link>
			<g:link class="btn btn-info" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link>
		</div>
		<div id="show-pedido" role="main">
			<h1 class="titulo-crud"><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
				<div class="alert alert-success" role="status">${flash.message}</div>
			</g:if>

			<div class="row bs-callout bs-callout-info">
			<form class="form-horizontal">
			
				<g:if test="${pedidoInstance}">
				<div class="form-group">
					<label id="fornecedor-label" class="col-sm-3 col-md-2 col-lg-1 control-label"><g:message code="pedido.fornecedor.label" default="Fornecedor" /></label>
					<div class="col-xs-4">
					
						<p class="form-control-static" aria-labelledby="fornecedor-label"><g:link controller="fornecedor" action="show" id="${pedidoInstance?.fornecedor?.id}">${pedidoInstance?.fornecedor?.encodeAsHTML()}</g:link></p>
					
					</div>
				</div>
				</g:if>
			
				<g:if test="${pedidoInstance}">
				<div class="form-group">
					<label id="produto-label" class="col-sm-3 col-md-2 col-lg-1 control-label"><g:message code="pedido.produto.label" default="Produto" /></label>
					<div class="col-xs-4">
					
						<p class="form-control-static" aria-labelledby="produto-label"><g:link controller="produto" action="show" id="${pedidoInstance?.produto?.id}">${pedidoInstance?.produto?.encodeAsHTML()}</g:link></p>
					
					</div>
				</div>
				</g:if>
			
				<g:if test="${pedidoInstance}">
				<div class="form-group">
					<label id="quantidade-label" class="col-sm-3 col-md-2 col-lg-1 control-label"><g:message code="pedido.quantidade.label" default="Quantidade" /></label>
					<div class="col-xs-4">
					
						<p class="form-control-static" aria-labelledby="quantidade-label"><g:fieldValue bean="${pedidoInstance}" field="quantidade"/></p>
					
					</div>
				</div>
				</g:if>
			
				<g:if test="${pedidoInstance}">
				<div class="form-group">
					<label id="valor-label" class="col-sm-3 col-md-2 col-lg-1 control-label"><g:message code="pedido.valor.label" default="Valor da unidade" /></label>
					<div class="col-xs-4">
					
						<p class="form-control-static" aria-labelledby="valor-label">R$ ${formatNumber(number: fieldValue(bean: pedidoInstance, field: "valor"), format: '##0.00')}</p>
					
					</div>
				</div>
				</g:if>

				<g:if test="${pedidoInstance}">
					<div class="form-group">
						<label id="valor-label" class="col-sm-3 col-md-2 col-lg-1 control-label"><g:message code="pedido.valor.label" default="Valor total" /></label>
						<div class="col-xs-4">

							<p class="form-control-static" aria-labelledby="valor-label">R$ ${formatNumber(number: total, format: '##0.00')}</p>

						</div>
					</div>
				</g:if>
			
				<g:if test="${pedidoInstance}">
				<div class="form-group">
					<label id="dateCreated-label" class="col-sm-3 col-md-2 col-lg-1 control-label"><g:message code="pedido.dateCreated.label" default="Date do pedido" /></label>
					<div class="col-xs-4">
					
						<p class="form-control-static" aria-labelledby="dateCreated-label"><g:formatDate date="${pedidoInstance?.dateCreated}" /></p>
					
					</div>
				</div>
				</g:if>
			
			</form>
				</div>
			<hr>
			<g:form url="[resource:pedidoInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:link class="btn btn-primary" action="edit" resource="${pedidoInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<a href="#CancelModal" class="btn btn-danger" data-toggle="modal"><g:message code="default.button.cancel.label" default="Cancelar" /></a>
				</fieldset>
			</g:form>
		</div>
	<g:render template="/layouts/cancelModal" model="[item: item]"/>
	</body>
</html>
