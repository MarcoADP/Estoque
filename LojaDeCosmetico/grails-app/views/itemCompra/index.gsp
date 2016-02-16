

<%@ page import="loja.ItemCompra" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'itemCompra.label', default: 'ItemCompra')}" />
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
		%{--<a href="#list-itemCompra" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>--}%
		<div class="page-header" role="navigation">
			<a class="btn btn-info" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a>
			<g:link class="btn btn-info" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link>
		</div>

		<div id="list-itemCompra" role="main">
			<h1 class="titulo-crud"><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
				<div class="alert alert-success" role="status">${flash.message}</div>
			</g:if>

			<table id="data-table" class="table table-striped table-bordered" cellspacing="0" width="100%">
				<thead>
					<tr>
					
						<th><g:message code="itemCompra.quantidade.label" default="Quantidade" /></th>
					
						<th><g:message code="itemCompra.pedido.label" default="Pedido" /></th>
					
						<th><g:message code="itemCompra.produto.label" default="Produto" /></th>
					
						<th><g:message code="itemCompra.total.label" default="Total" /></th>
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${itemCompraInstanceList}" status="i" var="itemCompraInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${itemCompraInstance.id}">${fieldValue(bean: itemCompraInstance, field: "quantidade")}</g:link></td>
					
						<td><g:link controller="pedido" action="show" id="${itemCompraInstance?.pedido?.id}">${fieldValue(bean: itemCompraInstance, field: "pedido")}</g:link></td>
					
						<td><g:link controller="produto" action="show" id="${itemCompraInstance?.produto?.id}">${fieldValue(bean: itemCompraInstance, field: "produto")}</g:link></td>
					
						<td>${fieldValue(bean: itemCompraInstance, field: "total")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${itemCompraInstanceCount ?: 0}" />
			</div>
		</div>
	</body>
</html>
