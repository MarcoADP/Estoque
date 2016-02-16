package loja


import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class ItemCompraController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: ItemCompra.count(), 100)
        respond ItemCompra.list(params), model: [itemCompraInstanceCount: ItemCompra.count()]
    }

    def show(ItemCompra itemCompraInstance) {
        respond itemCompraInstance
    }

    def create() {
        respond new ItemCompra(params)
    }

    @Transactional
    def save(ItemCompra itemCompraInstance) {
        if (itemCompraInstance == null) {
            notFound()
            return
        }

        if (itemCompraInstance.hasErrors()) {
            respond itemCompraInstance.errors, view: 'create'
            return
        }

        itemCompraInstance.save flush: true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'itemCompra.label', default: 'ItemCompra'), itemCompraInstance.id])
                redirect itemCompraInstance
            }
            '*' { respond itemCompraInstance, [status: CREATED] }
        }
    }

    def edit(ItemCompra itemCompraInstance) {
        respond itemCompraInstance
    }

    @Transactional
    def update(ItemCompra itemCompraInstance) {
        if (itemCompraInstance == null) {
            notFound()
            return
        }

        if (itemCompraInstance.hasErrors()) {
            respond itemCompraInstance.errors, view: 'edit'
            return
        }

        itemCompraInstance.save flush: true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'ItemCompra.label', default: 'ItemCompra'), itemCompraInstance.id])
                redirect itemCompraInstance
            }
            '*' { respond itemCompraInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(ItemCompra itemCompraInstance) {

        if (itemCompraInstance == null) {
            notFound()
            return
        }

        itemCompraInstance.delete flush: true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'ItemCompra.label', default: 'ItemCompra'), itemCompraInstance.id])
                redirect action: "index", method: "GET"
            }
            '*' { render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'itemCompra.label', default: 'ItemCompra'), params.id])
                redirect action: "index", method: "GET"
            }
            '*' { render status: NOT_FOUND }
        }
    }
}
