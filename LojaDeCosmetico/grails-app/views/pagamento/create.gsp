<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'pagamento.label', default: 'Pagamento')}" />
		<title><g:message code="default.create.label" args="[entityName]" /></title>
	</head>
	<body>
		%{--<a href="#create-pagamento" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>--}%
		<div class="page-header" role="navigation">
			<a class="btn btn-info" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a>
			<g:link class="btn btn-info" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link>
		</div>
		<div id="create-pagamento" role="main">
			<h1 class="titulo-crud"><g:message code="default.pagamento.create.label" /></h1>
			<g:if test="${flash.message}">
				<div class="alert alert-success" role="status">${flash.message}</div>
			</g:if>
			<g:hasErrors bean="${pagamentoInstance}">
				<div class="alert alert-danger">
					<ul class="errors" role="alert">
						<g:eachError bean="${pagamentoInstance}" var="error">
						<li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
						</g:eachError>
					</ul>
				</div>
			</g:hasErrors>
			<div class="row col-lg-6">
				<g:form url="[resource:pagamentoInstance, action:'save']"  class="form-horizontal">
					<div class="bs-callout bs-callout-primary">
						<g:render template="form"/>
					</div>

					<hr>
					<fieldset class="buttons">
						<g:submitButton name="create" class="btn btn-success" value="${message(code: 'default.button.create.pagamento.label', default: 'Continuar')}" />
					</fieldset>
				</g:form>
			</div>
		</div>
	</body>
</html>
