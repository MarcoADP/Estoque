
<%@ page import="loja.Venda" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'venda.label', default: 'Venda')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		%{--<a href="#show-venda" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>--}%
		<div class="page-header" role="navigation">
			<a class="btn btn-info" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a>
			<g:link class="btn btn-info" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link>
			<g:link class="btn btn-info" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link>
		</div>
		<div id="show-venda" role="main">
			<h1 class="titulo-crud"><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
				<div class="alert alert-success" role="status">${flash.message}</div>
			</g:if>
			<form class="form-horizontal">

				<g:if test="${vendaInstance?.codVenda}">
				<div class="form-group">
					<label id="codVenda-label" class="col-sm-3 col-md-2 col-lg-1 control-label"><g:message code="venda.codVenda.label" default="Cod Venda" /></label>
                    <div class="col-xs-4">
                        <p class="form-control-static" aria-labelledby="codVenda-label"><g:fieldValue bean="${vendaInstance}" field="codVenda"/></p>
                    </div>
				</div>
				</g:if>

				<g:if test="${vendaInstance?.precoTotal}">

				<div class="form-group">
					<label id="precoTotal-label" class="col-sm-3 col-md-2 col-lg-1 control-label"><g:message code="venda.precoTotal.label" default="Preco Total" /></label>
                        <div class="col-xs-4">
						    <p class="form-control-static" aria-labelledby="precoTotal-label"><g:fieldValue bean="${vendaInstance}" field="precoTotal"/></p>
                        </div>
				</div>
				</g:if>

				<g:if test="${vendaInstance?.cliente}">
				<div class="form-group">
					<label id="cliente-label" class="col-sm-3 col-md-2 col-lg-1 control-label"><g:message code="venda.cliente.label" default="Cliente" /></label>
                    <div class="col-xs-4">
						    <p class="form-control-static" aria-labelledby="cliente-label"><g:link controller="cliente" action="show" id="${vendaInstance?.cliente?.id}">${vendaInstance?.cliente?.encodeAsHTML()}</g:link></p>
                    </div>
				</div>
				</g:if>

				<g:if test="${vendaInstance?.status}">
				<div class="form-group">
					<label id="status-label" class="col-sm-3 col-md-2 col-lg-1 control-label"><g:message code="venda.status.label" default="Status" /></label>
                    <div class="col-xs-4">
						    <p class="form-control-static" aria-labelledby="status-label"><g:fieldValue bean="${vendaInstance}" field="status"/></p>
                        </div>
				</div>
				</g:if>

				<g:if test="${vendaInstance?.dataVenda}">
				<div class="form-group">
					<label id="dataVenda-label" class="col-sm-3 col-md-2 col-lg-1 control-label"><g:message code="venda.dataVenda.label" default="Data Venda" /></label>
                    <div class="col-xs-4">
						    <p class="form-control-static" aria-labelledby="dataVenda-label"><g:formatDate date="${vendaInstance?.dataVenda}" /></p>
                    </div>
				</div>
				</g:if>

			</form>
			<hr>
			<g:form url="[resource:vendaInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:link class="btn btn-primary" action="edit" resource="${vendaInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<a href="#DeleteModal" class="btn btn-danger" data-toggle="modal"><g:message code="default.button.delete.label" default="Delete" /></a>
					%{--<g:actionSubmit class="btn btn-danger" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />--}%
				</fieldset>
			</g:form>
		</div>

	<g:render template="/layouts/deleteModal" model="[item: item]"/>
	</body>
</html>
