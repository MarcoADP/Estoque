
<%@ page import="loja.Cliente" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'cliente.label', default: 'Cliente')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-cliente" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-cliente" class="table-responsive" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table class="table table-striped table-bordered">
			<thead>
					<tr>
					
						<g:sortableColumn property="nome" title="${message(code: 'cliente.nome.label', default: 'Nome')}" />
					
						<g:sortableColumn property="endereco" title="${message(code: 'cliente.endereco.label', default: 'Endereco')}" />
					
						<g:sortableColumn property="telefone" title="${message(code: 'cliente.telefone.label', default: 'Telefone')}" />
					
						<g:sortableColumn property="dataNascimento" title="${message(code: 'cliente.dataNascimento.label', default: 'Data Nascimento')}" />
					
						<g:sortableColumn property="idade" title="${message(code: 'cliente.idade.label', default: 'Idade')}" />
					
						<g:sortableColumn property="dataCadastro" title="${message(code: 'cliente.dataCadastro.label', default: 'Data Cadastro')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${clienteInstanceList}" status="i" var="clienteInstance">
					<tr>
					
						<td><g:link action="show" id="${clienteInstance.id}">${fieldValue(bean: clienteInstance, field: "nome")}</g:link></td>
					
						<td>${fieldValue(bean: clienteInstance, field: "endereco")}</td>
					
						<td>${fieldValue(bean: clienteInstance, field: "telefone")}</td>
					
						<td><g:formatDate date="${clienteInstance.dataNascimento}" /></td>
					
						<td>${fieldValue(bean: clienteInstance, field: "idade")}</td>
					
						<td><g:formatDate date="${clienteInstance.dataCadastro}" /></td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${clienteInstanceCount ?: 0}" />
			</div>
		</div>
	</body>
</html>
