
<%@ page import="loja.Venda" %>
<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="main">
        <g:set var="entityName" value="${message(code: 'venda.label', default: 'Venda')}" />
        <title><g:message code="default.show.label" args="[entityName]" /></title>
    </head>
    <body>
        <div class="container-fluid">
            <div class="row">
                <section class="content col-xs-12 col-sm-9 col-md-9 col-lg-9">
                    <div id="show-venda" class="scaffold-show" role="main">
                        <h1><g:message code="default.show.label" args="[entityName]" /></h1>
                        <g:if test="${flash.message}">
                            <div class="alert alert-info alert-dismissable" role="status">
                                <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
                                ${flash.message}
                            </div>
                        </g:if>

                        <div class="row bs-callout bs-callout-info">
                            <div class="form-horizontal">

                                <g:if test="${vendaInstance?.pessoa}">
                                    <div class="form-group">
                                        <label id="cliente-label" class="col-sm-3 col-md-2 col-lg-1 control-label"><g:message code="venda.pessoa.label" default="Pessoa" /></label>
                                        <div class="col-xs-4">
                                            <p class="form-control-static" aria-labelledby="cliente-label">
                                                <g:link controller="cliente" action="show" id="${vendaInstance?.pessoa?.id}">
                                                    ${vendaInstance?.pessoa?.encodeAsHTML()}
                                                </g:link>
                                            </p>
                                        </div>
                                    </div>
                                </g:if>

                                <g:if test="${vendaInstance?.dataTransacao}">
                                    <div class="form-group">
                                        <label id="dataTransacao-label" class="col-sm-3 col-md-2 col-lg-1 control-label"><g:message code="venda.dataTransacao.label" default="Data Transacao" /></label>
                                        <div class="col-xs-4">
                                            <p class="form-control-static" aria-labelledby="dataTransacao-label">
                                                <g:formatDate date="${vendaInstance?.dataTransacao}" format="dd/MM/yyyy" />
                                            </p>
                                        </div>
                                    </div>
                                </g:if>

                                <g:if test="${vendaInstance?.quantidadeTotal}">
                                    <div class="form-group">
                                        <label id="quantidadeTotal-label" class="col-sm-3 col-md-2 col-lg-1 control-label"><g:message code="venda.quantidadeTotal.label" default="Quantidade Total" /></label>
                                        <div class="col-xs-4">
                                            <p class="form-control-static" aria-labelledby="quantidadeTotal-label">
                                                <g:fieldValue bean="${vendaInstance}" field="quantidadeTotal"/>
                                            </p>
                                        </div>
                                    </div>
                                </g:if>

                                <g:if test="${vendaInstance?.valorTotal}">
                                    <div class="form-group">
                                        <label id="valorTotal-label" class="col-sm-3 col-md-2 col-lg-1 control-label"><g:message code="venda.valorTotal.label" default="Valor Total" /></label>
                                        <div class="col-xs-4">
                                            <p class="form-control-static" aria-labelledby="valorTotal-label">
                                                R$ ${formatNumber(number: vendaInstance?.valorTotal, format: '##0.00')}
                                            </p>
                                        </div>
                                    </div>
                                </g:if>

                                <g:if test="${vendaInstance?.pagamento}">
                                    <div class="form-group">
                                        <label id="pagamento-label" class="col-sm-3 col-md-2 col-lg-1 control-label"><g:message code="venda.Pagamento.label" default="Pagamento" /></label>
                                        <div class="col-xs-4">
                                            <p class="form-control-static" aria-labelledby="pagamento-label">
                                                <g:link controller="pagamento" action="show" id="${vendaInstance?.pagamento.id}">
                                                    ${formatNumber(number: vendaInstance?.pagamento.id, format: '0000')}
                                                </g:link>
                                            </p>
                                        </div>
                                    </div>
                                </g:if>

                                <g:if test="${vendaInstance?.status}">
                                    <div class="form-group">
                                        <label id="status-label" class="col-sm-3 col-md-2 col-lg-1 control-label"><g:message code="venda.status.label" default="Status" /></label>
                                        <div class="col-xs-4">
                                            <p class="form-control-static" aria-labelledby="status-label">
                                                <g:if test="${vendaInstance.isEmAberto()}">
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
                                            </p>
                                        </div>
                                    </div>
                                </g:if>
                            </div>

                            <hr>
                            <div class="row margin-top-sm">
                                <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
                                    <table class="table table-hover table-striped table-responsive">
                                        <caption class="row">
                                            <div class="col-xs-6 col-sm-6 col-md-6 col-lg-6 text-left">
                                                <h2 class="margin-top-zero">Lista de Produtos</h2>
                                            </div>
                                        </caption>
                                        <thead>
                                            <tr>
                                                <th>
                                                    Produto
                                                </th>
                                                <th>
                                                    Preço do produto
                                                </th>
                                                <th>
                                                    Quantidade
                                                </th>
                                                <th>
                                                    Total
                                                </th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <g:each in="${vendaInstance?.itensProduto}" status="i" var="itemInstance">
                                                <tr>
                                                    <td>${fieldValue(bean: itemInstance.produto, field: "nome")}</td>
                                                    <td>R$ ${formatNumber(number: fieldValue(bean: itemInstance.produto, field: "preco"), format: '##0.00')}</td>
                                                    <td>${fieldValue(bean: itemInstance, field: "quantidade")}</td>
                                                    <td>R$ ${formatNumber(number: fieldValue(bean: itemInstance, field: "total"), format: '##0.00')}</td>
                                                </tr>
                                            </g:each>
                                        </tbody>
                                        <tfoot>
                                            <tr>
                                                <th colspan="2">
                                                    Total
                                                </th>
                                                <th>
                                                    ${vendaInstance?.quantidadeTotalProdutos}
                                                </th>
                                                <th colspan="2">
                                                    R$ ${formatNumber(number: vendaInstance?.valorTotalProdutos, format: '##0.00')}
                                                </th>
                                            </tr>
                                        </tfoot>
                                    </table>
                                </div>
                            </div>
                        </div>
                    </div>


                    <g:form url="[resource:vendaInstance, action:'delete']" method="DELETE">
                        <g:if test="${vendaInstance.isEmAberto()}">
                            <fieldset class="buttons">                                
                                <legend>Opções</legend>
                                <g:link class="btn btn-lg btn-primary"  action="edit" resource="${vendaInstance}">
                                    <g:message code="default.button.edit.label" default="Edit" />
                                </g:link>
                                %{--<button type="button" class="btn btn-lg btn-success" data-toggle="modal" data-target="#modal-finalizar-venda">
                                    Finalizar
                                </button>--}%
                                <g:actionSubmit class="btn btn-lg btn-danger" action="cancel" 
                                value="${message(code: 'default.button.cancelar_venda.label', default: 'Cancelar Venda')}"
                                onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
                                <g:actionSubmit class="btn btn-lg btn-success" action="pagar" value="${message(code: 'default.button.pagar.label', default: 'Pagar')}"/>
                            </fieldset>
                        </g:if>
                    </g:form>
            </div>
        </section>

    </div>
</div>
</body>
</html>
