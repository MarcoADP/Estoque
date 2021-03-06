<%@ page import="loja.Pedido" %>
<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main">
    <g:set var="entityName" value="${message(code: 'pedido.label', default: 'Pedido')}"/>
    <title><g:message code="default.list.label" args="[entityName]"/></title>
    <asset:javascript src="datatables.min.js"/>
    <asset:stylesheet src="datatables.min.css"/>
    <g:javascript>
        $(document).ready(function () {
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


            });
        });
    </g:javascript>
</head>

<body>
%{--<a href="#list-pedido" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>--}%
<div class="page-header" role="navigation">
    <a class="btn btn-info" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a>
    <g:link class="btn btn-info" action="create"><g:message code="default.new.label" args="[entityName]"/></g:link>
</div>

<div id="list-pedido" role="main">
    <h1 class="titulo-crud"><g:message code="default.list.label" args="[entityName]"/></h1>
    <g:if test="${flash.message}">
        <div class="alert alert-success" role="status">${flash.message}</div>
    </g:if>

    <table id="data-table" class="table table-striped table-bordered table-hover" cellspacing="0" width="100%">
        <thead>
        <tr>

            <th><g:message code="pedido.fornecedor.label" default="Fornecedor"/></th>

            <th><g:message code="pedido.produto.label" default="Produto"/></th>

            <th><g:message code="pedido.quantidade.label" default="Quantidade"/></th>

            <th><g:message code="pedido.valor.label" default="Valor"/></th>

            <th><g:message code="pedido.dateCreated.label" default="Date do Pedido"/></th>

        </tr>
        </thead>
        <tbody>
        <g:each in="${pedidoInstanceList}" status="i" var="pedidoInstance">
            <tr class="${(i % 2) == 0 ? 'even' : 'odd'} clickable-row" >

                <td><g:link action="show"
                            id="${pedidoInstance.id}">${fieldValue(bean: pedidoInstance, field: "fornecedor")}</g:link></td>

                <td><g:link controller="produto" action="show"
                            id="${pedidoInstance?.produto?.id}">${fieldValue(bean: pedidoInstance, field: "produto")}</g:link></td>

                <td>${fieldValue(bean: pedidoInstance, field: "quantidade")}</td>

                <td>${fieldValue(bean: pedidoInstance, field: "valor")}</td>

                <td><g:formatDate date="${pedidoInstance.dateCreated}"/></td>

            </tr>
        </g:each>
        </tbody>
    </table>

    <div class="pagination">
        <g:paginate total="${pedidoInstanceCount ?: 0}"/>
    </div>
</div>
</body>
</html>
