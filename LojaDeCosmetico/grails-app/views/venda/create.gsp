<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'venda.label', default: 'Venda')}" />
		<title><g:message code="default.create.label" args="[entityName]" /></title>
	</head>
	<body>
		%{--<a href="#create-venda" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>--}%
		<div class="page-header" role="navigation">
			<a class="btn btn-info" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a>
			<g:link class="btn btn-info" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link>
		</div>
		<div id="create-venda" role="main">
			<h1 class="titulo-crud"><g:message code="default.create.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
				<div class="alert alert-success" role="status">${flash.message}</div>
			</g:if>
			<g:hasErrors bean="${vendaInstance}">
				<div class="alert alert-danger">
					<ul class="errors" role="alert">
						<g:eachError bean="${vendaInstance}" var="error">
						<li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
						</g:eachError>
					</ul>
				</div>
			</g:hasErrors>
			<g:form url="[resource:vendaInstance, action:'save']"  class="form-horizontal">
				<g:render template="form"/>

				<hr>
				<fieldset class="buttons">
					<g:submitButton name="create" class="btn btn-success" value="${message(code: 'default.button.create.label', default: 'Create')}" />
				</fieldset>
			</g:form>

			<div class="modal fade" id="modal-novo-produto" tabindex="-1" role="dialog" aria-labelledby="#modal-novo-produto-label" aria-hidden="true">
				<div class="modal-dialog">
					<div class="modal-content">
						<div class="modal-header">
							<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
							<h3 class="modal-title" id="modal-novo-produto-label">
								Novo item de produto
							</h3>
						</div>
						<g:form id="new-item-form" url="[resource:vendaInstance, action:'addProduct']">
							<div class="modal-body text-left">
								<div class="row">
									<div class="form-group col-xs-12 col-sm-12 col-md-12 col-lg-12 ${hasErrors(bean: vendaInstance, field: 'valorTotal', 'error')} required">
										<label for="valorTotal">
											Produto
											<span class="required-indicator">*</span>
										</label>
										<g:select class="form-control" id="produto" name="produto.id"
												  from="${loja.Produto.list()}"
												  optionKey="id" required=""
												  value="${produtoInstance?.id}"
												  class="many-to-one"/>
									</div>
								</div>
								<div class="row">
									<div class="form-group col-xs-12 col-sm-6 col-md-6 col-lg-6 ${hasErrors(bean: vendaInstance, field: 'valorTotal', 'error')} required">
										<label for="valorTotal">
											Quantidade
											<span class="required-indicator">*</span>
										</label>
										<input type="number" name="quantidade" class="form-control" value="1" min="1" />
									</div>
								</div>
							</div>
							<div class="modal-footer">
								<button type="button" class="btn btn-default" data-dismiss="modal">Fechar</button>
								<button type="submit" class="btn btn-primary">Salvar</button>
							</div>
						</g:form>
					</div>
				</div>
			</div>
		</div>
	</body>
</html>
