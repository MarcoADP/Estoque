package loja

import grails.test.*
import spock.lang.Specification

/**
 * See the API for {@link grails.test.mixin.domain.DomainClassUnitTestMixin} for usage instructions
 */
class VendaSpec extends GrailsUnitTestCase {


    protected void setUp() {super.setUp()}

    protected void tearDown() {super.tearDown()}

    void testConstraints() {
        mockDomain Venda
        def venda_fail = new Venda(dataTransacao: new Date(), quantidadeTotal: -1, valorTotal: -4)
        assertFalse venda_fail.validate()
        def venda_ok = new Venda(dataTransacao: new Date(), quantidadeTotal: 1, valorTotal: 0)
        assertTrue venda_ok.validate()
    }

    void testAddItemProduto(){
        mockDomain Venda
        mockDomain Produto
        mockDomain ItemVendaProduto

        Produto produto = new Produto(codigo : 10, nome: 'Esmalte Azul', preco : 2.99, quantidade: 2, dataFabricacao : new Date(2016, 01, 01), dataVencimento: new Date(2017, 01, 01))
        int quantidade_ok = 2;
        Venda venda_ok = new Venda(dataTransacao: new Date())
        assertTrue venda_ok.addItemProduto(produto,quantidade_ok)
        assertFalse venda_ok.addItemProduto(produto,quantidade_ok)

        Venda venda_fail = new Venda(dataTransacao: new Date())
        int quantidade_fail = -2;
        assertFalse venda_fail.addItemProduto(produto,quantidade_fail)
    }

    void testRemoveItemProduto(){
        mockDomain Venda
        mockDomain Produto
        mockDomain ItemVendaProduto

        Produto produto = new Produto(codigo : 10, nome: 'Esmalte Azul', preco : 2.99, quantidade: 2, dataFabricacao : new Date(2016, 01, 01), dataVencimento: new Date(2017, 01, 01))
        int quantidade = 2;
        Venda venda = new Venda(dataTransacao: new Date())

        venda.addItemProduto(produto,quantidade)
        ItemVendaProduto item = venda.itensProduto.get(0)

        assertTrue venda.removeItemProduto(item)
        assertFalse venda.removeItemProduto(item)
    }
}
