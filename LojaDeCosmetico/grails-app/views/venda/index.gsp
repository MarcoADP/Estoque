
<%@ page import="loja.Venda" %>
<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="main">
        <g:set var="entityName" value="${message(code: 'venda.label', default: 'Venda')}" />
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

        <div class="page-header" role="navigation">
            <a class="btn btn-info" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a>
            <g:link class="btn btn-info" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link>
            <g:link class="btn btn-info" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link>
        </div>

        <div class="container-fluid">
            <div class="row">

                <section class="content col-xs-12 col-sm-9 col-md-9 col-lg-9">
                    <div id="list-venda" role="main">
                        <h1><g:message code="default.list.label" args="[entityName]" /></h1>

                        <g:form url="[resource:fornecedorInstance, action:'index']" method="GET"
                            class="well well-lg">
                            <div class="row">
                                <div class="form-group form-group-data col-xs-12 col-sm-12 col-md-12 col-lg-12 ${hasErrors(bean: vendaInstance, field: 'dataTransacao', 'error')} required">
                                    <label for="dataTransacao">
                                        <g:message code="venda.dataTransacao.label" default="Data Transacao entre" />
                                        <span class="required-indicator">*</span>
                                    </label><br/>
                                    <g:datePicker name="dataTransacaoInicio" precision="day"  value="${params.dataTransacaoInicio}"  />
                                    <br/><br/>
                                    <g:datePicker name="dataTransacaoFim" precision="day"  value="${params.dataTransacaoFim}"  />
                                </div>
                            </div>
                            <div class="form-actions">
                                <g:actionSubmit class="btn btn-lg btn-primary" action="index" 
                                value="${message(code: 'default.button.search.label', default: 'Search')}" />
                            </div>
                        </g:form>

                        <g:if test="${flash.message}">
                            <div class="alert alert-info alert-dismiss" role="status">
                                <button type="button" class="close" data-dismiss="alert">
                                    <span aria-hidden="true">&times;</span>
                                    <span class="sr-only">Fechar</span>
                                </button>
                                ${flash.message}
                            </div>
                        </g:if>

                        <table id="data-table" class="table table-bordered table-hover table-striped table-responsive">
                            <thead>
                                <tr>

                                        <th><g:message code="venda.pessoa.label" default="Cliente" /></th>

                                        <th>${message(code: 'venda.dataTransacao.label', default: 'Data Transacao')}</th>

                                        <th>${message(code: 'venda.quantidadeTotal.label', default: 'Quantidade Total')}</th>

                                        <th>${message(code: 'venda.valorTotal.label', default: 'Valor Total')}</th>

                                        <th>${message(code: 'venda.status.label', default: 'Status')}</th>

                                </tr>
                            </thead>
                            <tbody>
                                <g:each in="${vendaInstanceList}" status="i" var="vendaInstance">
                                    <tr class="${(i % 2) == 0 ? 'even' : 'odd'} clickable-row">

                                        <td><g:link action="show" id="${vendaInstance.id}">
                                                ${fieldValue(bean: vendaInstance, field: "pessoa")}
                                            </g:link></td>

                                        <td><g:formatDate date="${vendaInstance.dataTransacao}" format="dd/MM/yyyy"  /></td>

                                        <td>${fieldValue(bean: vendaInstance, field: "quantidadeTotal")}</td>

                                        <td>${fieldValue(bean: vendaInstance, field: "valorTotal")}</td>

                                        <td><g:if test="${vendaInstance.isEmAberto()}">
                                                <span class="label label-warning">
                                                    ${vendaInstance.getStatusStr()}
                                                </span>
                                            </g:if>
                                            <g:if test="${vendaInstance.isCancelada()}">
                                                <span class="label label-danger">${vendaInstance.getStatusStr()}</span>
                                            </g:if>
                                            <g:if test="${vendaInstance.isFinalizada()}">
                                                <span class="label label-success">${vendaInstance.getStatusStr()}</span>
                                            </g:if>
                                        </td>

                                    </tr>
                                </g:each>
                            </tbody>
                        </table>
                        <div class="pagination">
                            <g:paginate total="${vendaInstanceCount ?: 0}" />
                        </div>
                    </div>
                </section>
            </div>
        </div>
    </body>
</html>
