<%@ page import="loja.Pedido" %>



<div class="form-group ${hasErrors(bean: pedidoInstance, field: 'pessoa', 'has-error has-feedback')} ">
	<label class="col-sm-3 col-md-2 col-lg-1 control-label" for="pessoa">
		<g:message code="pedido.pessoa.label" default="Pessoa" />
		
	</label>
	<div class="col-sm-4">
		<g:select id="pessoa" name="pessoa.id" class="form-control" from="${loja.Cliente.list()}" optionKey="id" value="${pedidoInstance?.pessoa?.id}" noSelection="['null': '']"/>

		<g:hasErrors bean="${pedidoInstance}" field="pessoa">
			<span class="glyphicon glyphicon-remove form-control-feedback"></span>
		</g:hasErrors>
	</div>
</div>

<div class="form-group ${hasErrors(bean: pedidoInstance, field: 'dataTransacao', 'has-error has-feedback')} required">
	<label class="col-sm-3 col-md-2 col-lg-1 control-label" for="dataTransacao">
		<g:message code="pedido.dataTransacao.label" default="Data Transacao" />
		<span class="required-indicator">*</span>
	</label>
	<div class="col-sm-4">
		<g:datePicker name="dataTransacao" precision="day"  value="${pedidoInstance?.dataTransacao}"  />

		<g:hasErrors bean="${pedidoInstance}" field="dataTransacao">
			<span class="glyphicon glyphicon-remove form-control-feedback"></span>
		</g:hasErrors>
	</div>
</div>

<div class="form-group ${hasErrors(bean: pedidoInstance, field: 'quantidadeTotal', 'has-error has-feedback')} required">
	<label class="col-sm-3 col-md-2 col-lg-1 control-label" for="quantidadeTotal">
		<g:message code="pedido.quantidadeTotal.label" default="Quantidade Total" />
		<span class="required-indicator">*</span>
	</label>
	<div class="col-sm-4">
		<g:field name="quantidadeTotal" class="form-control" type="number" min="0" value="${pedidoInstance.quantidadeTotal}" required=""/>

		<g:hasErrors bean="${pedidoInstance}" field="quantidadeTotal">
			<span class="glyphicon glyphicon-remove form-control-feedback"></span>
		</g:hasErrors>
	</div>
</div>

<div class="form-group ${hasErrors(bean: pedidoInstance, field: 'valorTotal', 'has-error has-feedback')} required">
	<label class="col-sm-3 col-md-2 col-lg-1 control-label" for="valorTotal">
		<g:message code="pedido.valorTotal.label" default="Valor Total" />
		<span class="required-indicator">*</span>
	</label>
	<div class="col-sm-4">
		<g:field name="valorTotal" class="form-control" value="${fieldValue(bean: pedidoInstance, field: 'valorTotal')}" required=""/>

		<g:hasErrors bean="${pedidoInstance}" field="valorTotal">
			<span class="glyphicon glyphicon-remove form-control-feedback"></span>
		</g:hasErrors>
	</div>
</div>

<div class="form-group ${hasErrors(bean: pedidoInstance, field: 'pagamento', 'has-error has-feedback')} ">
	<label class="col-sm-3 col-md-2 col-lg-1 control-label" for="pagamento">
		<g:message code="pedido.pagamento.label" default="Pagamento" />
		
	</label>
	<div class="col-sm-4">
		<g:select id="pagamento" name="pagamento.id" class="form-control" from="${loja.Pagamento.list()}" optionKey="id" value="${pedidoInstance?.pagamento?.id}" noSelection="['null': '']"/>

		<g:hasErrors bean="${pedidoInstance}" field="pagamento">
			<span class="glyphicon glyphicon-remove form-control-feedback"></span>
		</g:hasErrors>
	</div>
</div>

<div class="form-group ${hasErrors(bean: pedidoInstance, field: 'itensProduto', 'has-error has-feedback')} ">
	<label class="col-sm-3 col-md-2 col-lg-1 control-label" for="itensProduto">
		<g:message code="pedido.itensProduto.label" default="Itens Produto" />
		
	</label>
	<div class="col-sm-4">
		
<ul class="one-to-many">
<g:each in="${pedidoInstance?.itensProduto?}" var="i">
    <li><g:link controller="itemCompra" action="show" id="${i.id}">${i?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="itemCompra" action="create" params="['pedido.id': pedidoInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'itemCompra.label', default: 'ItemCompra')])}</g:link>
</li>
</ul>


		<g:hasErrors bean="${pedidoInstance}" field="itensProduto">
			<span class="glyphicon glyphicon-remove form-control-feedback"></span>
		</g:hasErrors>
	</div>
</div>

<div class="form-group ${hasErrors(bean: pedidoInstance, field: 'quantidadeTotalProdutos', 'has-error has-feedback')} required">
	<label class="col-sm-3 col-md-2 col-lg-1 control-label" for="quantidadeTotalProdutos">
		<g:message code="pedido.quantidadeTotalProdutos.label" default="Quantidade Total Produtos" />
		<span class="required-indicator">*</span>
	</label>
	<div class="col-sm-4">
		<g:field name="quantidadeTotalProdutos" class="form-control" type="number" value="${pedidoInstance.quantidadeTotalProdutos}" required=""/>

		<g:hasErrors bean="${pedidoInstance}" field="quantidadeTotalProdutos">
			<span class="glyphicon glyphicon-remove form-control-feedback"></span>
		</g:hasErrors>
	</div>
</div>

<div class="form-group ${hasErrors(bean: pedidoInstance, field: 'valorTotalProdutos', 'has-error has-feedback')} required">
	<label class="col-sm-3 col-md-2 col-lg-1 control-label" for="valorTotalProdutos">
		<g:message code="pedido.valorTotalProdutos.label" default="Valor Total Produtos" />
		<span class="required-indicator">*</span>
	</label>
	<div class="col-sm-4">
		<g:field name="valorTotalProdutos" class="form-control" value="${fieldValue(bean: pedidoInstance, field: 'valorTotalProdutos')}" required=""/>

		<g:hasErrors bean="${pedidoInstance}" field="valorTotalProdutos">
			<span class="glyphicon glyphicon-remove form-control-feedback"></span>
		</g:hasErrors>
	</div>
</div>

