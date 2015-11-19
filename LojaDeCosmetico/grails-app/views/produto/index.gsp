

<%@ page import="loja.Produto" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'produto.label', default: 'Produto')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-produto" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-produto" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table class="table table-striped">
			<thead>
					<tr>
					
						<g:sortableColumn property="codigo" title="${message(code: 'produto.codigo.label', default: 'Codigo')}" />
					
						<g:sortableColumn property="nome" title="${message(code: 'produto.nome.label', default: 'Nome')}" />
					
						<g:sortableColumn property="preco" title="${message(code: 'produto.preco.label', default: 'Preco')}" />
					
						<g:sortableColumn property="quantidade" title="${message(code: 'produto.quantidade.label', default: 'Quantidade')}" />
					
						<g:sortableColumn property="dataFabricacao" title="${message(code: 'produto.dataFabricacao.label', default: 'Data Fabricacao')}" />
					
						<g:sortableColumn property="dataVencimento" title="${message(code: 'produto.dataVencimento.label', default: 'Data Vencimento')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${produtoInstanceList}" status="i" var="produtoInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${produtoInstance.id}">${fieldValue(bean: produtoInstance, field: "codigo")}</g:link></td>
					
						<td>${fieldValue(bean: produtoInstance, field: "nome")}</td>
					
						<td>${fieldValue(bean: produtoInstance, field: "preco")}</td>
					
						<td>${fieldValue(bean: produtoInstance, field: "quantidade")}</td>
					
						<td><g:formatDate date="${produtoInstance.dataFabricacao}" /></td>
					
						<td><g:formatDate date="${produtoInstance.dataVencimento}" /></td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${produtoInstanceCount ?: 0}" />
			</div>
		</div>
	</body>
</html>
