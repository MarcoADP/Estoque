package loja

class Venda {

    int codigo;
    Date dataVenda;
    Cliente cliente;
    //static hasOne = [cliente: Cliente];
    //static hasOne = [pagamento: Pagamento];
    static hasMany = [produto: Produto]
    String status;
    Double precoTotal;

    static constraints = {
        codigo unique:true, blank:false;
        produto blank:false;
        precoTotal blank:false;
        cliente blank:false;
        status(inList: ["A pagar", "Pago"]);
        dataVenda max: new Date();
    }
}
