

<%@ page import="loja.Cliente" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'cliente.label', default: 'Cliente')}" />
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
		%{--<a href="#list-cliente" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>--}%
		<div class="page-header" role="navigation">
			<a class="btn btn-info" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a>
			<g:link class="btn btn-info" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link>
		</div>

		<div id="list-cliente" role="main">
			<h1 class="titulo-crud"><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
				<div class="alert alert-success" role="status">${flash.message}</div>
			</g:if>

			<table id="data-table" class="table table-striped table-bordered" cellspacing="0" width="100%">
				<thead>
					<tr>
					
						<th><g:message code="cliente.nome.label" default="Nome" /></th>
					
						<th><g:message code="cliente.cpf.label" default="Cpf" /></th>
					
						<th><g:message code="cliente.endereco.label" default="Endereco" /></th>
					
						<th><g:message code="cliente.telefone.label" default="Telefone" /></th>
					
						<th><g:message code="cliente.dataNascimento.label" default="Data Nascimento" /></th>
					
						<th><g:message code="cliente.idade.label" default="Idade" /></th>
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${clienteInstanceList}" status="i" var="clienteInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${clienteInstance.id}">${fieldValue(bean: clienteInstance, field: "nome")}</g:link></td>
					
						<td>${fieldValue(bean: clienteInstance, field: "cpf")}</td>
					
						<td>${fieldValue(bean: clienteInstance, field: "endereco")}</td>
					
						<td>${fieldValue(bean: clienteInstance, field: "telefone")}</td>
					
						<td><g:formatDate date="${clienteInstance.dataNascimento}" /></td>
					
						<td>${fieldValue(bean: clienteInstance, field: "idade")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${clienteInstanceCount ?: 0}" />
			</div>
		</div>
	</body>
</html>
