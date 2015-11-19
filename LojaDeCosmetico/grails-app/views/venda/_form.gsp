<%@ page import="loja.Venda" %>



<div class="fieldcontain ${hasErrors(bean: vendaInstance, field: 'codVenda', 'error')} required">
	<label for="codVenda">
		<g:message code="venda.codVenda.label" default="Cod Venda" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="codVenda" type="number" value="${vendaInstance.codVenda}" required=""/>

</div>

<div class="fieldcontain ${hasErrors(bean: vendaInstance, field: 'precoTotal', 'error')} required">
	<label for="precoTotal">
		<g:message code="venda.precoTotal.label" default="Preco Total" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="precoTotal" value="${fieldValue(bean: vendaInstance, field: 'precoTotal')}" required=""/>

</div>

<div class="fieldcontain ${hasErrors(bean: vendaInstance, field: 'cliente', 'error')} required">
	<label for="cliente">
		<g:message code="venda.cliente.label" default="Cliente" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="cliente" name="cliente.id" from="${loja.Cliente.list()}" optionKey="id" required="" value="${vendaInstance?.cliente?.id}" class="many-to-one"/>

</div>

<div class="fieldcontain ${hasErrors(bean: vendaInstance, field: 'status', 'error')} required">
	<label for="status">
		<g:message code="venda.status.label" default="Status" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="status" required="" value="${vendaInstance?.status}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: vendaInstance, field: 'dataVenda', 'error')} required">
	<label for="dataVenda">
		<g:message code="venda.dataVenda.label" default="Data Venda" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="dataVenda" precision="day"  value="${vendaInstance?.dataVenda}"  />

</div>

