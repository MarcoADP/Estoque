<%@ page import="loja.Cliente" %>



<div class="form-group ${hasErrors(bean: clienteInstance, field: 'nome', 'has-error has-feedback')} required">
	<label class="col-sm-3 col-md-2 col-lg-1 control-label" for="nome">
		<g:message code="cliente.nome.label" default="Nome" />
		<span class="required-indicator">*</span>
	</label>
	<div class="col-sm-4">
		<g:textField name="nome" class="form-control" required="" value="${clienteInstance?.nome}"/>

		<g:hasErrors bean="${clienteInstance}" field="nome">
			<span class="glyphicon glyphicon-remove form-control-feedback"></span>
		</g:hasErrors>
	</div>
</div>

<div class="form-group ${hasErrors(bean: clienteInstance, field: 'endereco', 'has-error has-feedback')} required">
	<label class="col-sm-3 col-md-2 col-lg-1 control-label" for="endereco">
		<g:message code="cliente.endereco.label" default="Endereco" />
		<span class="required-indicator">*</span>
	</label>
	<div class="col-sm-4">
		<g:textField name="endereco" class="form-control" required="" value="${clienteInstance?.endereco}"/>

		<g:hasErrors bean="${clienteInstance}" field="endereco">
			<span class="glyphicon glyphicon-remove form-control-feedback"></span>
		</g:hasErrors>
	</div>
</div>

<div class="form-group ${hasErrors(bean: clienteInstance, field: 'telefone', 'has-error has-feedback')} required">
	<label class="col-sm-3 col-md-2 col-lg-1 control-label" for="telefone">
		<g:message code="cliente.telefone.label" default="Telefone" />
		<span class="required-indicator">*</span>
	</label>
	<div class="col-sm-4">
		<g:field name="telefone" class="form-control" type="number" value="${clienteInstance.telefone}" required=""/>

		<g:hasErrors bean="${clienteInstance}" field="telefone">
			<span class="glyphicon glyphicon-remove form-control-feedback"></span>
		</g:hasErrors>
	</div>
</div>

<div class="form-group ${hasErrors(bean: clienteInstance, field: 'dataNascimento', 'has-error has-feedback')} required">
	<label class="col-sm-3 col-md-2 col-lg-1 control-label" for="dataNascimento">
		<g:message code="cliente.dataNascimento.label" default="Data Nascimento" />
		<span class="required-indicator">*</span>
	</label>
	<div class="col-sm-4">
		<g:datePicker name="dataNascimento" precision="day"  value="${clienteInstance?.dataNascimento}"  />

		<g:hasErrors bean="${clienteInstance}" field="dataNascimento">
			<span class="glyphicon glyphicon-remove form-control-feedback"></span>
		</g:hasErrors>
	</div>
</div>

<div class="form-group ${hasErrors(bean: clienteInstance, field: 'idade', 'has-error has-feedback')} required">
	<label class="col-sm-3 col-md-2 col-lg-1 control-label" for="idade">
		<g:message code="cliente.idade.label" default="Idade" />
		<span class="required-indicator">*</span>
	</label>
	<div class="col-sm-4">
		<g:field name="idade" class="form-control" type="number" value="${clienteInstance.idade}" required=""/>

		<g:hasErrors bean="${clienteInstance}" field="idade">
			<span class="glyphicon glyphicon-remove form-control-feedback"></span>
		</g:hasErrors>
	</div>
</div>

<div class="form-group ${hasErrors(bean: clienteInstance, field: 'dataCadastro', 'has-error has-feedback')} required">
	<label class="col-sm-3 col-md-2 col-lg-1 control-label" for="dataCadastro">
		<g:message code="cliente.dataCadastro.label" default="Data Cadastro" />
		<span class="required-indicator">*</span>
	</label>
	<div class="col-sm-4">
		<g:datePicker name="dataCadastro" precision="day"  value="${clienteInstance?.dataCadastro}"  />

		<g:hasErrors bean="${clienteInstance}" field="dataCadastro">
			<span class="glyphicon glyphicon-remove form-control-feedback"></span>
		</g:hasErrors>
	</div>
</div>

