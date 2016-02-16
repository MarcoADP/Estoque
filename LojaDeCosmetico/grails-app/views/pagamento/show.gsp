
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
		</div>
		<div id="show-pagamento" role="main">
			<h1 class="titulo-crud"><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
				<div class="alert alert-success" role="status">${flash.message}</div>
			</g:if>
			<div class="row bs-callout bs-callout-info">
				<form class="form-horizontal">
					<g:if test="${pagamentoInstance}">
						<div class="form-group">
							<label id="id-label" class="col-sm-3 col-md-2 col-lg-1 control-label"><g:message code="pagamento.id.label" default="Código" /></label>
							<div class="col-xs-4">
								<p class="form-control-static" aria-labelledby="cliente-label">
									${formatNumber(number: pagamentoInstance?.id, format: '0000')}
								</p>
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
							<label id="valorTotal-label" class="col-sm-3 col-md-2 col-lg-1 control-label"><g:message code="pagamento.valorTotal.label" default="Valor total" /></label>
							<div class="col-xs-4">

								<p class="form-control-static" aria-labelledby="valorTotal-label">
									R$ ${formatNumber(number: fieldValue(bean: pagamentoInstance, field: "valorTotal"), format: '##0.00')}
								</p>

							</div>
						</div>
					</g:if>

					<g:if test="${pagamentoInstance}">
						<div class="form-group">
							<label id="id_venda-label" class="col-sm-3 col-md-2 col-lg-1 control-label"><g:message code="pagamento.id_venda.label" default="Código venda" /></label>
							<div class="col-xs-4">
								<p class="form-control-static" aria-labelledby="id_venda-label">
									<g:link controller="venda" action="show" id="${pagamentoInstance?.id_venda}">
										${formatNumber(number: pagamentoInstance?.id_venda, format: '0000')}
									</g:link>
								</p>
							</div>
						</div>
					</g:if>

					<g:if test="${pagamentoInstance}">
						<div class="form-group">
							<label id="dateCreated-label" class="col-sm-3 col-md-2 col-lg-1 control-label"><g:message code="pagamento.dateCreated.label" default="Data de emissao" /></label>
							<div class="col-xs-4">

								<p class="form-control-static" aria-labelledby="dateCreated-label"><g:formatDate date="${pagamentoInstance?.dateCreated}" /></p>

							</div>
						</div>
					</g:if>

					<g:if test="${pagamentoInstance}">
						<div class="form-group">
							<label id="tipoPagamento-label" class="col-sm-3 col-md-2 col-lg-1 control-label"><g:message code="pagamento.tipoPagamento.label" default="Tipo de pagamento" /></label>
							<div class="col-xs-4">

								<p class="form-control-static" aria-labelledby="tipoPagamento-label"><g:fieldValue bean="${pagamentoInstance}" field="tipoPagamento"/></p>

							</div>
						</div>
					</g:if>

					<g:if test="${pagamentoInstance}">
						<div class="form-group">
							<label id="situacao-label" class="col-sm-3 col-md-2 col-lg-1 control-label"><g:message code="pagamento.situacao.label" default="Situacao" /></label>
							<div class="col-xs-4">

								<p class="form-control-static" aria-labelledby="situacao-label">
								%{--<g:fieldValue bean="${pagamentoInstance}" field="situacao"/>--}%
									<g:if test="${pagamentoInstance.isAVencer()}">
										<span class="label label-warning">${pagamentoInstance.getStrSituacao()}</span>
									</g:if>
									<g:if test="${pagamentoInstance.isEmAberto()}">
										<span class="label label-info">${pagamentoInstance.getStrSituacao()}</span>
									</g:if>
									<g:if test="${pagamentoInstance.isVencido()}">
										<span class="label label-danger">${pagamentoInstance.getStrSituacao()}</span>
									</g:if>
									<g:if test="${pagamentoInstance.isCancelado()}">
										<span class="label label-default">${pagamentoInstance.getStrSituacao()}</span>
									</g:if>
									<g:if test="${pagamentoInstance.isPago()}">
										<span class="label label-success">${pagamentoInstance.getStrSituacao()}</span>
									</g:if>
								</p>

							</div>
						</div>
					</g:if>

					<g:if test="${pagamentoInstance.dataVencimento}">
						<div class="form-group">
							<label id="dataVencimento-label" class="col-sm-3 col-md-2 col-lg-1 control-label"><g:message code="pagamento.dataVencimento.label" default="Data de vencimento" /></label>
							<div class="col-xs-4">

								<p class="form-control-static" aria-labelledby="dataVencimento-label"><g:formatDate date="${pagamentoInstance?.dataVencimento}" /></p>

							</div>
						</div>
					</g:if>
				</form>
			</div>
			<hr>
			<g:form url="[resource:pagamentoInstance, action:'cancel']" method="DELETE">
				<fieldset class="buttons">
					<g:link class="btn btn-primary" action="edit" resource="${pagamentoInstance}">
						%{--<i class="glyphicon glyphicon-edit"></i> <g:message code="default.button.edit.label" default="Edit" />--}%
					</g:link>
					<g:if test="${pagamentoInstance.isEmAberto() || pagamentoInstance.isAVencer()}">
						<a href="#CancelModal" class="btn btn-danger" data-toggle="modal">
							%{--<i class="glyphicon glyphicon-ban-circle"></i> <g:message code="pagamento.button.cancelar" default="Cancelar" />--}%
						</a>
						<a href="#ConfirmModal" class="btn btn-success" data-toggle="modal">
							%{--<i class="glyphicon glyphicon-ok-circle"></i> <g:message code="pagamento.button.finalizar.label" default="Efetuar Pagamento" />--}%
						</a>
					</g:if>

					<g:if test="${pagamentoInstance.state.habilitarImpressao()}">
						<g:link action="gerarPDF" params="[id_pag: pagamentoInstance.id]" class="btn btn-info">
							<i class="glyphicon glyphicon-download-alt padr5"></i>Salvar Comprovante
						</g:link>
					</g:if>
				</fieldset>
			</g:form>
		</div>
		<g:render template="/layouts/cancelModal" model="[item: item]"/>
		<g:render template="/layouts/confirmModal" model="[item: item]"/>
	</body>
</html>
