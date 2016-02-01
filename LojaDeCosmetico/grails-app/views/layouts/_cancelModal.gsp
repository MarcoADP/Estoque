<!-- Modal dialog -->
<div id="CancelModal" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="CancelModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                <h3 id="CancelModalLabel"><g:message code="default.button.cancel.confirm.title" default="Cancelar Item"/></h3>
            </div>
            <div class="modal-body">
                <p><g:message code="default.button.cancel.confirm.message" args="[entityName]" default="Do you really want to cancel this item?"/></p>
            </div>
            <div class="modal-footer">
                <g:form>
                    <button class="btn btn-default" data-dismiss="modal" aria-hidden="true"><g:message code="default.boolean.false" default="Nao"/></button>
                    <g:hiddenField name="id" value="${item ? item.id : params.id}" />
                    <g:hiddenField name="_method" value="DELETE" />
                    <span class="button"><g:actionSubmit class="btn btn-danger" action="cancel" value="${message(code: 'default.boolean.true', default: 'Sim')}"/></span>
                </g:form>
            </div>
        </div>
    </div>
</div>