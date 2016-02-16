<!-- Modal dialog -->
<div id="ConfirmModal" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="ConfirmModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                <h3 id="ConfirmModalLabel"><g:message code="default.button.finalizar.confirm.title" default="Efetuar Pagamento"/></h3>
            </div>
            <div class="modal-body">
                <p><g:message code="default.button.finalizar.confirm.message" args="[entityName]" default="Do you really want to update this item?"/></p>
            </div>
            <div class="modal-footer">
                <g:form>
                    <button class="btn btn-default" data-dismiss="modal" aria-hidden="true"><g:message code="default.boolean.false" default="Não"/></button>
                    <g:hiddenField name="id" value="${item ? item.id : params.id}" />
                    <g:hiddenField name="_method" value="PUT" />
                    <span class="button"><g:actionSubmit class="btn btn-primary" action="finalizar" value="${message(code: 'default.boolean.true', default: 'Sim')}"/></span>
                </g:form>
            </div>
        </div>
    </div>
</div>