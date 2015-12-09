<%@ page import="loja.Venda" %>



<div class="form-group ${hasErrors(bean: vendaInstance, field: 'cliente', 'has-error has-feedback')} ">
	<label class="col-sm-3 col-md-2 col-lg-1 control-label" for="cliente">
		<g:message code="venda.cliente.label" default="Cliente" />
		
	</label>
	<div class="col-sm-4">
		<g:select id="cliente" name="cliente.id" class="form-control" from="${loja.Cliente.list()}" optionKey="id" value="${vendaInstance?.cliente?.id}" noSelection="['null': '']"/>

		<g:hasErrors bean="${vendaInstance}" field="cliente">
			<span class="glyphicon glyphicon-remove form-control-feedback"></span>
		</g:hasErrors>
	</div>
</div>

<div class="form-group ${hasErrors(bean: vendaInstance, field: 'dataTransacao', 'has-error has-feedback')} required">
	<label class="col-sm-3 col-md-2 col-lg-1 control-label" for="dataTransacao">
		<g:message code="venda.dataTransacao.label" default="Data Transacao" />
		<span class="required-indicator">*</span>
	</label>
	<div class="col-sm-4">
		<g:datePicker name="dataTransacao" precision="day"  value="${vendaInstance?.dataTransacao}"  />

		<g:hasErrors bean="${vendaInstance}" field="dataTransacao">
			<span class="glyphicon glyphicon-remove form-control-feedback"></span>
		</g:hasErrors>
	</div>
</div>

<div class="form-group ${hasErrors(bean: vendaInstance, field: 'quantidadeTotal', 'has-error has-feedback')} required">
	<label class="col-sm-3 col-md-2 col-lg-1 control-label" for="quantidadeTotal">
		<g:message code="venda.quantidadeTotal.label" default="Quantidade Total" />
		<span class="required-indicator">*</span>
	</label>
	<div class="col-sm-4">
		<g:field name="quantidadeTotal" class="form-control" type="number" value="${vendaInstance.quantidadeTotal}" required=""/>

		<g:hasErrors bean="${vendaInstance}" field="quantidadeTotal">
			<span class="glyphicon glyphicon-remove form-control-feedback"></span>
		</g:hasErrors>
	</div>
</div>

<div class="form-group ${hasErrors(bean: vendaInstance, field: 'valorTotal', 'has-error has-feedback')} required">
	<label class="col-sm-3 col-md-2 col-lg-1 control-label" for="valorTotal">
		<g:message code="venda.valorTotal.label" default="Valor Total" />
		<span class="required-indicator">*</span>
	</label>
	<div class="col-sm-4">
		<g:field name="valorTotal" class="form-control" value="${fieldValue(bean: vendaInstance, field: 'valorTotal')}" required=""/>

		<g:hasErrors bean="${vendaInstance}" field="valorTotal">
			<span class="glyphicon glyphicon-remove form-control-feedback"></span>
		</g:hasErrors>
	</div>
</div>

<div class="form-group ${hasErrors(bean: vendaInstance, field: 'codigo', 'has-error has-feedback')} required">
	<label class="col-sm-3 col-md-2 col-lg-1 control-label" for="codigo">
		<g:message code="venda.codigo.label" default="Codigo" />
		<span class="required-indicator">*</span>
	</label>
	<div class="col-sm-4">
		<g:field name="codigo" class="form-control" type="number" value="${vendaInstance.codigo}" required=""/>

		<g:hasErrors bean="${vendaInstance}" field="codigo">
			<span class="glyphicon glyphicon-remove form-control-feedback"></span>
		</g:hasErrors>
	</div>
</div>

<div class="form-group ${hasErrors(bean: vendaInstance, field: 'pagamento', 'has-error has-feedback')} ">
	<label class="col-sm-3 col-md-2 col-lg-1 control-label" for="pagamento">
		<g:message code="venda.pagamento.label" default="Pagamento" />
		
	</label>
	<div class="col-sm-4">
		<g:textField name="pagamento" class="form-control" value="${vendaInstance?.pagamento}"/>

		<g:hasErrors bean="${vendaInstance}" field="pagamento">
			<span class="glyphicon glyphicon-remove form-control-feedback"></span>
		</g:hasErrors>
	</div>
</div>

 <div class="form-group ${hasErrors(bean: vendaInstance, field: 'itensProduto', 'has-error has-feedback')} ">
	<label class="col-sm-3 col-md-2 col-lg-1 control-label" for="itensProduto">
		<g:message code="venda.itensProduto.label" default="Itens Produto" />

	</label>
	 <button type="button" class="btn btn-default" data-toggle="modal" data-target="#modal-novo-produto">
		 Adicionar Produto
	 </button>
	 //ARRUMAR aqui!!
	<table class="table table-hover table-striped">
		<thead>
			<tr>
				<th>Produto</th>
				<th>Preço Unitário</th>
				<th>Quantidade</th>
				<th>Total</th>
			</tr>
		</thead>
	 <tbody>
	 <g:each in="${vendaInstance?.itensProduto}" status="i" var="itemInstance">
		 <tr>
			 <td>${fieldValue(bean: itemInstance.produto, field: "nome")}</td>
			 <td>R$ ${formatNumber(number: fieldValue(bean: itemInstance.produto, field: "preco"), format: '##0.00')}</td>
			 <td>${fieldValue(bean: itemInstance, field: "quantidade")}</td>
			 <td>R$ ${formatNumber(number: fieldValue(bean: itemInstance, field: "total"), format: '##0.00')}</td>
			 <td class="text-right">
				 <g:link controller="venda" action="removeProduct"
						 id="${vendaInstance.id}" params="[itemId: itemInstance.id]" class="btn btn-sm btn-danger" >
					 Remover
				 </g:link>
			 </td>
		 </tr>
	 </g:each>
	 </tbody>

 	</table>




		<g:hasErrors bean="${vendaInstance}" field="itensProduto">
			<span class="glyphicon glyphicon-remove form-control-feedback"></span>
		</g:hasErrors>
	</div>
</div>

