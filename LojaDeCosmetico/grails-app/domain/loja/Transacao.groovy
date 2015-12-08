package loja

abstract class Transacao {
	static	belongsTo = [cliente : Cliente]
	Date	dataTransacao = new Date()
	int		quantidadeTotal = 0
	double	valorTotal = 0
	
	static constraints = {
        cliente(nullable:true)
        dataTransacao()
        quantidadeTotal(editable: false)
        valorTotal(editable: false)
    }
    
    private void solicitarCompra(){
        
    }
    
    void cancelar(){
        
    }
}