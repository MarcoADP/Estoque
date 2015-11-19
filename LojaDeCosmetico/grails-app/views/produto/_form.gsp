<%@ page import="loja.Produto" %>



<div class="fieldcontain ${hasErrors(bean: produtoInstance, field: 'codigo', 'error')} required">
	<label for="codigo">
		<g:message code="produto.codigo.label" default="Codigo" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="codigo" type="number" value="${produtoInstance.codigo}" required=""/>

</div>

<div class="fieldcontain ${hasErrors(bean: produtoInstance, field: 'nome', 'error')} required">
	<label for="nome">
		<g:message code="produto.nome.label" default="Nome" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="nome" required="" value="${produtoInstance?.nome}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: produtoInstance, field: 'preco', 'error')} required">
	<label for="preco">
		<g:message code="produto.preco.label" default="Preco" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="preco" value="${fieldValue(bean: produtoInstance, field: 'preco')}" required=""/>

</div>

<div class="fieldcontain ${hasErrors(bean: produtoInstance, field: 'quantidade', 'error')} required">
	<label for="quantidade">
		<g:message code="produto.quantidade.label" default="Quantidade" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="quantidade" type="number" min="0" value="${produtoInstance.quantidade}" required=""/>

</div>

<div class="fieldcontain ${hasErrors(bean: produtoInstance, field: 'dataFabricacao', 'error')} required">
	<label for="dataFabricacao">
		<g:message code="produto.dataFabricacao.label" default="Data Fabricacao" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="dataFabricacao" precision="day"  value="${produtoInstance?.dataFabricacao}"  />

</div>

<div class="fieldcontain ${hasErrors(bean: produtoInstance, field: 'dataVencimento', 'error')} required">
	<label for="dataVencimento">
		<g:message code="produto.dataVencimento.label" default="Data Vencimento" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="dataVencimento" precision="day"  value="${produtoInstance?.dataVencimento}"  />

</div>

