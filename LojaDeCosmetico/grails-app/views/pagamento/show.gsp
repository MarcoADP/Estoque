
<%@ page import="loja.Pagamento" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<meta charset="UTF-8">
		<g:set var="entityName" value="${message(code: 'pagamento.label', default: 'Pagamento')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		%{--<a href="#show-pagamento" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>--}%
		<div class="page-header" role="navigation">
			<a class="btn btn-info" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a>
			<g:link class="btn btn-info" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link>
			<g:link class="btn btn-info" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link>
		</div>
		<div id="show-pagamento" role="main">
			<h1 class="titulo-crud"><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
				<div class="alert alert-success" role="status">${flash.message}</div>
			</g:if>
			<form class="form-horizontal">
			
				<g:if test="${pagamentoInstance}">
				<div class="form-group">
					<label id="situacao-label" class="col-sm-3 col-md-2 col-lg-1 control-label"><g:message code="pagamento.situacao.label" default="Situacao" /></label>
					<div class="col-xs-4">
					
						<p class="form-control-static" aria-labelledby="situacao-label"><g:fieldValue bean="${pagamentoInstance}" field="situacao"/></p>
					
					</div>
				</div>
				</g:if>
			
				<g:if test="${pagamentoInstance}">
				<div class="form-group">
					<label id="tipoPagamento-label" class="col-sm-3 col-md-2 col-lg-1 control-label"><g:message code="pagamento.tipoPagamento.label" default="Tipo Pagamento" /></label>
					<div class="col-xs-4">
					
						<p class="form-control-static" aria-labelledby="tipoPagamento-label"><g:fieldValue bean="${pagamentoInstance}" field="tipoPagamento"/></p>
					
					</div>
				</div>
				</g:if>
			
				<g:if test="${pagamentoInstance}">
				<div class="form-group">
					<label id="cliente-label" class="col-sm-3 col-md-2 col-lg-1 control-label"><g:message code="pagamento.cliente.label" default="Cliente" /></label>
					<div class="col-xs-4">
					
						<p class="form-control-static" aria-labelledby="cliente-label"><g:link controller="cliente" action="show" id="${pagamentoInstance?.cliente?.id}">${pagamentoInstance?.cliente?.encodeAsHTML()}</g:link></p>
					
					</div>
				</div>
				</g:if>
			
				<g:if test="${pagamentoInstance}">
				<div class="form-group">
					<label id="dataEmissao-label" class="col-sm-3 col-md-2 col-lg-1 control-label"><g:message code="pagamento.dataEmissao.label" default="Data Emissao" /></label>
					<div class="col-xs-4">
					
						<p class="form-control-static" aria-labelledby="dataEmissao-label"><g:formatDate date="${pagamentoInstance?.dataEmissao}" /></p>
					
					</div>
				</div>
				</g:if>
			
				<g:if test="${pagamentoInstance}">
				<div class="form-group">
					<label id="dataVencimento-label" class="col-sm-3 col-md-2 col-lg-1 control-label"><g:message code="pagamento.dataVencimento.label" default="Data Vencimento" /></label>
					<div class="col-xs-4">
					
						<p class="form-control-static" aria-labelledby="dataVencimento-label"><g:formatDate date="${pagamentoInstance?.dataVencimento}" /></p>
					
					</div>
				</div>
				</g:if>
			
				<g:if test="${pagamentoInstance}">
				<div class="form-group">
					<label id="preco-label" class="col-sm-3 col-md-2 col-lg-1 control-label"><g:message code="pagamento.preco.label" default="Preco" /></label>
					<div class="col-xs-4">
					
						<p class="form-control-static" aria-labelledby="preco-label"><g:fieldValue bean="${pagamentoInstance}" field="preco"/></p>
					
					</div>
				</div>
				</g:if>
			
			</form>
			<hr>
			<g:form url="[resource:pagamentoInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:link class="btn btn-primary" action="edit" resource="${pagamentoInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<a href="#DeleteModal" class="btn btn-danger" data-toggle="modal"><g:message code="default.button.delete.label" default="Delete" /></a>
				</fieldset>
			</g:form>
		</div>
	<g:render template="/layouts/deleteModal" model="[item: item]"/>
	</body>
</html>
