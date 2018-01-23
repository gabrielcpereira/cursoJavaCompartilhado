package br.com.casadocodigo.loja.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.context.WebApplicationContext;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import br.com.casadocodigo.loja.daos.ProdutoDAO;
import br.com.casadocodigo.loja.models.CarrinhoCompras;
import br.com.casadocodigo.loja.models.CarrinhoItem;
import br.com.casadocodigo.loja.models.Produto;
import br.com.casadocodigo.loja.models.TipoPreco;

@Controller
@RequestMapping("/carrinho")
@Scope(value=WebApplicationContext.SCOPE_REQUEST)
public class CarrinhoComprasController {
	@Autowired
	private ProdutoDAO produtoDao;
	
    @Autowired
    private CarrinhoCompras carrinho;
	
    /***** METODOS PUBLICOS *****/
	@RequestMapping("/add")
	public ModelAndView add(Integer idProduto, TipoPreco tipo, RedirectAttributes redirectAttributes) {
		ModelAndView mv;

		if (tipo == null) {
			mv = new ModelAndView("redirect:/produtos/detalhe/" + idProduto);
			redirectAttributes.addFlashAttribute("mensagemValidacaoTipo", "Selecione um tipo de preço válido !");

			return mv;
		}

		mv = new ModelAndView("redirect:/carrinho");
		CarrinhoItem carrinhoItem = criaItem(idProduto, tipo);
		carrinho.add(carrinhoItem);

		return mv;
	}
	@RequestMapping(method=RequestMethod.GET)
	public ModelAndView itens(){

//	        if(true) throw new RuntimeException("Excessão Genérica Acontecendo!!!!");

	        return new ModelAndView("/carrinho/itens");
	}
	@RequestMapping(value = "/remover", method = RequestMethod.POST)
	public ModelAndView remover(Integer idProduto, TipoPreco tipo, RedirectAttributes redirectAttributes) {		
		carrinho.remover(idProduto, tipo);
		redirectAttributes.addFlashAttribute("messagem", "Produto excluído com sucesso!");
		
		return new ModelAndView("redirect:/carrinho");
	}
	
	/***** METODOS PRIVADOS *****/	
	private CarrinhoItem criaItem(Integer idProduto, TipoPreco tipo){
	    Produto produto = produtoDao.find(idProduto);
	    CarrinhoItem carrinhoItem = new CarrinhoItem(produto, tipo);
	    return carrinhoItem;
	}	
}
