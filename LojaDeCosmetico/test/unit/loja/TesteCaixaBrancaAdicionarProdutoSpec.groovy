package loja

import grails.test.*

class TesteCaixaBrancaAdicionarProdutoSpec extends GrailsUnitTestCase{

    protected void setUp() {super.setUp()}

    protected void tearDown() {super.tearDown()}

    //Quantidade negativa
    void testeCaminho1(){
        mockDomain Venda
        mockDomain Produto
        mockDomain ItemVendaProduto
        Venda venda = new Venda(dataTransacao: new Date())
        Produto produto = new Produto(codigo : 10, nome: 'Esmalte Azul', preco : 2.99, quantidade: 2, dataFabricacao : new Date(2016, 01, 01), dataVencimento: new Date(2017, 01, 01))
        int quantidade = -1
        assertFalse venda.addItemProduto(produto,quantidade)
    }

    //Produto com erro, ex: cod negativo
    void testeCaminho2(){
        mockDomain Venda
        mockDomain Produto
        mockDomain ItemVendaProduto
        Venda venda = new Venda(dataTransacao: new Date())
        Produto produto = new Produto(codigo : -10, nome: 'Esmalte Azul', preco : 2.99, quantidade: 2, dataFabricacao : new Date(2016, 01, 01), dataVencimento: new Date(2017, 01, 01))
        int quantidade = -1

        assertFalse venda.addItemProduto(produto,quantidade)
    }

   //Tudo OK
    void testeCaminho3(){
        mockDomain Venda
        mockDomain Produto
        mockDomain ItemVendaProduto
        Venda venda = new Venda(dataTransacao: new Date())
        Produto produto = new Produto(codigo : 10, nome: 'Esmalte Azul', preco : 2.99, quantidade: 2, dataFabricacao : new Date(2016, 01, 01), dataVencimento: new Date(2017, 01, 01))
        int quantidade = 1

        assertTrue venda.addItemProduto(produto,quantidade)
    }

}
