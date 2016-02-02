<%@ page import="loja.Venda" %>
<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="main">
        <g:set var="entityName" value="${message(code: 'venda.label', default: 'Venda')}" />
        <title><g:message code="default.edit.label" args="[entityName]" /></title>
    </head>
    <body>


        <div class="container-fluid">
            <div class="row">
                <section class="content col-xs-12 col-sm-9 col-md-9 col-lg-9">
                    <div id="edit-venda" class="scaffold-edit" role="main">
                        <h1><g:message code="default.edit.label" args="[entityName]" /></h1>
                        <g:if test="${flash.message}">
                            <div class="alert alert-info alert-dismissable" role="status">
                                <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
                                ${flash.message}
                            </div>
                        </g:if>
                        <g:hasErrors bean="${vendaInstance}">
                            <ul class="errors" role="alert">
                                <g:eachError bean="${vendaInstance}" var="error">
                                    <li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
                                </g:eachError>
                            </ul>
                        </g:hasErrors>

                        <g:form url="[resource:vendaInstance, action:'update']" method="PUT" >
                            <g:hiddenField name="version" value="${vendaInstance?.version}" />
                            <div class="bs-callout bs-callout-warning">
                                <g:render template="form"/>

                                <hr>
                                <div class="row margin-top-sm">
                                    <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
                                        <table class="table table-hover table-striped table-responsive">
                                            <caption class="row">
                                                <div class="col-xs-6 col-sm-6 col-md-6 col-lg-6 text-left">
                                                    <h2 class="margin-top-zero">Lista de Produtos</h2>
                                                </div>
                                                <div class="col-xs-6 col-sm-6 col-md-6 col-lg-6 text-right">
                                                    <button type="button" class="btn btn-default" data-toggle="modal" data-target="#modal-novo-produto">
                                                        Adicionar Produto
                                                    </button>
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
                                                    <th colspan="2">
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
                                                        <td class="text-right">
                                                            <g:link controller="venda" action="removeProduct"
                                                            id="${vendaInstance.id}" params="[itemId: itemInstance.id]" class="btn btn-sm btn-danger" >
                                                                Remover
                                                            </g:link>
                                                        </td>
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

                            <hr>
                            <fieldset class="buttons">
                                <g:actionSubmit class="btn btn-lg btn-primary" action="update" 
                                value="${message(code: 'default.button.update.label', default: 'Update')}" />
                                <g:link controller="show"  resource="${vendaInstance}" 
                                    class="btn btn-lg btn-danger">
                                    Cancelar
                                </g:link>
                            </fieldset>
                        </g:form>

                        <div class="modal fade" id="modal-novo-produto" tabindex="-1" role="dialog" aria-labelledby="#modal-novo-produto-label" aria-hidden="true">
                            <div class="modal-dialog">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                                        <h3 class="modal-title" id="modal-novo-produto-label">
                                            Novo item de produto
                                        </h3>
                                    </div>
                                    <g:form id="new-item-form" url="[resource:vendaInstance, action:'addProduct']">
                                        <div class="modal-body text-left">
                                            <div class="row">
                                                <div class="form-group col-xs-12 col-sm-12 col-md-12 col-lg-12 ${hasErrors(bean: vendaInstance, field: 'valorTotal', 'error')} required">
                                                    <label for="valorTotal">
                                                        Produto
                                                        <span class="required-indicator">*</span>
                                                    </label>
                                                    <g:select class="form-control" id="produto" name="produto.id" 
                                                    from="${loja.Produto.list()}"
                                                        optionKey="id" required="" 
                                                    value="${produtoInstance?.id}"
                                                        class="many-to-one"/>
                                                </div>
                                            </div>
                                            <div class="row">
                                                <div class="form-group col-xs-12 col-sm-6 col-md-6 col-lg-6 ${hasErrors(bean: vendaInstance, field: 'valorTotal', 'error')} required">
                                                    <label for="valorTotal">
                                                        Quantidade
                                                        <span class="required-indicator">*</span>
                                                    </label>
                                                    <input type="number" name="quantidade" class="form-control" value="1" min="1" />
                                                </div>
                                            </div>
                                        </div>
                                        <div class="modal-footer">
                                            <button type="button" class="btn btn-default" data-dismiss="modal">Fechar</button>
                                            <button type="submit" class="btn btn-primary">Salvar</button>
                                        </div>
                                    </g:form>
                                </div>
                            </div>
                        </div>

                    </div>                    
                </section>
            </div>
        </div>
    </body>
</html>
