<%@ page import="loja.Fornecedor" %>



<div class="form-group ${hasErrors(bean: fornecedorInstance, field: 'nome', 'has-error has-feedback')} required">
	<label class="col-sm-3 col-md-2 col-lg-1 control-label" for="nome">
		<g:message code="fornecedor.nome.label" default="Nome" />
		<span class="required-indicator">*</span>
	</label>
	<div class="col-sm-4">
		<g:textField name="nome" class="form-control" required="" value="${fornecedorInstance?.nome}"/>

		<g:hasErrors bean="${fornecedorInstance}" field="nome">
			<span class="glyphicon glyphicon-remove form-control-feedback"></span>
		</g:hasErrors>
	</div>
</div>

<div class="form-group ${hasErrors(bean: fornecedorInstance, field: 'cnpj', 'has-error has-feedback')} required">
	<label class="col-sm-3 col-md-2 col-lg-1 control-label" for="cnpj">
		<g:message code="fornecedor.cnpj.label" default="Cnpj" />
		<span class="required-indicator">*</span>
	</label>
	<div class="col-sm-4">
		<g:textField name="cnpj" class="form-control" required="" value="${fornecedorInstance?.cnpj}"/>

		<g:hasErrors bean="${fornecedorInstance}" field="cnpj">
			<span class="glyphicon glyphicon-remove form-control-feedback"></span>
		</g:hasErrors>
	</div>
</div>

<div class="form-group ${hasErrors(bean: fornecedorInstance, field: 'codFor', 'has-error has-feedback')} required">
	<label class="col-sm-3 col-md-2 col-lg-1 control-label" for="codFor">
		<g:message code="fornecedor.codFor.label" default="Cod For" />
		<span class="required-indicator">*</span>
	</label>
	<div class="col-sm-4">
		<g:textField name="codFor" class="form-control" required="" value="${fornecedorInstance?.codFor}"/>

		<g:hasErrors bean="${fornecedorInstance}" field="codFor">
			<span class="glyphicon glyphicon-remove form-control-feedback"></span>
		</g:hasErrors>
	</div>
</div>

<div class="form-group ${hasErrors(bean: fornecedorInstance, field: 'empresa', 'has-error has-feedback')} required">
	<label class="col-sm-3 col-md-2 col-lg-1 control-label" for="empresa">
		<g:message code="fornecedor.empresa.label" default="Empresa" />
		<span class="required-indicator">*</span>
	</label>
	<div class="col-sm-4">
		<g:textField name="empresa" class="form-control" required="" value="${fornecedorInstance?.empresa}"/>

		<g:hasErrors bean="${fornecedorInstance}" field="empresa">
			<span class="glyphicon glyphicon-remove form-control-feedback"></span>
		</g:hasErrors>
	</div>
</div>

