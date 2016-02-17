package loja

import grails.test.*

class TesteCaixaBrancaFechaPedidoSpec extends GrailsUnitTestCase {

    protected void setUp() {super.setUp()}

    protected void tearDown() {super.tearDown()}

    //testa quantidade < 0
    void testeCaminho1() {
        mockDomain Produto
        mockDomain Pedido
        mockDomain Fornecedor

        Fornecedor fornecedor = new Fornecedor(nome: "Fornecedor1", empresa: "Empresa1", cnpj: "68.767.527/0001-80")
        Produto produto = new Produto(nome: "Produto1", dataFabricacao: new Date(), dataVencimento: new Date().plus(7))
        Pedido pedido = new Pedido(fornecedor: fornecedor)
        int quantidade = -1
        float valor = 10.49

        assertFalse pedido.fechaPedido(produto, valor, quantidade)
    }

    //testa valor < 0
    void testeCaminh2() {
        mockDomain Produto
        mockDomain Pedido
        mockDomain Fornecedor

        Fornecedor fornecedor = new Fornecedor(nome: "Fornecedor1", empresa: "Empresa1", cnpj: "68.767.527/0001-80")
        Produto produto = new Produto(nome: "Produto1", dataFabricacao: new Date(), dataVencimento: new Date().plus(7))
        Pedido pedido = new Pedido(fornecedor: fornecedor)
        int quantidade = 10
        float valor = -10.49

        assertFalse pedido.fechaPedido(produto, valor, quantidade)
    }

    //testa produto tem erros
    void testeCaminho3() {
        mockDomain Produto
        mockDomain Pedido
        mockDomain Fornecedor

        Fornecedor fornecedor = new Fornecedor(nome: "Fornecedor1", empresa: "Empresa1", cnpj: "68.767.527/0001-80")
        Produto produto = new Produto(nome: "Produto1", quantidade: -5, dataFabricacao: new Date(), dataVencimento: new Date().plus(7))
        Pedido pedido = new Pedido(fornecedor: fornecedor)
        int quantidade = 10
        float valor = 10.49

        assertFalse pedido.fechaPedido(produto, valor, quantidade)
    }

    //testa tudo certo
    void testeCaminho4() {
        mockDomain Produto
        mockDomain Pedido
        mockDomain Fornecedor

        Fornecedor fornecedor = new Fornecedor(nome: "Fornecedor1", empresa: "Empresa1", cnpj: "68.767.527/0001-80")
        Produto produto = new Produto(nome: "Produto1", dataFabricacao: new Date(), dataVencimento: new Date().plus(7))
        Pedido pedido = new Pedido(fornecedor: fornecedor)
        int quantidade = 10
        float valor = 10.49

        assertTrue pedido.fechaPedido(produto, valor, quantidade)
    }
}


