package br.com.casadocodigo.loja.controllers;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import br.com.casadocodigo.loja.daos.ProdutoDAO;
import br.com.casadocodigo.loja.infra.FileSaver;
import br.com.casadocodigo.loja.models.Produto;
import br.com.casadocodigo.loja.models.TipoPreco;
import br.com.casadocodigo.loja.validation.ProdutoValidation;

@Controller
@RequestMapping("/produtos")
public class ProdutosController {

    @Autowired
    private FileSaver fileSaver;
    
	@Autowired
	private ProdutoDAO produtoDao;
	   
    @RequestMapping("/form")
    public ModelAndView form(Produto produto){
    	ModelAndView modelAndView = new ModelAndView("produtos/form");
        modelAndView.addObject("tiposPreco", TipoPreco.values());
    	
    	return modelAndView;
    }

    @RequestMapping(method=RequestMethod.POST)
    public ModelAndView gravar(MultipartFile sumario, @Valid Produto produto, BindingResult result,  RedirectAttributes redirectAttributes){
        if (result.hasErrors()) {
            return form(produto);         
        }

        String path = fileSaver.write("arquivos-sumario", sumario);
        produto.setSumarioPath(path);
    	
    	produtoDao.gravar(produto);
    	redirectAttributes.addFlashAttribute("sucesso", "Produto cadastrado com sucesso!");
    	
        return new ModelAndView("redirect:produtos");
    }
    
    @RequestMapping(method=RequestMethod.GET)
    public ModelAndView listaProdutos() { 	
    	ModelAndView modelAndView = new ModelAndView("produtos/lista");
    	modelAndView.addObject("produtos", produtoDao.listar());
    	
    	return modelAndView;
    }
    
    @RequestMapping(value="detalhe/{id}", method=RequestMethod.GET)
    public ModelAndView detalhesProduto(@PathVariable("id") int id) {    	
    	Produto produto = produtoDao.find(id);
    	
    	ModelAndView mv = new ModelAndView("produtos/detalhe");
    	mv.addObject("produto", produto);
    	mv.addObject("tiposPreco", TipoPreco.values());
		return mv;
    }
    
    @org.springframework.web.bind.annotation.InitBinder
    public void InitBinder(WebDataBinder binder) {
            binder.addValidators(new ProdutoValidation());
    }
   
}
