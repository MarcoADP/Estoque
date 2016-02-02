
<%@ page import="loja.Usuario" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<meta charset="UTF-8">
		<g:set var="entityName" value="${message(code: 'usuario.label', default: 'Usuario')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		%{--<a href="#show-usuario" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>--}%
		<div class="page-header" role="navigation">
			<a class="btn btn-info" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a>
			<g:link class="btn btn-info" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link>
			<g:link class="btn btn-info" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link>
		</div>
		<div id="show-usuario" role="main">
			<h1 class="titulo-crud"><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
				<div class="alert alert-success" role="status">${flash.message}</div>
			</g:if>

			<div class="row bs-callout bs-callout-info">
			<form class="form-horizontal">

				<g:if test="${usuarioInstance}">
				<div class="form-group">
					<label id="username-label" class="col-sm-3 col-md-2 col-lg-1 control-label"><g:message code="usuario.username.label" default="Username" /></label>
					<div class="col-xs-4">

						<p class="form-control-static" aria-labelledby="username-label"><g:fieldValue bean="${usuarioInstance}" field="username"/></p>

					</div>
				</div>
				</g:if>

				<g:if test="${usuarioInstance}">
				<div class="form-group">
					<label id="password-label" class="col-sm-3 col-md-2 col-lg-1 control-label"><g:message code="usuario.password.label" default="Password" /></label>
					<div class="col-xs-4">

						<p class="form-control-static" aria-labelledby="password-label"><g:fieldValue bean="${usuarioInstance}" field="password"/></p>

					</div>
				</div>
				</g:if>

				<g:if test="${usuarioInstance}">
				<div class="form-group">
					<label id="nome-label" class="col-sm-3 col-md-2 col-lg-1 control-label"><g:message code="usuario.nome.label" default="Nome" /></label>
					<div class="col-xs-4">

						<p class="form-control-static" aria-labelledby="nome-label"><g:fieldValue bean="${usuarioInstance}" field="nome"/></p>

					</div>
				</div>
				</g:if>

				<g:if test="${usuarioInstance}">
				<div class="form-group">
					<label id="cpf-label" class="col-sm-3 col-md-2 col-lg-1 control-label"><g:message code="usuario.cpf.label" default="Cpf" /></label>
					<div class="col-xs-4">

						<p class="form-control-static" aria-labelledby="cpf-label"><g:formatCpf cpf="${usuarioInstance.cpf}"/></p>

					</div>
				</div>
				</g:if>

				<g:if test="${usuarioInstance}">
				<div class="form-group">
					<label id="cargo-label" class="col-sm-3 col-md-2 col-lg-1 control-label"><g:message code="usuario.cargo.label" default="Cargo" /></label>
					<div class="col-xs-4">

						<p class="form-control-static" aria-labelledby="cargo-label"><g:fieldValue bean="${usuarioInstance}" field="cargo"/></p>

					</div>
				</div>
				</g:if>

				<g:if test="${usuarioInstance}">
					<div class="form-group">
						<label id="dateCreated-label" class="col-sm-3 col-md-2 col-lg-1 control-label"><g:message code="usuario.dateCreated.label" default="Date Created" /></label>
						<div class="col-xs-4">

							<p class="form-control-static" aria-labelledby="dateCreated-label"><g:formatDate date="${usuarioInstance?.dateCreated}" /></p>

						</div>
					</div>
				</g:if>

				<g:if test="${usuarioInstance}">
				<div class="form-group">
					<label id="accountExpired-label" class="col-sm-3 col-md-2 col-lg-1 control-label"><g:message code="usuario.accountExpired.label" default="Account Expired" /></label>
					<div class="col-xs-4">

						<p class="form-control-static" aria-labelledby="accountExpired-label"><g:formatBoolean boolean="${usuarioInstance?.accountExpired}" /></p>

					</div>
				</div>
				</g:if>

				<g:if test="${usuarioInstance}">
				<div class="form-group">
					<label id="accountLocked-label" class="col-sm-3 col-md-2 col-lg-1 control-label"><g:message code="usuario.accountLocked.label" default="Account Locked" /></label>
					<div class="col-xs-4">

						<p class="form-control-static" aria-labelledby="accountLocked-label"><g:formatBoolean boolean="${usuarioInstance?.accountLocked}" /></p>

					</div>
				</div>
				</g:if>

				<g:if test="${usuarioInstance}">
				<div class="form-group">
					<label id="enabled-label" class="col-sm-3 col-md-2 col-lg-1 control-label"><g:message code="usuario.enabled.label" default="Enabled" /></label>
					<div class="col-xs-4">

						<p class="form-control-static" aria-labelledby="enabled-label"><g:formatBoolean boolean="${usuarioInstance?.enabled}" /></p>

					</div>
				</div>
				</g:if>

				<g:if test="${usuarioInstance}">
				<div class="form-group">
					<label id="passwordExpired-label" class="col-sm-3 col-md-2 col-lg-1 control-label"><g:message code="usuario.passwordExpired.label" default="Password Expired" /></label>
					<div class="col-xs-4">

						<p class="form-control-static" aria-labelledby="passwordExpired-label"><g:formatBoolean boolean="${usuarioInstance?.passwordExpired}" /></p>

					</div>
				</div>
				</g:if>

			</form>
			</div>
			<hr>
			<g:form url="[resource:usuarioInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:link class="btn btn-primary" action="edit" resource="${usuarioInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<a href="#DeleteModal" class="btn btn-danger" data-toggle="modal"><g:message code="default.button.delete.label" default="Delete" /></a>
				</fieldset>
			</g:form>
		</div>
	<g:render template="/layouts/deleteModal" model="[item: item]"/>
	</body>
</html>
