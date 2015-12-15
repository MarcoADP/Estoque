<%@ page import="loja.Produto" %>



<div class="form-group ${hasErrors(bean: produtoInstance, field: 'codigo', 'has-error has-feedback')} required">
	<label class="col-sm-3 col-md-2 col-lg-1 control-label" for="codigo">
		<g:message code="produto.codigo.label" default="Codigo" />
		<span class="required-indicator">*</span>
	</label>
	<div class="col-sm-4">
		<g:field name="codigo" class="form-control" type="number" value="${produtoInstance.codigo}" required=""/>

		<g:hasErrors bean="${produtoInstance}" field="codigo">
			<span class="glyphicon glyphicon-remove form-control-feedback"></span>
		</g:hasErrors>
	</div>
</div>

<div class="form-group ${hasErrors(bean: produtoInstance, field: 'nome', 'has-error has-feedback')} required">
	<label class="col-sm-3 col-md-2 col-lg-1 control-label" for="nome">
		<g:message code="produto.nome.label" default="Nome" />
		<span class="required-indicator">*</span>
	</label>
	<div class="col-sm-4">
		<g:textField name="nome" class="form-control" required="" value="${produtoInstance?.nome}"/>

		<g:hasErrors bean="${produtoInstance}" field="nome">
			<span class="glyphicon glyphicon-remove form-control-feedback"></span>
		</g:hasErrors>
	</div>
</div>

<div class="form-group ${hasErrors(bean: produtoInstance, field: 'preco', 'has-error has-feedback')} required">
	<label class="col-sm-3 col-md-2 col-lg-1 control-label" for="preco">
		<g:message code="produto.preco.label" default="Preco" />
		<span class="required-indicator">*</span>
	</label>
	<div class="col-sm-4">
		<g:field name="preco" class="form-control" value="${fieldValue(bean: produtoInstance, field: 'preco')}" required=""/>

		<g:hasErrors bean="${produtoInstance}" field="preco">
			<span class="glyphicon glyphicon-remove form-control-feedback"></span>
		</g:hasErrors>
	</div>
</div>

<div class="form-group ${hasErrors(bean: produtoInstance, field: 'quantidade_in_stock', 'has-error has-feedback')} required">
	<label class="col-sm-3 col-md-2 col-lg-1 control-label" for="quantidade_in_stock">
		<g:message code="produto.quantidade_in_stock.label" default="Quantidadeinstock" />
		<span class="required-indicator">*</span>
	</label>
	<div class="col-sm-4">
		<g:field name="quantidade_in_stock" class="form-control" type="number" min="0" value="${produtoInstance.quantidade_in_stock}" required=""/>

		<g:hasErrors bean="${produtoInstance}" field="quantidade_in_stock">
			<span class="glyphicon glyphicon-remove form-control-feedback"></span>
		</g:hasErrors>
	</div>
</div>

<div class="form-group ${hasErrors(bean: produtoInstance, field: 'quantidade_vendido', 'has-error has-feedback')} required">
	<label class="col-sm-3 col-md-2 col-lg-1 control-label" for="quantidade_vendido">
		<g:message code="produto.quantidade_vendido.label" default="Quantidadevendido" />
		<span class="required-indicator">*</span>
	</label>
	<div class="col-sm-4">
		<g:field name="quantidade_vendido" class="form-control" type="number" min="0" value="${produtoInstance.quantidade_vendido}" required=""/>

		<g:hasErrors bean="${produtoInstance}" field="quantidade_vendido">
			<span class="glyphicon glyphicon-remove form-control-feedback"></span>
		</g:hasErrors>
	</div>
</div>

<div class="form-group ${hasErrors(bean: produtoInstance, field: 'dataFabricacao', 'has-error has-feedback')} required">
	<label class="col-sm-3 col-md-2 col-lg-1 control-label" for="dataFabricacao">
		<g:message code="produto.dataFabricacao.label" default="Data Fabricacao" />
		<span class="required-indicator">*</span>
	</label>
	<div class="col-sm-4">
		<g:datePicker name="dataFabricacao" precision="day"  value="${produtoInstance?.dataFabricacao}"  />

		<g:hasErrors bean="${produtoInstance}" field="dataFabricacao">
			<span class="glyphicon glyphicon-remove form-control-feedback"></span>
		</g:hasErrors>
	</div>
</div>

<div class="form-group ${hasErrors(bean: produtoInstance, field: 'dataVencimento', 'has-error has-feedback')} required">
	<label class="col-sm-3 col-md-2 col-lg-1 control-label" for="dataVencimento">
		<g:message code="produto.dataVencimento.label" default="Data Vencimento" />
		<span class="required-indicator">*</span>
	</label>
	<div class="col-sm-4">
		<g:datePicker name="dataVencimento" precision="day"  value="${produtoInstance?.dataVencimento}"  />

		<g:hasErrors bean="${produtoInstance}" field="dataVencimento">
			<span class="glyphicon glyphicon-remove form-control-feedback"></span>
		</g:hasErrors>
	</div>
</div>

