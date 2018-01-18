package br.com.casadocodigo.loja.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.cache.annotation.Cacheable;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.context.WebApplicationContext;
import org.springframework.web.servlet.ModelAndView;

import br.com.casadocodigo.loja.daos.ProdutoDAO;

@Controller
@Scope(value=WebApplicationContext.SCOPE_REQUEST)
@RequestMapping("/")
public class HomeController {
	@Autowired
	private ProdutoDAO produtoDAO;

	@RequestMapping(method=RequestMethod.GET)
    @Cacheable("produtosHome")
	public ModelAndView index() {		
		ModelAndView mv = new ModelAndView("home");
		mv.addObject("produtos", produtoDAO.listar());
		
		return mv;
	}
}
