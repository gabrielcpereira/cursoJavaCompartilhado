package br.com.alura.listavip.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.portlet.ModelAndView;

import br.com.alura.listavip.models.Convidado;
import br.com.alura.listavip.repository.ConvidadoRepository;

@Controller
public class ConvidadoController {

	@Autowired
	ConvidadoRepository repository;
	
	@RequestMapping("/")
	public String index() {
		return "index";
	}
	
	@RequestMapping(value="listaconvidado")
	public ModelAndView listaConvidado() {
		java.lang.Iterable<Convidado> convidados = repository.findAll();
		
		ModelAndView mv = new ModelAndView("listaconvidado");
		mv.addObject("convidados", convidados);
		
		return mv;
	}
}
