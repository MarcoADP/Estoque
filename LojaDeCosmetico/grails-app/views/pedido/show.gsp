<%@ page import="loja.Pedido" %>
<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main">
    <meta charset="UTF-8">
    <g:set var="entityName" value="${message(code: 'pedido.label', default: 'Pedido')}"/>
    <title><g:message code="default.show.label" args="[entityName]"/></title>
</head>

<body>
%{--<a href="#show-pedido" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>--}%
<div class="page-header" role="navigation">
    <a class="btn btn-info" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a>
    <g:link class="btn btn-info" action="index"><g:message code="default.list.label" args="[entityName]"/></g:link>
    <g:link class="btn btn-info" action="create"><g:message code="default.new.label" args="[entityName]"/></g:link>
</div>

<div id="show-pedido" role="main">
    <h1 class="titulo-crud"><g:message code="default.show.label" args="[entityName]"/></h1>
    <g:if test="${flash.message}">
        <div class="alert alert-success" role="status">${flash.message}</div>
    </g:if>
    <form class="form-horizontal">

        <g:if test="${pedidoInstance}">
            <div class="form-group">
                <label id="pessoa-label" class="col-sm-3 col-md-2 col-lg-1 control-label"><g:message
                        code="pedido.pessoa.label" default="Pessoa"/></label>

                <div class="col-xs-4">

                    <p class="form-control-static" aria-labelledby="pessoa-label"><g:link controller="cliente"
                                                                                          action="show"
                                                                                          id="${pedidoInstance?.pessoa?.id}">${pedidoInstance?.pessoa?.encodeAsHTML()}</g:link></p>

                </div>
            </div>
        </g:if>

        <g:if test="${pedidoInstance}">
            <div class="form-group">
                <label id="dataTransacao-label" class="col-sm-3 col-md-2 col-lg-1 control-label"><g:message
                        code="pedido.dataTransacao.label" default="Data Transacao"/></label>

                <div class="col-xs-4">

                    <p class="form-control-static" aria-labelledby="dataTransacao-label"><g:formatDate
                            date="${pedidoInstance?.dataTransacao}"/></p>

                </div>
            </div>
        </g:if>

        <g:if test="${pedidoInstance}">
            <div class="form-group">
                <label id="quantidadeTotal-label" class="col-sm-3 col-md-2 col-lg-1 control-label"><g:message
                        code="pedido.quantidadeTotal.label" default="Quantidade Total"/></label>

                <div class="col-xs-4">

                    <p class="form-control-static" aria-labelledby="quantidadeTotal-label"><g:fieldValue
                            bean="${pedidoInstance}" field="quantidadeTotal"/></p>

                </div>
            </div>
        </g:if>

        <g:if test="${pedidoInstance}">
            <div class="form-group">
                <label id="valorTotal-label" class="col-sm-3 col-md-2 col-lg-1 control-label"><g:message
                        code="pedido.valorTotal.label" default="Valor Total"/></label>

                <div class="col-xs-4">

                    <p class="form-control-static" aria-labelledby="valorTotal-label"><g:fieldValue
                            bean="${pedidoInstance}" field="valorTotal"/></p>

                </div>
            </div>
        </g:if>

        <g:if test="${pedidoInstance}">
            <div class="form-group">
                <label id="fornecedor-label" class="col-sm-3 col-md-2 col-lg-1 control-label"><g:message
                        code="pedido.fornecedor.label" default="Fornecedor"/></label>

                <div class="col-xs-4">

                    <p class="form-control-static" aria-labelledby="fornecedor-label"><g:link controller="fornecedor"
                                                                                              action="show"
                                                                                              id="${pedidoInstance?.fornecedor?.id}">${pedidoInstance?.fornecedor?.encodeAsHTML()}</g:link></p>

                </div>
            </div>
        </g:if>

        <g:if test="${pedidoInstance}">
            <div class="form-group">
                <label id="produto-label" class="col-sm-3 col-md-2 col-lg-1 control-label"><g:message
                        code="pedido.produto.label" default="Produto"/></label>

                <div class="col-xs-4">

                    <p class="form-control-static" aria-labelledby="produto-label"><g:link controller="produto"
                                                                                           action="show"
                                                                                           id="${pedidoInstance?.produto?.id}">${pedidoInstance?.produto?.encodeAsHTML()}</g:link></p>

                </div>
            </div>
        </g:if>

        <g:if test="${pedidoInstance}">
            <div class="form-group">
                <label id="quantidade-label" class="col-sm-3 col-md-2 col-lg-1 control-label"><g:message
                        code="pedido.quantidade.label" default="Quantidade"/></label>

                <div class="col-xs-4">

                    <p class="form-control-static" aria-labelledby="quantidade-label"><g:fieldValue
                            bean="${pedidoInstance}" field="quantidade"/></p>

                </div>
            </div>
        </g:if>

        <g:if test="${pedidoInstance}">
            <div class="form-group">
                <label id="valor-label" class="col-sm-3 col-md-2 col-lg-1 control-label"><g:message
                        code="pedido.valor.label" default="Valor"/></label>

                <div class="col-xs-4">

                    <p class="form-control-static" aria-labelledby="valor-label"><g:fieldValue bean="${pedidoInstance}"
                                                                                               field="valor"/></p>

                </div>
            </div>
        </g:if>

        <g:if test="${pedidoInstance}">
            <div class="form-group">
                <label id="dateCreated-label" class="col-sm-3 col-md-2 col-lg-1 control-label"><g:message
                        code="pedido.dateCreated.label" default="Date Created"/></label>

                <div class="col-xs-4">

                    <p class="form-control-static" aria-labelledby="dateCreated-label"><g:formatDate
                            date="${pedidoInstance?.dateCreated}"/></p>

                </div>
            </div>
        </g:if>

    </form>
    <hr>
    <g:form url="[resource: pedidoInstance, action: 'delete']" method="DELETE">
        <fieldset class="buttons">
            <g:link class="btn btn-primary" action="edit" resource="${pedidoInstance}"><g:message
                    code="default.button.edit.label" default="Edit"/></g:link>
            <a href="#DeleteModal" class="btn btn-danger" data-toggle="modal"><g:message
                    code="default.button.delete.label" default="Delete"/></a>
        </fieldset>
    </g:form>
</div>
<g:render template="/layouts/deleteModal" model="[item: item]"/>
</body>
</html>
