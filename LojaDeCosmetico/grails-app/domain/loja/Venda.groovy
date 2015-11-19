package loja

class Venda {

    int codVenda;
    Date dataVenda;
    Cliente cliente;
    //static hasOne = [cliente: Cliente];
    //static hasOne = [pagamento: Pagamento];
    //static hasMany = [produto: Produto]
    String status;
    Double precoTotal;

    static constraints = {
        codVenda();
        //listaProduto();
        precoTotal();
        cliente();
        status();
        dataVenda();
    }
}
