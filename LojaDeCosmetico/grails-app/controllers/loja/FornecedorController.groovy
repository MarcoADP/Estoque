package loja

import grails.plugin.springsecurity.annotation.Secured

import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Secured(['ROLE_GERENTE'])
@Transactional(readOnly = true)
class FornecedorController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: Fornecedor.count(), 100)
        def results = Fornecedor.findAllByCanceladoNotEqual(true)
        respond results, model: [fornecedorInstanceCount: Fornecedor.count()]
    }

    def show(Fornecedor fornecedorInstance) {
        respond fornecedorInstance
    }

    def create() {
        respond new Fornecedor(params)
    }

    @Transactional
    def save(Fornecedor fornecedorInstance) {
        if (fornecedorInstance == null) {
            notFound()
            return
        }

        if (fornecedorInstance.hasErrors()) {
            respond fornecedorInstance.errors, view: 'create'
            return
        }

        fornecedorInstance.save flush: true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'fornecedor.label', default: 'Fornecedor'), fornecedorInstance.id])
                redirect fornecedorInstance
            }
            '*' { respond fornecedorInstance, [status: CREATED] }
        }
    }

    def edit(Fornecedor fornecedorInstance) {
        respond fornecedorInstance
    }

    @Transactional
    def update(Fornecedor fornecedorInstance) {
        if (fornecedorInstance == null) {
            notFound()
            return
        }

        if (fornecedorInstance.hasErrors()) {
            respond fornecedorInstance.errors, view: 'edit'
            return
        }

        fornecedorInstance.save flush: true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'Fornecedor.label', default: 'Fornecedor'), fornecedorInstance.id])
                redirect fornecedorInstance
            }
            '*' { respond fornecedorInstance, [status: OK] }
        }
    }

    @Transactional
    def cancel(Fornecedor fornecedorInstance) {

        if (fornecedorInstance == null) {
            notFound()
            return
        }


        fornecedorInstance.cancelado = true
        fornecedorInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'Fornecedor.label', default: 'Fornecedor'), fornecedorInstance.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    @Transactional
    def delete(Fornecedor fornecedorInstance) {

        if (fornecedorInstance == null) {
            notFound()
            return
        }

        fornecedorInstance.delete flush: true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'Fornecedor.label', default: 'Fornecedor'), fornecedorInstance.id])
                redirect action: "index", method: "GET"
            }
            '*' { render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'fornecedor.label', default: 'Fornecedor'), params.id])
                redirect action: "index", method: "GET"
            }
            '*' { render status: NOT_FOUND }
        }
    }
}
