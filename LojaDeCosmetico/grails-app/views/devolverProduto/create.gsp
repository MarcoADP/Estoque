<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="main">
        <g:set var="entityName" value="${message(code: 'venda.label', default: 'Venda')}" />
        <title><g:message code="default.create.label" args="[entityName]" /></title>
    </head>
    <body>

        <div class="container-fluid">
            <div class="row">

                <section class="content col-xs-12 col-sm-9 col-md-9 col-lg-9">
                    <div id="create-venda" class="scaffold-create" role="main">
                        <h1><g:message code="default.create.label" args="[entityName]" /></h1>
                        <g:if test="${flash.message}">
                            <div class="message" role="status">${flash.message}</div>
                        </g:if>
                        <g:hasErrors bean="${vendaInstance}">
                            <ul class="errors" role="alert">
                                <g:eachError bean="${vendaInstance}" var="error">
                                    <li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
                                    </g:eachError>
                                    </ul>
                                </g:hasErrors>
                                <g:form url="[resource:vendaInstance, action:'save']"
                                    >
                                    <fieldset class="form">
                                    <g:render template="form"/>
                                    </fieldset>
                                    <fieldset class="buttons">
                                        <g:submitButton name="create" class="btn btn-lg btn-primary" 
                                        value="${message(code: 'default.button.create.label', default: 'Create')}"/>
                                        <g:link controller="index"  resource="${vendaInstance}" 
                                             class="btn btn-lg btn-danger">
                                             Cancelar
                                        </g:link>
                                    </fieldset>
                                </g:form>
                                </div>
                            </section>
                        </div>
                    </div>

            </body>
        </html>
