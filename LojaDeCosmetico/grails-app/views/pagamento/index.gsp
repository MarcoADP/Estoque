

<%@ page import="loja.Pagamento" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'pagamento.label', default: 'Pagamento')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
		<asset:javascript src="datatables.min.js"/>
		<asset:stylesheet src="datatables.min.css"/>
		<g:javascript>
			$(document).ready(function() {
				$('#data-table').DataTable({
					"language": {
						"sEmptyTable": "Nenhum registro encontrado",
						"sInfo": "Mostrando de _START_ até _END_ de _TOTAL_ registros",
						"sInfoEmpty": "Mostrando 0 até 0 de 0 registros",
						"sInfoFiltered": "(Filtrados de _MAX_ registros)",
						"sInfoPostFix": "",
						"sInfoThousands": ".",
						"sLengthMenu": "_MENU_ resultados por página",
						"sLoadingRecords": "Carregando...",
						"sProcessing": "Processando...",
						"sZeroRecords": "Nenhum registro encontrado",
						"sSearch": "Pesquisar",
						"oPaginate": {
							"sNext": "Próximo",
							"sPrevious": "Anterior",
							"sFirst": "Primeiro",
							"sLast": "Último"
						},
						"oAria": {
							"sSortAscending": ": Ordenar colunas de forma ascendente",
							"sSortDescending": ": Ordenar colunas de forma descendente"
						}
					}


				} );
			} );
		</g:javascript>
	</head>
	<body>
		%{--<a href="#list-pagamento" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>--}%
		<div class="page-header" role="navigation">
			<a class="btn btn-info" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a>
			%{--<g:link class="btn btn-info" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link>--}%
		</div>

		<div id="list-pagamento" role="main">
			<h1 class="titulo-crud"><g:message code="pagamento.list.label"/></h1>
			<g:if test="${flash.message}">
				<div class="alert alert-success" role="status">${flash.message}</div>
			</g:if>

			<g:form url="[resource:pagamentoInstance, action:'index']" method="GET" class="well well-lg">
				<div class="row">
					<div class="form-group form-group-data col-xs-6 col-sm-5 col-md-4 col-lg-2 ${hasErrors(bean: pagamentoInstance, field: 'cliente', 'error')} required">
						<label for="cliente">
							<g:message code="pagamento.cliente.search.label" default="Nome do cliente" />
						</label><br/>
						<g:field type="search" class="form-control" name="cliente" value="${params.cliente}"/>
					</div>
					<div class="form-group form-group-data col-xs-6 col-sm-5 col-md-4 col-lg-2 ${hasErrors(bean: pagamentoInstance, field: 'tipoPagamento', 'error')} required">
						<label for="tipoPagamento">
							<g:message code="pagamento.cliente.search.label" default="Tipo de pagamento" />
						</label><br/>
						<g:select name="tipoPagamento" class="form-control" from="${["Todos", "Dinheiro", "Cartão de Crédito à Vista", "Cartão de Crédito à Prazo"]}" value="${params.tipoPagamento}"/>
					</div>
					<div class="form-group form-group-data col-xs-6 col-sm-5 col-md-4 col-lg-3 ${hasErrors(bean: pagamentoInstance, field: 'dataEmissao', 'error')} required">
						<label for="dataEmissao">
							<g:message code="pagamento.dataEmissao.search.label" default="Data Emissão entre" />
						</label><br/>
						<g:datePicker name="dataEmissaoInicio" precision="day" value="${params.dataEmissaoInicio}"  />
						<br/><br/>
						<g:datePicker name="dataEmissaoFim" precision="day" value="${params.dataEmissaoFim}"  />
					</div>
					<div class="form-group form-group-data col-xs-6 col-sm-5 col-md-4 col-lg-3 ${hasErrors(bean: pagamentoInstance, field: 'dataVencimento', 'error')} required">
						<label for="dataVencimento">
							<g:message code="pagamento.dataVencimento.search.label" default="Data de vencimento entre" />
						</label><br/>
						<g:datePicker name="dataVencimentoInicio" precision="day" value="${params.dataVencimentoInicio}"  />
						<br/><br/>
						<g:datePicker name="dataVencimentoFim" precision="day" value="${params.dataVencimentoFim}"  />
					</div>
				</div>
				<div class="form-actions">
					<g:actionSubmit class="btn btn-lg btn-primary" action="index" value="${message(code: 'default.button.search.label', default: 'Search')}" />
				</div>
			</g:form>

			<table id="data-table" class="table table-striped table-bordered table-hover" cellspacing="0" width="100%">
				<thead>
					<tr>

						<th><g:message code="pagamento.cliente.label" default="Cliente" /></th>

						<th><g:message code="pagamento.valorTotal.label" default="Valor total" /></th>

						<th><g:message code="pagamento.dateCreated.label" default="Data Emissao" /></th>

						<th><g:message code="pagamento.tipoPagamento.label" default="Tipo Pagamento" /></th>

						<th><g:message code="pagamento.dataVencimento.label" default="Data Vencimento" /></th>

						<th><g:message code="pagamento.situacao.label" default="Situacao" /></th>

					</tr>
				</thead>
				<tbody>
				<g:each in="${pagamentoInstanceList}" status="i" var="pagamentoInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'} clickable-row" data-href="${createLink(action: 'show', id: pagamentoInstance.id)}">

						<td><g:link action="show" id="${pagamentoInstance?.id}">${fieldValue(bean: pagamentoInstance, field: "cliente")}</g:link></td>

						<td>R$ ${formatNumber(number: fieldValue(bean: pagamentoInstance, field: "valorTotal"), format: '##0.00')}</td>

						<td><g:formatDate date="${pagamentoInstance.dateCreated}" /></td>

						<td>${fieldValue(bean: pagamentoInstance, field: "tipoPagamento")}</td>

						<td><g:formatDate date="${pagamentoInstance.dataVencimento}" /></td>

						<td>
							%{--${fieldValue(bean: pagamentoInstance, field: "situacao")}--}%
							<g:if test="${pagamentoInstance.isAVencer()}">
								<span class="label label-warning">${pagamentoInstance.getStrSituacao()}</span>
							</g:if>
							<g:if test="${pagamentoInstance.isEmAberto()}">
								<span class="label label-warning">${pagamentoInstance.getStrSituacao()}</span>
							</g:if>
							<g:if test="${pagamentoInstance.isVencido()}">
								<span class="label label-danger">${pagamentoInstance.getStrSituacao()}</span>
							</g:if>
							<g:if test="${pagamentoInstance.isCancelado()}">
								<span class="label label-danger">${pagamentoInstance.getStrSituacao()}</span>
							</g:if>
							<g:if test="${pagamentoInstance.isPago()}">
								<span class="label label-success">${pagamentoInstance.getStrSituacao()}</span>
							</g:if>
						</td>
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${pagamentoInstanceCount ?: 0}" />
			</div>
		</div>
	</body>
</html>
