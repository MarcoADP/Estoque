<%@ page import="loja.Pedido" %>



<div class="form-group ${hasErrors(bean: pedidoInstance, field: 'fornecedor', 'has-error has-feedback')} required">
    <label class="col-sm-3 col-md-2 col-lg-2 control-label" for="fornecedor">
        <g:message code="pedido.fornecedor.label" default="Fornecedor"/>
        <span class="required-indicator">*</span>
    </label>

    <div class="col-sm-6">
        <g:select id="fornecedor" name="fornecedor.id" class="form-control" from="${loja.Fornecedor.findAllByCancelado(false)}" optionKey="id" required="" value="${pedidoInstance?.fornecedor?.id}"/>

        <g:hasErrors bean="${pedidoInstance}" field="fornecedor">
            <span class="glyphicon glyphicon-remove form-control-feedback"></span>
        </g:hasErrors>
    </div>
</div>

<div class="form-group ${hasErrors(bean: pedidoInstance, field: 'produto', 'has-error has-feedback')} required">
    <label class="col-sm-3 col-md-2 col-lg-2 control-label" for="produto">
        <g:message code="pedido.produto.label" default="Produto"/>
        <span class="required-indicator">*</span>
    </label>

    <div class="col-sm-6">
        <g:select id="produto" name="produto.id" class="form-control" from="${loja.Produto.list()}" optionKey="id"
                  required="" value="${pedidoInstance?.produto?.id}"/>

        <g:hasErrors bean="${pedidoInstance}" field="produto">
            <span class="glyphicon glyphicon-remove form-control-feedback"></span>
        </g:hasErrors>
    </div>
</div>

<div class="form-group ${hasErrors(bean: pedidoInstance, field: 'quantidade', 'has-error has-feedback')} required">
    <label class="col-sm-3 col-md-2 col-lg-2 control-label" for="quantidade">
        <g:message code="pedido.quantidade.label" default="Quantidade"/>
        <span class="required-indicator">*</span>
    </label>

    <div class="col-sm-6">
        <g:field name="quantidade" class="form-control" type="number" min="0" value="${pedidoInstance.quantidade}"
                 required=""/>

        <g:hasErrors bean="${pedidoInstance}" field="quantidade">
            <span class="glyphicon glyphicon-remove form-control-feedback"></span>
        </g:hasErrors>
    </div>
</div>

<div class="form-group ${hasErrors(bean: pedidoInstance, field: 'valor', 'has-error has-feedback')} required">
    <label class="col-sm-3 col-md-2 col-lg-2 control-label" for="valor">
        <g:message code="pedido.valor.label" default="Valor de uma unidade"/>
        <span class="required-indicator">*</span>
    </label>

    <div class="col-sm-6">
        <g:field name="valor" class="form-control" onKeyPress="mascara(this, mvalor)" value="${fieldValue(bean: pedidoInstance, field: 'valor')}" required=""/>

        <g:hasErrors bean="${pedidoInstance}" field="valor">
            <span class="glyphicon glyphicon-remove form-control-feedback"></span>
        </g:hasErrors>
    </div>
</div>

