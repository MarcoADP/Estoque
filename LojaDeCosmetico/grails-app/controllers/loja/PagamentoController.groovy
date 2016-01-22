package loja

import grails.plugin.springsecurity.annotation.Secured

import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Secured(['ROLE_FUNCIONARIO'])
@Transactional(readOnly = true)
class PagamentoController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: Pagamento.count(), 100)
        respond Pagamento.list(params), model: [pagamentoInstanceCount: Pagamento.count()]
    }

    def show(Pagamento pagamentoInstance) {
        respond pagamentoInstance
    }

    def create() {
        respond new Pagamento(params)
    }

    @Transactional
    def save(Pagamento pagamentoInstance) {
        if (pagamentoInstance == null) {
            notFound()
            return
        }

        if (pagamentoInstance.hasErrors()) {
            respond pagamentoInstance.errors, view: 'create'
            return
        }

        pagamentoInstance.save flush: true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'pagamento.label', default: 'Pagamento'), pagamentoInstance.id])
                redirect pagamentoInstance
            }
            '*' { respond pagamentoInstance, [status: CREATED] }
        }
    }

    def edit(Pagamento pagamentoInstance) {
        respond pagamentoInstance
    }

    @Transactional
    def update(Pagamento pagamentoInstance) {
        if (pagamentoInstance == null) {
            notFound()
            return
        }

        if (pagamentoInstance.hasErrors()) {
            respond pagamentoInstance.errors, view: 'edit'
            return
        }

        pagamentoInstance.save flush: true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'Pagamento.label', default: 'Pagamento'), pagamentoInstance.id])
                redirect pagamentoInstance
            }
            '*' { respond pagamentoInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(Pagamento pagamentoInstance) {

        if (pagamentoInstance == null) {
            notFound()
            return
        }

        pagamentoInstance.delete flush: true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'Pagamento.label', default: 'Pagamento'), pagamentoInstance.id])
                redirect action: "index", method: "GET"
            }
            '*' { render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'pagamento.label', default: 'Pagamento'), params.id])
                redirect action: "index", method: "GET"
            }
            '*' { render status: NOT_FOUND }
        }
    }
}
