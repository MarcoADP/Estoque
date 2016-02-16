

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

                        <dl class="dl-horizontal property-list venda">

                            <g:if test="${vendaInstance?.pessoa}">
                                <dt id="pessoa-label" class="property-label">
                                <g:message code="venda.pessoa.label" default="Pessoa" />
                                </dt>
                                <dd class="property-value" aria-labelledby="pessoa-label">

                                    <g:link controller="pessoa" action="show" id="${vendaInstance?.pessoa?.id}">
                                        ${vendaInstance?.pessoa?.encodeAsHTML()}
                                    </g:link>

                                </dd>
                            </g:if>

                            <g:if test="${vendaInstance?.dataTransacao}">
                                <dt id="dataTransacao-label" class="property-label">
                                <g:message code="venda.dataTransacao.label" default="Data Transacao" />
                                </dt>
                                <dd class="property-value" aria-labelledby="dataTransacao-label">

                                    <g:formatDate date="${vendaInstance?.dataTransacao}" format="dd/MM/yyyy" />

                                </dd>
                            </g:if>

                            <g:if test="${vendaInstance?.quantidadeTotal}">
                                <dt id="quantidadeTotal-label" class="property-label">
                                <g:message code="venda.quantidadeTotal.label" default="Quantidade Total" />
                                </dt>
                                <dd class="property-value" aria-labelledby="quantidadeTotal-label">

                                    <g:fieldValue bean="${vendaInstance}" field="quantidadeTotal"/>

                                </dd>
                            </g:if>

                            <g:if test="${vendaInstance?.valorTotal}">
                                <dt id="valorTotal-label" class="property-label">
                                <g:message code="venda.valorTotal.label" default="Valor Total" />
                                </dt>
                                <dd class="property-value" aria-labelledby="valorTotal-label">
                                    R$ ${formatNumber(number: vendaInstance?.valorTotal, format: '##0.00')}

                                </dd>
                            </g:if>
                            
                            <g:if test="${vendaInstance?.pagamento}">
                                <dt id="valorTotal-label" class="property-label">
                                <g:message code="venda.Pagamento.label" default="Pagamento" />
                                </dt>
                                <dd class="property-value" aria-labelledby="pagamento-label">
                                    ${vendaInstance?.pagamento}
                                </dd>
                            </g:if>

                            <g:if test="${vendaInstance?.status}">
                                <dt id="status-label" class="property-label">
                                <g:message code="venda.status.label" default="Status" />
                                </dt>
                                <dd class="property-value" aria-labelledby="status-label">

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

                                </dd>
                            </g:if>                           
                        </dl>


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









                    <g:form url="[resource:vendaInstance, action:'delete']" method="DELETE">
                        <g:if test="${vendaInstance.isEmAberto()}">
                            <fieldset class="buttons">                                
                                <legend>Opções</legend>
                                <g:link class="btn btn-lg btn-primary"  action="edit" resource="${vendaInstance}">
                                    <g:message code="default.button.edit.label" default="Edit" />
                                </g:link>
                                <!--<button type="button" class="btn btn-lg btn-success" data-toggle="modal" data-target="#modal-finalizar-venda">
                                    Finalizar
                                </button>-->
                                <!-- <g:actionSubmit class="btn btn-lg btn-danger" action="cancel"
                                value="${message(code: 'default.button.delete.label', default: 'Delete')}"
                                onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
                                -->
                            </fieldset>
                        </g:if>
                    </g:form>
            </div>
        </section>

        <div class="modal fade" id="modal-finalizar-venda" tabindex="-1" role="dialog" aria-labelledby="#modal-finalizar-solicitacao-label" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                        <h3 class="modal-title" id="modal-novo-produto-label">
                            Finalizar venda
                        </h3>
                    </div>
                    <g:form url="[resource:vendaInstance, action:'finalizer']">
                        <div class="modal-body text-left">
                            <div class="row">
                                <div class="form-group col-xs-12 col-sm-12 col-md-12 col-lg-12 ${hasErrors(bean: solicitacaoCompraInstance, field: 'produto', 'error')} required">
                                    <label for="fornecedor">
                                        Selecione o método de pagamento
                                        <span class="required-indicator">*</span>
                                    </label>
                                    <select class="form-control" name="pagamento">
                                        <option value="Dinheiro">Dinheiro</option>
                                        <option value="Cartão de débito">Cartão de débito</option>
                                        <option value="Cartão de crédito">Cartão de crédito</option>
                                        <option value="Cheque">Cheque</option>
                                    </select>
                                </div>
                            </div>
                        </div>
                        <div class="modal-footer">
                            <g:actionSubmit class="btn btn-primary" action="finalizer" 
                            value="${message(code: 'default.button.complete.label', default: 'Finalizar')}"
                            onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
                        </div>
                    </g:form>
                </div>
            </div>
        </div>

    </div>
</div>
</body>
</html>
