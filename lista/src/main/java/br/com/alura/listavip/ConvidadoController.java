package br.com.alura.listavip;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.server.ServletServerHttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
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
	
	/*actions*/
	private final String LISTA_CONVIDADOS = "listaconvidados";
	private final String LISTA_CONVIDADOS_BUSCA = "listaconvidadosbusca";
	private final String SALVAR = "salvar";
	
	@RequestMapping("/")
	public String index() {
		return "index";
	}
	
	@RequestMapping(value = LISTA_CONVIDADOS_BUSCA, method = RequestMethod.GET)
	public String listaConvidadosBusca(@RequestParam(name="nomeBusca") String nomeBusca, Model model) {		
		Iterable<Convidado> convidados = repository.findByNome(nomeBusca);
		model.addAttribute("convidados", convidados);
		
		return LISTA_CONVIDADOS;
	}
	
	@RequestMapping(value = LISTA_CONVIDADOS, method = RequestMethod.GET)
	public String listaConvidados(Model model) {
		Iterable<Convidado> convidados = repository.findAll();
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

}
