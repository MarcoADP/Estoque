<%@ page import="loja.Produto" %>



<div class="form-group ${hasErrors(bean: produtoInstance, field: 'codigo', 'has-error has-feedback')} required">
	<label class="col-sm-3 col-md-2 col-lg-2 control-label" for="codigo">
		<g:message code="produto.codigo.label" default="Codigo" />
		<span class="required-indicator">*</span>
	</label>
	<div class="col-sm-6">
		<g:field name="codigo" class="form-control" type="number" value="${produtoInstance.codigo}" required=""/>

		<g:hasErrors bean="${produtoInstance}" field="codigo">
			<span class="glyphicon glyphicon-remove form-control-feedback"></span>
		</g:hasErrors>
	</div>
</div>

<div class="form-group ${hasErrors(bean: produtoInstance, field: 'nome', 'has-error has-feedback')} required">
	<label class="col-sm-3 col-md-2 col-lg-2 control-label" for="nome">
		<g:message code="produto.nome.label" default="Nome" />
		<span class="required-indicator">*</span>
	</label>
	<div class="col-sm-6">
		<g:textField name="nome" class="form-control" required="" value="${produtoInstance?.nome}"/>

		<g:hasErrors bean="${produtoInstance}" field="nome">
			<span class="glyphicon glyphicon-remove form-control-feedback"></span>
		</g:hasErrors>
	</div>
</div>

<div class="form-group ${hasErrors(bean: produtoInstance, field: 'preco', 'has-error has-feedback')} required">
	<label class="col-sm-3 col-md-2 col-lg-2 control-label" for="preco">
		<g:message code="produto.preco.label" default="Preco" />
		<span class="required-indicator">*</span>
	</label>
	<div class="col-sm-6">
		<g:field name="preco" class="form-control" onKeyPress="mascara(this, mvalor)" value="${fieldValue(bean: produtoInstance, field: 'preco')}" required="" type="text"/>

		<g:hasErrors bean="${produtoInstance}" field="preco">
			<span class="glyphicon glyphicon-remove form-control-feedback"></span>
		</g:hasErrors>
	</div>
</div>

<div class="form-group ${hasErrors(bean: produtoInstance, field: 'quantidade', 'has-error has-feedback')} required">
	<label class="col-sm-3 col-md-2 col-lg-2 control-label" for="quantidade">
		<g:message code="produto.quantidade.label" default="Quantidade" />
		<span class="required-indicator">*</span>
	</label>
	<div class="col-sm-6">
		<g:field name="quantidade" class="form-control" type="number" min="0" value="${produtoInstance.quantidade}" required=""/>

		<g:hasErrors bean="${produtoInstance}" field="quantidade">
			<span class="glyphicon glyphicon-remove form-control-feedback"></span>
		</g:hasErrors>
	</div>
</div>

<div class="form-group ${hasErrors(bean: produtoInstance, field: 'dataFabricacao', 'has-error has-feedback')} required">
	<label class="col-sm-3 col-md-2 col-lg-2 control-label" for="dataFabricacao">
		<g:message code="produto.dataFabricacao.label" default="Data Fabricacao" />
		<span class="required-indicator">*</span>
	</label>
	<div class="col-sm-9">
		<g:datePicker name="dataFabricacao" precision="day"  value="${produtoInstance?.dataFabricacao}"  />

		<g:hasErrors bean="${produtoInstance}" field="dataFabricacao">
			<span class="glyphicon glyphicon-remove form-control-feedback"></span>
		</g:hasErrors>
	</div>
</div>

<div class="form-group ${hasErrors(bean: produtoInstance, field: 'dataVencimento', 'has-error has-feedback')} required">
	<label class="col-sm-3 col-md-2 col-lg-2 control-label" for="dataVencimento">
		<g:message code="produto.dataVencimento.label" default="Data Vencimento" />
		<span class="required-indicator">*</span>
	</label>
	<div class="col-sm-9">
		<g:datePicker name="dataVencimento" precision="day"  value="${produtoInstance?.dataVencimento}"  />

		<g:hasErrors bean="${produtoInstance}" field="dataVencimento">
			<span class="glyphicon glyphicon-remove form-control-feedback"></span>
		</g:hasErrors>
	</div>
</div>
