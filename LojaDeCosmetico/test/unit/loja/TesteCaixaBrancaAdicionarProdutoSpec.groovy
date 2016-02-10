package loja

import grails.test.GrailsUnitTestCase

class TesteCaixaBrancaAdicionarProdutoSpec extends GrailsUnitTestCase{

    protected void setUp() {super.setUp()}

    protected void tearDown() {super.tearDown()}

    void testeCaminho1(){
        mockDomain Venda
        mockDomain Produto
        mockDomain ItemVendaProduto
        Venda venda = new Venda(dataTransacao: new Date())
        Produto produto = new Produto(codigo : 10, nome: 'Esmalte Azul', preco : 2.99, quantidade: 2, dataFabricacao : new Date(2016, 01, 01), dataVencimento: new Date(2017, 01, 01))
        int quantidade = 4

        assertTrue venda.addItemProduto(produto,quantidade)


    }
}
