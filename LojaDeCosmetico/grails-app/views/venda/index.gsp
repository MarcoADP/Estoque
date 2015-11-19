
<%@ page import="loja.Venda" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'venda.label', default: 'Venda')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-venda" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-venda" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
			<thead>
					<tr>
					
						<g:sortableColumn property="codVenda" title="${message(code: 'venda.codVenda.label', default: 'Cod Venda')}" />
					
						<g:sortableColumn property="precoTotal" title="${message(code: 'venda.precoTotal.label', default: 'Preco Total')}" />
					
						<th><g:message code="venda.cliente.label" default="Cliente" /></th>
					
						<g:sortableColumn property="status" title="${message(code: 'venda.status.label', default: 'Status')}" />
					
						<g:sortableColumn property="dataVenda" title="${message(code: 'venda.dataVenda.label', default: 'Data Venda')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${vendaInstanceList}" status="i" var="vendaInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${vendaInstance.id}">${fieldValue(bean: vendaInstance, field: "codVenda")}</g:link></td>
					
						<td>${fieldValue(bean: vendaInstance, field: "precoTotal")}</td>
					
						<td>${fieldValue(bean: vendaInstance, field: "cliente")}</td>
					
						<td>${fieldValue(bean: vendaInstance, field: "status")}</td>
					
						<td><g:formatDate date="${vendaInstance.dataVenda}" /></td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${vendaInstanceCount ?: 0}" />
			</div>
		</div>
	</body>
</html>
