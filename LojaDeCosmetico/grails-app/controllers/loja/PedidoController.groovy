package loja

import grails.plugin.springsecurity.annotation.Secured

import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Secured(['ROLE_GERENTE'])
@Transactional(readOnly = true)
class PedidoController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: Pedido.count(), 100)
        def results = Pedido.findAllByCanceladoNotEqual(true)
        respond results, model:[pedidoInstanceCount: Pedido.count()]
    }

    def show(Pedido pedidoInstance) {
        respond pedidoInstance
    }

    def create() {
        respond new Pedido(params)
    }

    @Transactional
    def save(Pedido pedidoInstance) {
        if (pedidoInstance == null) {
            notFound()
            return
        }

        if (pedidoInstance.hasErrors()) {
            respond pedidoInstance.errors, view:'create'
            return
        }

        def produto = pedidoInstance.produto
        produto.setQuantidade(produto.quantidade+pedidoInstance.quantidade)
        produto.save flush:true
        pedidoInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'pedido.label', default: 'Pedido'), pedidoInstance.id])
                redirect pedidoInstance
            }
            '*' { respond pedidoInstance, [status: CREATED] }
        }
    }

    def edit(Pedido pedidoInstance) {
        respond pedidoInstance
    }

    @Transactional
    def update(Pedido pedidoInstance) {
        if (pedidoInstance == null) {
            notFound()
            return
        }

        if (pedidoInstance.hasErrors()) {
            respond pedidoInstance.errors, view:'edit'
            return
        }

        def produto = pedidoInstance.produto
        produto.setQuantidade(produto.quantidade+pedidoInstance.quantidade)
        produto.save flush:true
        pedidoInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'Pedido.label', default: 'Pedido'), pedidoInstance.id])
                redirect pedidoInstance
            }
            '*'{ respond pedidoInstance, [status: OK] }
        }
    }

    @Transactional
    def cancel(Pedido pedidoInstance) {

        if (pedidoInstance == null) {
            notFound()
            return
        }

        pedidoInstance.cancelado = true
        pedidoInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'Pedido.label', default: 'Pedido'), pedidoInstance.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    @Transactional
    def delete(Pedido pedidoInstance) {

        if (pedidoInstance == null) {
            notFound()
            return
        }

        pedidoInstance.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'Pedido.label', default: 'Pedido'), pedidoInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'pedido.label', default: 'Pedido'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
