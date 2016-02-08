<%@ page import="loja.Pagamento" %>

<div class="form-horizontal">
	<div class="form-group ${hasErrors(bean: pagamentoInstance, field: 'cliente', 'has-error has-feedback')} required">
		<label class="col-sm-3 col-md-2 col-lg-2 control-label" for="cliente">
			<g:message code="pagamento.cliente.label" default="Cliente" />
			<span class="required-indicator"></span>
		</label>
		<div class="col-sm-6">
			<p class="form-control-static" aria-labelledby="cliente-label"><g:fieldValue bean="${pagamentoInstance}" field="cliente"/></p>

			<g:hasErrors bean="${pagamentoInstance}" field="cliente">
				<span class="glyphicon glyphicon-remove form-control-feedback"></span>
			</g:hasErrors>
		</div>
	</div>
</div>
<g:hiddenField name="cliente" value="${pagamentoInstance?.cliente?.id}" />

<div class="form-group ${hasErrors(bean: pagamentoInstance, field: 'valorTotal', 'has-error has-feedback')} required">
	<label class="col-sm-3 col-md-2 col-lg-2 control-label" for="valorTotal">
		<g:message code="pagamento.valorTotal.label" default="Valor total" />
		<span class="required-indicator"></span>
	</label>
	<div class="col-sm-6">
		<p class="form-control-static" aria-labelledby="valorTotal-label">
			<g:formatNumber class="form-control" number="${pagamentoInstance.valorTotal}" type="currency" minFractionDigits="2" maxFractionDigits="2"/>
		</p>

		<g:hasErrors bean="${pagamentoInstance}" field="valorTotal">
			<span class="glyphicon glyphicon-remove form-control-feedback"></span>
		</g:hasErrors>
	</div>
</div>
<g:hiddenField name="valorTotal" value="${fieldValue(bean: pagamentoInstance, field: 'valorTotal')}" />

<g:hiddenField name="id_venda" value="${fieldValue(bean: pagamentoInstance, field: 'id_venda')}" />

<div class="form-group ${hasErrors(bean: pagamentoInstance, field: 'dateCreated', 'has-error has-feedback')} required">
	<label class="col-sm-3 col-md-2 col-lg-2 control-label" for="dateCreated">
		<g:message code="pagamento.dateCreated.label" default="Data Emissao" />
		<span class="required-indicator"></span>
	</label>
	<div class="col-sm-6">
		<p class="form-control-static" aria-labelledby="valorTotal-label">
			<g:formatDate format="dd/MM/yyyy" date="${new Date()}"/>
		</p>
		%{--<g:datePicker name="dataEmissao" precision="day"  value="${pagamentoInstance?.dataEmissao}"/>--}%

		<g:hasErrors bean="${pagamentoInstance}" field="dateCreated">
			<span class="glyphicon glyphicon-remove form-control-feedback"></span>
		</g:hasErrors>
	</div>
</div>

<g:hiddenField name="situacao" value="${fieldValue(bean: pagamentoInstance, field: 'situacao')}" />

<div class="form-group ${hasErrors(bean: pagamentoInstance, field: 'tipoPagamento', 'has-error has-feedback')} required">
	<label class="col-sm-3 col-md-2 col-lg-2 control-label" for="tipoPagamento">
		<g:message code="pagamento.tipoPagamento.label" default="Tipo Pagamento" />
		<span class="required-indicator">*</span>
	</label>
	<div class="col-sm-6">
		<g:select name="tipoPagamento" class="form-control" from="${pagamentoInstance.constraints.tipoPagamento.inList}" required="" value="${pagamentoInstance?.tipoPagamento}" valueMessagePrefix="pagamento.tipoPagamento"/>

		<g:hasErrors bean="${pagamentoInstance}" field="tipoPagamento">
			<span class="glyphicon glyphicon-remove form-control-feedback"></span>
		</g:hasErrors>
	</div>
</div>

<div class="form-group ${hasErrors(bean: pagamentoInstance, field: 'dataVencimento', 'has-error has-feedback')} required">
	<label class="col-sm-3 col-md-2 col-lg-2 control-label" for="dataVencimento">
		<g:message code="pagamento.dataVencimento.label" default="Data Vencimento" />
		<span class="required-indicator">*</span>
	</label>
	<div class="col-sm-6">
		<g:datePicker name="dataVencimento" precision="day" value="${pagamentoInstance?.dataVencimento}"  />

		<g:hasErrors bean="${pagamentoInstance}" field="dataVencimento">
			<span class="glyphicon glyphicon-remove form-control-feedback"></span>
		</g:hasErrors>
	</div>
</div>
