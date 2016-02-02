<%@ page import="loja.Cliente" %>



<div class="form-group ${hasErrors(bean: clienteInstance, field: 'nome', 'has-error has-feedback')} required">
	<label class="col-sm-3 col-md-2 col-lg-2 control-label" for="nome">
		<g:message code="cliente.nome.label" default="Nome" />
		<span class="required-indicator">*</span>
	</label>
	<div class="col-sm-6">
		<g:textField name="nome" class="form-control" required="" value="${clienteInstance?.nome}"/>

		<g:hasErrors bean="${clienteInstance}" field="nome">
			<span class="glyphicon glyphicon-remove form-control-feedback"></span>
		</g:hasErrors>
	</div>
</div>

<div class="form-group ${hasErrors(bean: clienteInstance, field: 'cpf', 'has-error has-feedback')} required">
	<label class="col-sm-3 col-md-2 col-lg-2 control-label" for="cpf">
		<g:message code="cliente.cpf.label" default="Cpf" />
		<span class="required-indicator">*</span>
	</label>
	<div class="col-sm-6">
		<g:textField id="cpf" name="cpf" class="form-control" required="" value="${clienteInstance?.cpf}"/>

		<g:hasErrors bean="${clienteInstance}" field="cpf">
			<span class="glyphicon glyphicon-remove form-control-feedback"></span>
		</g:hasErrors>
	</div>
</div>

<div class="form-group ${hasErrors(bean: clienteInstance, field: 'endereco', 'has-error has-feedback')} required">
	<label class="col-sm-3 col-md-2 col-lg-2 control-label" for="endereco">
		<g:message code="cliente.endereco.label" default="Endereco" />
		<span class="required-indicator">*</span>
	</label>
	<div class="col-sm-6">
		<g:textField name="endereco" class="form-control" required="" value="${clienteInstance?.endereco}"/>

		<g:hasErrors bean="${clienteInstance}" field="endereco">
			<span class="glyphicon glyphicon-remove form-control-feedback"></span>
		</g:hasErrors>
	</div>
</div>

<div class="form-group ${hasErrors(bean: clienteInstance, field: 'telefone', 'has-error has-feedback')} required">
	<label class="col-sm-3 col-md-2 col-lg-2 control-label" for="telefone">
		<g:message code="cliente.telefone.label" default="Telefone" />
		<span class="required-indicator">*</span>
	</label>
	<div class="col-sm-6">
		<g:textField id="fone" name="telefone" class="form-control" required="" value="${clienteInstance?.telefone}"/>

		<g:hasErrors bean="${clienteInstance}" field="telefone">
			<span class="glyphicon glyphicon-remove form-control-feedback"></span>
		</g:hasErrors>
	</div>
</div>

<div class="form-group ${hasErrors(bean: clienteInstance, field: 'dataNascimento', 'has-error has-feedback')} required">
	<label class="col-sm-3 col-md-2 col-lg-2 control-label" for="dataNascimento">
		<g:message code="cliente.dataNascimento.label" default="Data Nascimento" />
		<span class="required-indicator">*</span>
	</label>
	<div class="col-sm-6">
		<g:datePicker name="dataNascimento" precision="day"  value="${clienteInstance?.dataNascimento}"  />

		<g:hasErrors bean="${clienteInstance}" field="dataNascimento">
			<span class="glyphicon glyphicon-remove form-control-feedback"></span>
		</g:hasErrors>
	</div>
</div>

<script type='text/javascript'>
	jQuery(function($){
		$("#fone").mask("(99) 9999-9999");
		$("#cpf").mask("999.999.999-99");
	});
</script>

