<%@ page import="loja.Venda" %>



<div class="row">
    <div class="form-group col-xs-6 col-sm-6 col-md-6 col-lg-4 ${hasErrors(bean: vendaInstance, field: 'pessoa', 'error')} ">
        <label for="pessoa">
            <g:message code="venda.pessoa.label" default="Pessoa" />

        </label>
        <g:select class="form-control" id="pessoa" name="pessoa.id" from="${loja.Cliente.list()}" optionKey="id" value="${vendaInstance?.pessoa?.id}" />

    </div>
</div>

<div class="row">
    <div class="form-group form-group-data col-xs-12 col-sm-12 col-md-12 col-lg-12 ${hasErrors(bean: vendaInstance, field: 'dataTransacao', 'error')} required">
        <label for="dataTransacao">
            <g:message code="venda.dataTransacao.label" default="Data Transacao" />
            <span class="required-indicator">*</span>
        </label><br/>
        <g:datePicker name="dataTransacao" precision="day"  value="${vendaInstance?.dataTransacao}"  />

    </div>
</div>




