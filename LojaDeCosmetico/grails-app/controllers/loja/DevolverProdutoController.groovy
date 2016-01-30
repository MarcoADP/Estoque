package loja

import grails.plugin.springsecurity.annotation.Secured

import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional
import loja.Produto
import loja.Cliente

@Secured(['ROLE_FUNCIONARIO'])
@Transactional(readOnly = true)
class DevolverProdutoController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)

        def results = Venda.list(params)
        if (params.dataTransacaoInicio != null){
            results = Venda.findAllByDataTransacaoBetween(params.dataTransacaoInicio, params.dataTransacaoFim)
        }

        if(results.size() == 0){
            request.message_info = message(code: 'default.search.notfound.message', default: 'Nada encontrado')
        }

        respond results, model:[vendaInstanceCount: Venda.count()]
    }

    def show(Venda vendaInstance) {
        respond vendaInstance
    }

    def create() {
        respond new Venda(params)
    }

    @Transactional
    def save(Venda vendaInstance) {
        if (vendaInstance == null) {
            notFound()
            return
        }

        if (vendaInstance.hasErrors()) {
            respond vendaInstance.errors, view:'create'
            return
        }

        def pessoa = Cliente.findById(params.pessoa.id)
        vendaInstance.pessoa = pessoa
        vendaInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'vendaInstance.label', default: 'Venda'), vendaInstance.id])
                redirect(action:"edit", id: vendaInstance.id)
            }
            '*' { respond vendaInstance, [status: CREATED] }
        }
    }

    def edit(Venda vendaInstance) {
        respond vendaInstance
    }

    @Transactional
    def update(Venda vendaInstance) {
        if (vendaInstance == null) {
            notFound()
            return
        }

        if (vendaInstance.hasErrors()) {
            respond vendaInstance.errors, view:'edit'
            return
        }

        def pessoa = Cliente.findById(params.pessoa.id)
        vendaInstance.pessoa = pessoa

        vendaInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'Venda.label', default: 'Venda'), vendaInstance.id])
                redirect vendaInstance
            }
            '*'{ respond vendaInstance, [status: OK] }
        }
    }

    @Transactional
    def addProduct(Venda vendaInstance){
        if (vendaInstance == null){
            notFound()
            return
        }

        Produto produto = Produto.get(params.produto.id)
        int quantidade = Integer.parseInt(params.quantidade)

        if(quantidade > produto.quantidade ){
            flash.message = message(code: 'compra.erro.item.semestoque')
        }else{
            if(!vendaInstance.addItemProduto(produto,quantidade)){
                flash.message = message(code: 'compra.erro.item')
            }
            vendaInstance.save flush:true
        }

        redirect(action:"edit", id: vendaInstance.id)
    }

    @Transactional
    def removeProduct(Venda vendaInstance){
        if (vendaInstance == null){
            notFound()
            return
        }

        ItemVendaProduto item = ItemVendaProduto.findById(params.itemId)
        vendaInstance.removeItemProduto(item)

        if(item){
            item.delete flush:true
        }

        vendaInstance.save flush:true

        redirect(action:"edit", id: vendaInstance.id)
    }


    @Transactional
    def delete(Venda vendaInstance) {

        if (vendaInstance == null) {
            notFound()
            return
        }

        vendaInstance.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'Venda.label', default: 'Venda'), vendaInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }


    @Transactional
    def finalizer(Venda vendaInstance) {
        if (vendaInstance == null) {
            notFound()
            return
        }
        vendaInstance.finalizarVenda()
        vendaInstance.save flush:true
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'Venda finalizada', args: [message(code: 'compra.label', default: 'compra'), vendaInstance.id])
                redirect vendaInstance
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    @Transactional
    def cancel(Venda vendaInstance) {

        if (vendaInstance == null) {
            notFound()
            return
        }

        vendaInstance.setCancelada()

        vendaInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'Venda cancelada', args: [message(code: 'compra.label', default: 'compra'), vendaInstance.id])
                redirect vendaInstance
            }
            '*'{ render status: NO_CONTENT }
        }
    }



    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'vendaInstance.label', default: 'Venda'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
