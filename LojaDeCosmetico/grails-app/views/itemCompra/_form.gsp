<%@ page import="loja.ItemCompra" %>



<div class="form-group ${hasErrors(bean: itemCompraInstance, field: 'quantidade', 'has-error has-feedback')} required">
	<label class="col-sm-3 col-md-2 col-lg-1 control-label" for="quantidade">
		<g:message code="itemCompra.quantidade.label" default="Quantidade" />
		<span class="required-indicator">*</span>
	</label>
	<div class="col-sm-4">
		<g:field name="quantidade" class="form-control" type="number" min="0" value="${itemCompraInstance.quantidade}" required=""/>

		<g:hasErrors bean="${itemCompraInstance}" field="quantidade">
			<span class="glyphicon glyphicon-remove form-control-feedback"></span>
		</g:hasErrors>
	</div>
</div>

<div class="form-group ${hasErrors(bean: itemCompraInstance, field: 'pedido', 'has-error has-feedback')} required">
	<label class="col-sm-3 col-md-2 col-lg-1 control-label" for="pedido">
		<g:message code="itemCompra.pedido.label" default="Pedido" />
		<span class="required-indicator">*</span>
	</label>
	<div class="col-sm-4">
		<g:select id="pedido" name="pedido.id" class="form-control" from="${loja.Pedido.list()}" optionKey="id" required="" value="${itemCompraInstance?.pedido?.id}"/>

		<g:hasErrors bean="${itemCompraInstance}" field="pedido">
			<span class="glyphicon glyphicon-remove form-control-feedback"></span>
		</g:hasErrors>
	</div>
</div>

<div class="form-group ${hasErrors(bean: itemCompraInstance, field: 'produto', 'has-error has-feedback')} required">
	<label class="col-sm-3 col-md-2 col-lg-1 control-label" for="produto">
		<g:message code="itemCompra.produto.label" default="Produto" />
		<span class="required-indicator">*</span>
	</label>
	<div class="col-sm-4">
		<g:select id="produto" name="produto.id" class="form-control" from="${loja.Produto.list()}" optionKey="id" required="" value="${itemCompraInstance?.produto?.id}"/>

		<g:hasErrors bean="${itemCompraInstance}" field="produto">
			<span class="glyphicon glyphicon-remove form-control-feedback"></span>
		</g:hasErrors>
	</div>
</div>

<div class="form-group ${hasErrors(bean: itemCompraInstance, field: 'total', 'has-error has-feedback')} required">
	<label class="col-sm-3 col-md-2 col-lg-1 control-label" for="total">
		<g:message code="itemCompra.total.label" default="Total" />
		<span class="required-indicator">*</span>
	</label>
	<div class="col-sm-4">
		<g:field name="total" class="form-control" value="${fieldValue(bean: itemCompraInstance, field: 'total')}" required=""/>

		<g:hasErrors bean="${itemCompraInstance}" field="total">
			<span class="glyphicon glyphicon-remove form-control-feedback"></span>
		</g:hasErrors>
	</div>
</div>

