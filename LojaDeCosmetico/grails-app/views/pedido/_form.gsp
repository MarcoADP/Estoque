<%@ page import="loja.Pedido" %>



<div class="form-group ${hasErrors(bean: pedidoInstance, field: 'pessoa', 'has-error has-feedback')} ">
    <label class="col-sm-3 col-md-2 col-lg-1 control-label" for="pessoa">
        <g:message code="pedido.pessoa.label" default="Pessoa"/>

    </label>

    <div class="col-sm-4">
        <g:select id="pessoa" name="pessoa.id" class="form-control" from="${loja.Cliente.list()}" optionKey="id"
                  value="${pedidoInstance?.pessoa?.id}" noSelection="['null': '']"/>

        <g:hasErrors bean="${pedidoInstance}" field="pessoa">
            <span class="glyphicon glyphicon-remove form-control-feedback"></span>
        </g:hasErrors>
    </div>
</div>

<div class="form-group ${hasErrors(bean: pedidoInstance, field: 'dataTransacao', 'has-error has-feedback')} required">
    <label class="col-sm-3 col-md-2 col-lg-1 control-label" for="dataTransacao">
        <g:message code="pedido.dataTransacao.label" default="Data Transacao"/>
        <span class="required-indicator">*</span>
    </label>

    <div class="col-sm-4">
        <g:datePicker name="dataTransacao" precision="day" value="${pedidoInstance?.dataTransacao}"/>

        <g:hasErrors bean="${pedidoInstance}" field="dataTransacao">
            <span class="glyphicon glyphicon-remove form-control-feedback"></span>
        </g:hasErrors>
    </div>
</div>

<div class="form-group ${hasErrors(bean: pedidoInstance, field: 'quantidadeTotal', 'has-error has-feedback')} required">
    <label class="col-sm-3 col-md-2 col-lg-1 control-label" for="quantidadeTotal">
        <g:message code="pedido.quantidadeTotal.label" default="Quantidade Total"/>
        <span class="required-indicator">*</span>
    </label>

    <div class="col-sm-4">
        <g:field name="quantidadeTotal" class="form-control" type="number" value="${pedidoInstance.quantidadeTotal}"
                 required=""/>

        <g:hasErrors bean="${pedidoInstance}" field="quantidadeTotal">
            <span class="glyphicon glyphicon-remove form-control-feedback"></span>
        </g:hasErrors>
    </div>
</div>

<div class="form-group ${hasErrors(bean: pedidoInstance, field: 'valorTotal', 'has-error has-feedback')} required">
    <label class="col-sm-3 col-md-2 col-lg-1 control-label" for="valorTotal">
        <g:message code="pedido.valorTotal.label" default="Valor Total"/>
        <span class="required-indicator">*</span>
    </label>

    <div class="col-sm-4">
        <g:field name="valorTotal" class="form-control" value="${fieldValue(bean: pedidoInstance, field: 'valorTotal')}"
                 required=""/>

        <g:hasErrors bean="${pedidoInstance}" field="valorTotal">
            <span class="glyphicon glyphicon-remove form-control-feedback"></span>
        </g:hasErrors>
    </div>
</div>

<div class="form-group ${hasErrors(bean: pedidoInstance, field: 'fornecedor', 'has-error has-feedback')} required">
    <label class="col-sm-3 col-md-2 col-lg-1 control-label" for="fornecedor">
        <g:message code="pedido.fornecedor.label" default="Fornecedor"/>
        <span class="required-indicator">*</span>
    </label>

    <div class="col-sm-4">
        <g:select id="fornecedor" name="fornecedor.id" class="form-control" from="${loja.Fornecedor.list()}"
                  optionKey="id" required="" value="${pedidoInstance?.fornecedor?.id}"/>

        <g:hasErrors bean="${pedidoInstance}" field="fornecedor">
            <span class="glyphicon glyphicon-remove form-control-feedback"></span>
        </g:hasErrors>
    </div>
</div>

<div class="form-group ${hasErrors(bean: pedidoInstance, field: 'produto', 'has-error has-feedback')} required">
    <label class="col-sm-3 col-md-2 col-lg-1 control-label" for="produto">
        <g:message code="pedido.produto.label" default="Produto"/>
        <span class="required-indicator">*</span>
    </label>

    <div class="col-sm-4">
        <g:select id="produto" name="produto.id" class="form-control" from="${loja.Produto.list()}" optionKey="id"
                  required="" value="${pedidoInstance?.produto?.id}"/>

        <g:hasErrors bean="${pedidoInstance}" field="produto">
            <span class="glyphicon glyphicon-remove form-control-feedback"></span>
        </g:hasErrors>
    </div>
</div>

<div class="form-group ${hasErrors(bean: pedidoInstance, field: 'quantidade', 'has-error has-feedback')} required">
    <label class="col-sm-3 col-md-2 col-lg-1 control-label" for="quantidade">
        <g:message code="pedido.quantidade.label" default="Quantidade"/>
        <span class="required-indicator">*</span>
    </label>

    <div class="col-sm-4">
        <g:field name="quantidade" class="form-control" type="number" min="0" value="${pedidoInstance.quantidade}"
                 required=""/>

        <g:hasErrors bean="${pedidoInstance}" field="quantidade">
            <span class="glyphicon glyphicon-remove form-control-feedback"></span>
        </g:hasErrors>
    </div>
</div>

<div class="form-group ${hasErrors(bean: pedidoInstance, field: 'valor', 'has-error has-feedback')} required">
    <label class="col-sm-3 col-md-2 col-lg-1 control-label" for="valor">
        <g:message code="pedido.valor.label" default="Valor"/>
        <span class="required-indicator">*</span>
    </label>

    <div class="col-sm-4">
        <g:field name="valor" class="form-control" value="${fieldValue(bean: pedidoInstance, field: 'valor')}"
                 required=""/>

        <g:hasErrors bean="${pedidoInstance}" field="valor">
            <span class="glyphicon glyphicon-remove form-control-feedback"></span>
        </g:hasErrors>
    </div>
</div>

