<%@ page import="loja.Cliente" %>



<div class="fieldcontain ${hasErrors(bean: clienteInstance, field: 'nome', 'error')} required">
    <label for="nome">
        <g:message code="cliente.nome.label" default="Nome"/>
        <span class="required-indicator">*</span>
    </label>
    <g:textField name="nome" required="" value="${clienteInstance?.nome}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: clienteInstance, field: 'endereco', 'error')} required">
    <label for="endereco">
        <g:message code="cliente.endereco.label" default="Endereco"/>
        <span class="required-indicator">*</span>
    </label>
    <g:textField name="endereco" required="" value="${clienteInstance?.endereco}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: clienteInstance, field: 'telefone', 'error')} required">
    <label for="telefone">
        <g:message code="cliente.telefone.label" default="Telefone"/>
        <span class="required-indicator">*</span>
    </label>
    <g:field name="telefone" type="number" value="${clienteInstance.telefone}" required=""/>

</div>

<div class="fieldcontain ${hasErrors(bean: clienteInstance, field: 'dataNascimento', 'error')} required">
    <label for="dataNascimento">
        <g:message code="cliente.dataNascimento.label" default="Data Nascimento"/>
        <span class="required-indicator">*</span>
    </label>
    <g:datePicker name="dataNascimento" precision="day" value="${clienteInstance?.dataNascimento}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: clienteInstance, field: 'idade', 'error')} required">
    <label for="idade">
        <g:message code="cliente.idade.label" default="Idade"/>
        <span class="required-indicator">*</span>
    </label>
    <g:field name="idade" type="number" value="${clienteInstance.idade}" required=""/>

</div>

<div class="fieldcontain ${hasErrors(bean: clienteInstance, field: 'dataCadastro', 'error')} required">
    <label for="dataCadastro">
        <g:message code="cliente.dataCadastro.label" default="Data Cadastro"/>
        <span class="required-indicator">*</span>
    </label>
    <g:datePicker name="dataCadastro" precision="day" value="${clienteInstance?.dataCadastro}"/>

</div>

