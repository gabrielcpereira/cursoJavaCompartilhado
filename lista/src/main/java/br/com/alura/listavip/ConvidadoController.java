package br.com.alura.listavip;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import br.com.alura.listavip.model.Convidado;
import br.com.alura.listavip.repository.ConvidadoRepository;

@Controller
public class ConvidadoController {
		
	@Autowired
	private ConvidadoRepository repository;
		
	@Autowired
	private HttpServletRequest request;
	
	private final String LISTA_CONVIDADOS = "listaconvidados";
	private final String EXCLUIR_CONVIDADO = "excluirconvidado";
	private final String SALVAR = "salvar";
	
	@RequestMapping("/")
	public String index() {
		return "index";
	}
	
	@RequestMapping(value = LISTA_CONVIDADOS, method = RequestMethod.GET)
	public String listaConvidados(Model model) {
		Iterable<Convidado> convidados;
		
		String nomeBusca = request.getParameter("nomeBusca");
		if (nomeBusca != null & nomeBusca != "") {
			convidados = repository.findByNomeStartingWith(nomeBusca);
			model.addAttribute("nomeBusca", nomeBusca);
		}else {
			convidados = repository.findAll();
		}
		
		model.addAttribute("convidados", convidados);
		
		return LISTA_CONVIDADOS;
	}
	
	@RequestMapping(value = SALVAR, method = RequestMethod.POST)
	public ModelAndView salvar(@RequestParam(name="nome") String nome, @RequestParam(name="email") String email, @RequestParam(name="telefone") String telefone, 
			Model model) {		
		Convidado novoConvidado = new Convidado(nome, email, telefone);
		repository.save(novoConvidado);
		
		return new ModelAndView("redirect:/" + LISTA_CONVIDADOS);
	}
	
	@RequestMapping(value = EXCLUIR_CONVIDADO, method = RequestMethod.POST)
	public ModelAndView excluirConvidado(@RequestParam(name="id") long id) {		
		repository.delete(id);
		
		return new ModelAndView("redirect:/" + LISTA_CONVIDADOS);
	}

}
