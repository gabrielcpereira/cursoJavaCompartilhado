package br.com.casadocodigo.loja.models;

import java.util.LinkedHashMap;
import java.util.Map;

public class CarrinhoCompras {
	private Map<CarrinhoItem, Integer> itens = new LinkedHashMap<CarrinhoItem, Integer>();
	
	// PUBLIC METHODS
    public void add(CarrinhoItem item){
        itens.put(item, getQuantidade(item) + 1);
    }
    public int getQuantidade(){
        return itens.values().stream().reduce(0, (proximo, acumulador) -> (proximo + acumulador));
    }
    
    // PRIVATES METHODS
    private int getQuantidade(CarrinhoItem item) {
        if(!itens.containsKey(item)){
            itens.put(item, 0);
        }
        return itens.get(item);
    }
}
