package br.com.casadocodigo.loja.models;

import java.math.BigDecimal;
import java.util.Collection;
import java.util.LinkedHashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.context.annotation.ScopedProxyMode;
import org.springframework.stereotype.Component;
import org.springframework.web.context.WebApplicationContext;

import br.com.casadocodigo.loja.daos.ProdutoDAO;

@Component
@Scope(value = WebApplicationContext.SCOPE_SESSION, proxyMode = ScopedProxyMode.TARGET_CLASS)
public class CarrinhoCompras {
	// ATRIBUTOS
	private Map<CarrinhoItem, Integer> itens;
	private int quantidadeItens;
	@Autowired
	private ProdutoDAO produtoDAO;
	
	// CONSTRUTOR
	public CarrinhoCompras() {
		itens = new LinkedHashMap<CarrinhoItem, Integer>();
	}
	
	// PUBLIC METHODS
    public void add(CarrinhoItem item){
        itens.put(item, getQuantidade(item) + 1);
    }
    public void remover(Integer idProduto, TipoPreco tipo) {
    	Produto produto = produtoDAO.find(idProduto);
		if (produto == null)return;
		
		getItens().remove(new CarrinhoItem(produto, tipo));    	
    }
    public int getQuantidade(){
        return itens.values().stream().reduce(0, (proximo, acumulador) -> (proximo + acumulador));
    }
    public Collection<CarrinhoItem> getQuantidades(){
    	return itens.keySet();    
    }
	public BigDecimal getTotal(CarrinhoItem item){
	    return item.getTotal(getQuantidade(item));
	}
	public BigDecimal getTotal(){
	    BigDecimal total = BigDecimal.ZERO;
	    for (CarrinhoItem item : itens.keySet()) {
	        total = total.add(getTotal(item));
	    }
	    return total;
	}
	public int getQuantidade(CarrinhoItem item) {
        if(!itens.containsKey(item)){
            itens.put(item, 0);
        }
        return itens.get(item);
    }
	public Collection<CarrinhoItem> getItens() {
		Collection<CarrinhoItem> carrinho = itens.keySet(); 
		this.quantidadeItens = carrinho.size();
		
	    return carrinho;
	}
	public int getQuantidadeItens() {
		return itens.keySet().size();
	}
	public void finalizarPagamento() {
		itens.values().clear();		
	}    
}
