package loja

class Venda extends Transacao{
	enum Status {
		A_PAGAR, PAGO, CANCELADO
	}
    int codigo;
	static hasMany = [itensProduto: ItemVenda]
	List<ItemVenda> itensProduto = new ArrayList<ItemVenda>()
    
	int quantidadeTotal = 0
	double valorTotal = 0
	String Pagamento
	
	//Date dataVenda;
    //static hasMany = [produto: Produto]
    //String status;
    //Double precoTotal;

    static constraints = {
        codigo unique:true, blank:false;
        valorTotal(min:0d)
		pagamento(nullable: true)
    }
	
	boolean isAPagar(){
		if(status == Status.A_PAGAR){
			return true
		}
	}
	
	boolean isPago(){
		if(status == Status.PAGO){
			return true
		}
	}
	
	boolean isCancelad0(){
		if(status == Status.CANCELADO){
			return true
		}
	}
	
	String getStatusStr(){
		if (status == Status.A_PAGAR){
            return "A Pagar"
        } else if (status == Status.PAGO){
            return "Pago"
        } else {
            return "Cancelado"
        }
	}
	
	void setAPagar(){
        status = Status.A_PAGAR
    }
    
    void setPago(){
        status = Status.PAGO
    }
    
    void setCancelado(){
        status = Status.CANCELADO
    }
	
	boolean addItemProduto(Produto produto, int quantidade){
        ItemVenda item = new ItemVenda(produto, this, quantidade)
        
        for(ItemVenda itemNaLista: this.itensProduto){
            if(itemNaLista.produto.codigo == produto.codigo){
                return false
            }
        }
        
        if(quantidade < 0){
            return false
        }

        if(quantidade > produto.quantidade_in_stock){
            return false
        }
        
        if(item.hasErrors()){
            return false
        }
        
        this.itensProduto.add(item)
        
        this.quantidadeTotal += item.quantidade
        this.valorTotal += item.preco_total
        
        this.quantidadeTotal += item.quantidade
        this.valorTotal += item.preco_total
        
        return true
    }
	
    boolean removeItemProduto(ItemVenda item){
        if(this.itensProduto.remove(item)){
            this.quantidadeTotal -= item.quantidade
            this.valorTotal -= item.preco_total
            return true
        }else{
            return false
        }
    }
	
    void updateSaldoOfProducts(){
        for(ItemVenda item : this.itensProduto){
            item.produto.sellFromStock(item.quantidade)
        }
    }
	
	boolean finalizarVenda(){
        this.setPago()        
        this.updateSaldoOfProducts()
        this.incrementServicos()
        return true
    }
	
}
