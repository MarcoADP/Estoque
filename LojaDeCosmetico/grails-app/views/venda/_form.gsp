<%@ page import="loja.Venda" %>



<div class="form-group ${hasErrors(bean: vendaInstance, field: 'codVenda', 'error')} required">
	<label class="col-sm-2 control-label" for="codVenda">
		<g:message code="venda.codVenda.label" default="Cod Venda" />
		<span class="required-indicator">*</span>
	</label>
<div class="col-sm-10">
	<g:field class="form-control" name="codVenda" type="number" value="${vendaInstance.codVenda}" required=""/>
</div>

</div>

<div class="form-group ${hasErrors(bean: vendaInstance, field: 'precoTotal', 'error')} required">
	<label class="col-sm-2 control-label" for="precoTotal">
		<g:message code="venda.precoTotal.label" default="Preco Total" />
		<span class="required-indicator">*</span>
	</label>
<div class="col-sm-10">
	<g:field class="form-control" name="precoTotal" value="${fieldValue(bean: vendaInstance, field: 'precoTotal')}" required=""/>
</div>

</div>

<div class="form-group ${hasErrors(bean: vendaInstance, field: 'cliente', 'error')} required">
	<label class="col-sm-2 control-label" for="cliente">
		<g:message code="venda.cliente.label" default="Cliente" />
		<span class="required-indicator">*</span>
	</label>
<div class="col-sm-10">
	<g:select class="form-control" id="cliente" name="cliente.id" from="${loja.Cliente.list()}" optionKey="id" required="" value="${vendaInstance?.cliente?.id}"/>
</div>
</div>

<div class="form-group ${hasErrors(bean: vendaInstance, field: 'status', 'error')} required">
	<label class="col-sm-2 control-label" for="status">
		<g:message code="venda.status.label" default="Status" />
		<span class="required-indicator">*</span>
	</label>
<div class="col-sm-10">
	<g:textField class="form-control" name="status" required="" value="${vendaInstance?.status}"/>
</div>
</div>

<div class="form-group ${hasErrors(bean: vendaInstance, field: 'dataVenda', 'error')} required">
	<label class="col-sm-2 control-label" for="dataVenda">
		<g:message code="venda.dataVenda.label" default="Data Venda" />
		<span class="required-indicator">*</span>
	</label>
<div class="col-sm-10">
	<g:datePicker class="form-control"  name="dataVenda" precision="day"  value="${vendaInstance?.dataVenda}"  />
</div>
</div>

