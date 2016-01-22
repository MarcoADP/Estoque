<%@ page import="loja.Pagamento" %>

<div class="form-group ${hasErrors(bean: pagamentoInstance, field: 'situacao', 'has-error has-feedback')} required">
	<label class="col-sm-3 col-md-2 col-lg-1 control-label" for="situacao">
		<g:message code="pagamento.situacao.label" default="Situacao" />
		<span class="required-indicator">*</span>
	</label>
	<div class="col-sm-4">
		<g:select name="situacao" class="form-control" id="disabledSelect" from="${pagamentoInstance.constraints.situacao.inList}" required="" value="${pagamentoInstance?.situacao}" valueMessagePrefix="pagamento.situacao"/>

		<g:hasErrors bean="${pagamentoInstance}" field="situacao">
			<span class="glyphicon glyphicon-remove form-control-feedback"></span>
		</g:hasErrors>
	</div>
</div>

<div class="form-group ${hasErrors(bean: pagamentoInstance, field: 'tipoPagamento', 'has-error has-feedback')} required">
	<label class="col-sm-3 col-md-2 col-lg-1 control-label" for="tipoPagamento">
		<g:message code="pagamento.tipoPagamento.label" default="Tipo Pagamento" />
		<span class="required-indicator">*</span>
	</label>
	<div class="col-sm-4">
		<g:select name="tipoPagamento" class="form-control" from="${pagamentoInstance.constraints.tipoPagamento.inList}" required="" value="${pagamentoInstance?.tipoPagamento}" valueMessagePrefix="pagamento.tipoPagamento"/>

		<g:hasErrors bean="${pagamentoInstance}" field="tipoPagamento">
			<span class="glyphicon glyphicon-remove form-control-feedback"></span>
		</g:hasErrors>
	</div>
</div>

<div class="form-group ${hasErrors(bean: pagamentoInstance, field: 'cliente', 'has-error has-feedback')} required">
	<label class="col-sm-3 col-md-2 col-lg-1 control-label" for="cliente">
		<g:message code="pagamento.cliente.label" default="Cliente" />
		<span class="required-indicator">*</span>
	</label>
	<div class="col-sm-4">
		<g:field name="cliente" class="form-control" value="${fieldValue(bean: pagamentoInstance, field: 'cliente')}" required="" readonly="true"/>
		%{--<g:select id="cliente" name="cliente.id" class="form-control" from="${loja.Cliente.list()}" optionKey="id" required="" value="${pagamentoInstance?.cliente?.id}" disabled="true"/>--}%

		<g:hasErrors bean="${pagamentoInstance}" field="cliente">
			<span class="glyphicon glyphicon-remove form-control-feedback"></span>
		</g:hasErrors>
	</div>
</div>

<div class="form-group ${hasErrors(bean: pagamentoInstance, field: 'dataEmissao', 'has-error has-feedback')} required">
	<label class="col-sm-3 col-md-2 col-lg-1 control-label" for="dataEmissao">
		<g:message code="pagamento.dataEmissao.label" default="Data Emissao" />
		<span class="required-indicator">*</span>
	</label>
	<div class="col-sm-4">
		<g:datePicker name="dataEmissao" precision="day"  value="${pagamentoInstance?.dataEmissao}"/>

		<g:hasErrors bean="${pagamentoInstance}" field="dataEmissao">
			<span class="glyphicon glyphicon-remove form-control-feedback"></span>
		</g:hasErrors>
	</div>
</div>

<div class="form-group ${hasErrors(bean: pagamentoInstance, field: 'dataVencimento', 'has-error has-feedback')} required">
	<label class="col-sm-3 col-md-2 col-lg-1 control-label" for="dataVencimento">
		<g:message code="pagamento.dataVencimento.label" default="Data Vencimento" />
		<span class="required-indicator">*</span>
	</label>
	<div class="col-sm-4">
		<g:datePicker name="dataVencimento" precision="day"  value="${pagamentoInstance?.dataVencimento}"  />

		<g:hasErrors bean="${pagamentoInstance}" field="dataVencimento">
			<span class="glyphicon glyphicon-remove form-control-feedback"></span>
		</g:hasErrors>
	</div>
</div>

<div class="form-group ${hasErrors(bean: pagamentoInstance, field: 'preco', 'has-error has-feedback')} required">
	<label class="col-sm-3 col-md-2 col-lg-1 control-label" for="preco">
		<g:message code="pagamento.preco.label" default="Preco" />
		<span class="required-indicator">*</span>
	</label>
	<div class="col-sm-4">
		<g:field name="preco" class="form-control" value="${fieldValue(bean: pagamentoInstance, field: 'preco')}" required="" readonly="true"/>

		<g:hasErrors bean="${pagamentoInstance}" field="preco">
			<span class="glyphicon glyphicon-remove form-control-feedback"></span>
		</g:hasErrors>
	</div>
</div>

<script type="text/javascript">
		$("#dataEmissao_day").attr('disabled','true')
		$("#dataEmissao_month").attr('disabled','true')
		$("#dataEmissao_year").attr('disabled','true')
</script>

adicionar mask preco

