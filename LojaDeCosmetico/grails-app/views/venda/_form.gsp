<%@ page import="loja.Venda" %>



<div class="form-group ${hasErrors(bean: vendaInstance, field: 'codVenda', 'has-error has-feedback')} required">
	<label class="col-sm-3 col-md-2 col-lg-1 control-label" for="codVenda">
		<g:message code="venda.codVenda.label" default="Cod Venda" />
		<span class="required-indicator">*</span>
	</label>
	<div class="col-sm-4">
		<g:field name="codVenda" class="form-control" type="number" value="${vendaInstance.codVenda}" required=""/>

		<g:hasErrors bean="${vendaInstance}" field="codVenda">
			<span class="glyphicon glyphicon-remove form-control-feedback"></span>
		</g:hasErrors>
	</div>
</div>

<div class="form-group ${hasErrors(bean: vendaInstance, field: 'cliente', 'has-error has-feedback')} required">
	<label class="col-sm-3 col-md-2 col-lg-1 control-label" for="cliente">
		<g:message code="venda.cliente.label" default="Cliente" />
		<span class="required-indicator">*</span>
	</label>
	<div class="col-sm-4">
		<g:select id="cliente" name="cliente.id" class="form-control" from="${loja.Cliente.list()}" optionKey="id" required="" value="${vendaInstance?.cliente?.id}"/>

		<g:hasErrors bean="${vendaInstance}" field="cliente">
			<span class="glyphicon glyphicon-remove form-control-feedback"></span>
		</g:hasErrors>
	</div>
</div>

<div class="form-group ${hasErrors(bean: vendaInstance, field: 'produto', 'has-error has-feedback')} ">
	<label class="col-sm-3 col-md-2 col-lg-1 control-label" for="produto">
		<g:message code="venda.produto.label" default="Produto" />
		
	</label>
	<div class="col-sm-4">
		<g:select name="produto" class="form-control" from="${loja.Produto.list()}" multiple="multiple" optionKey="id" size="5" value="${vendaInstance?.produto*.id}"/>

		<g:hasErrors bean="${vendaInstance}" field="produto">
			<span class="glyphicon glyphicon-remove form-control-feedback"></span>
		</g:hasErrors>
	</div>
</div>

<div class="form-group ${hasErrors(bean: vendaInstance, field: 'precoTotal', 'has-error has-feedback')} required">
	<label class="col-sm-3 col-md-2 col-lg-1 control-label" for="precoTotal">
		<g:message code="venda.precoTotal.label" default="Preco Total" />
		<span class="required-indicator">*</span>
	</label>
	<div class="col-sm-4">
		<g:field name="precoTotal" class="form-control" value="${fieldValue(bean: vendaInstance, field: 'precoTotal')}" required=""/>

		<g:hasErrors bean="${vendaInstance}" field="precoTotal">
			<span class="glyphicon glyphicon-remove form-control-feedback"></span>
		</g:hasErrors>
	</div>
</div>

<div class="form-group ${hasErrors(bean: vendaInstance, field: 'status', 'has-error has-feedback')} required">
	<label class="col-sm-3 col-md-2 col-lg-1 control-label" for="status">
		<g:message code="venda.status.label" default="Status" />
		<span class="required-indicator">*</span>
	</label>
	<div class="col-sm-4">
		<g:textField name="status" class="form-control" required="" value="${vendaInstance?.status}"/>

		<g:hasErrors bean="${vendaInstance}" field="status">
			<span class="glyphicon glyphicon-remove form-control-feedback"></span>
		</g:hasErrors>
	</div>
</div>

<div class="form-group ${hasErrors(bean: vendaInstance, field: 'dataVenda', 'has-error has-feedback')} required">
	<label class="col-sm-3 col-md-2 col-lg-1 control-label" for="dataVenda">
		<g:message code="venda.dataVenda.label" default="Data Venda" />
		<span class="required-indicator">*</span>
	</label>
	<div class="col-sm-4">
		<g:datePicker name="dataVenda" precision="day"  value="${vendaInstance?.dataVenda}"  />

		<g:hasErrors bean="${vendaInstance}" field="dataVenda">
			<span class="glyphicon glyphicon-remove form-control-feedback"></span>
		</g:hasErrors>
	</div>
</div>

