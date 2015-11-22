<%@ page import="loja.Usuario" %>



<div class="form-group ${hasErrors(bean: usuarioInstance, field: 'username', 'has-error has-feedback')} required">
	<label class="col-sm-3 col-md-2 col-lg-1 control-label" for="username">
		<g:message code="usuario.username.label" default="Username" />
		<span class="required-indicator">*</span>
	</label>
	<div class="col-sm-4">
		<g:textField name="username" class="form-control" required="" value="${usuarioInstance?.username}"/>

		<g:hasErrors bean="${usuarioInstance}" field="username">
			<span class="glyphicon glyphicon-remove form-control-feedback"></span>
		</g:hasErrors>
	</div>
</div>

<div class="form-group ${hasErrors(bean: usuarioInstance, field: 'password', 'has-error has-feedback')} required">
	<label class="col-sm-3 col-md-2 col-lg-1 control-label" for="password">
		<g:message code="usuario.password.label" default="Password" />
		<span class="required-indicator">*</span>
	</label>
	<div class="col-sm-4">
		<g:textField name="password" class="form-control" required="" value="${usuarioInstance?.password}"/>

		<g:hasErrors bean="${usuarioInstance}" field="password">
			<span class="glyphicon glyphicon-remove form-control-feedback"></span>
		</g:hasErrors>
	</div>
</div>

<div class="form-group ${hasErrors(bean: usuarioInstance, field: 'accountExpired', 'has-error has-feedback')} ">
	<label class="col-sm-3 col-md-2 col-lg-1 control-label" for="accountExpired">
		<g:message code="usuario.accountExpired.label" default="Account Expired" />
		
	</label>
	<div class="col-sm-4">
		<g:checkBox name="accountExpired" value="${usuarioInstance?.accountExpired}" />

		<g:hasErrors bean="${usuarioInstance}" field="accountExpired">
			<span class="glyphicon glyphicon-remove form-control-feedback"></span>
		</g:hasErrors>
	</div>
</div>

<div class="form-group ${hasErrors(bean: usuarioInstance, field: 'accountLocked', 'has-error has-feedback')} ">
	<label class="col-sm-3 col-md-2 col-lg-1 control-label" for="accountLocked">
		<g:message code="usuario.accountLocked.label" default="Account Locked" />
		
	</label>
	<div class="col-sm-4">
		<g:checkBox name="accountLocked" value="${usuarioInstance?.accountLocked}" />

		<g:hasErrors bean="${usuarioInstance}" field="accountLocked">
			<span class="glyphicon glyphicon-remove form-control-feedback"></span>
		</g:hasErrors>
	</div>
</div>

<div class="form-group ${hasErrors(bean: usuarioInstance, field: 'enabled', 'has-error has-feedback')} ">
	<label class="col-sm-3 col-md-2 col-lg-1 control-label" for="enabled">
		<g:message code="usuario.enabled.label" default="Enabled" />
		
	</label>
	<div class="col-sm-4">
		<g:checkBox name="enabled" value="${usuarioInstance?.enabled}" />

		<g:hasErrors bean="${usuarioInstance}" field="enabled">
			<span class="glyphicon glyphicon-remove form-control-feedback"></span>
		</g:hasErrors>
	</div>
</div>

<div class="form-group ${hasErrors(bean: usuarioInstance, field: 'passwordExpired', 'has-error has-feedback')} ">
	<label class="col-sm-3 col-md-2 col-lg-1 control-label" for="passwordExpired">
		<g:message code="usuario.passwordExpired.label" default="Password Expired" />
		
	</label>
	<div class="col-sm-4">
		<g:checkBox name="passwordExpired" value="${usuarioInstance?.passwordExpired}" />

		<g:hasErrors bean="${usuarioInstance}" field="passwordExpired">
			<span class="glyphicon glyphicon-remove form-control-feedback"></span>
		</g:hasErrors>
	</div>
</div>

