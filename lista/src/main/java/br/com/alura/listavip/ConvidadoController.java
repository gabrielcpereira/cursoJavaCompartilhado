package br.com.alura.listavip;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import br.com.alura.lista.email.envioEmailLista.EmailService;
import br.com.alura.lista.email.envioEmailLista.EnvioEmailListaApplication;
import br.com.alura.listavip.model.Convidado;
import br.com.alura.listavip.repository.ConvidadoRepository;
import br.com.alura.listavip.service.ConvidadoService;

@Controller
public class ConvidadoController {
	
	@Autowired	
	private ConvidadoService convidadoService;
	@Autowired
	private HttpServletRequest request;
	
	private final String indexAction = "index";
	private final String listaConvidadosAction = "listaconvidados";
	private final String excluirConvidadoAction = "excluirconvidado";
	private final String salvarAction = "salvar";
	
	@RequestMapping("/")
	public String index() {
		return indexAction;
	}
	
	@RequestMapping(value = listaConvidadosAction, method = RequestMethod.GET)
	public String listaConvidados(Model model) {
		Iterable<Convidado> convidados;		
		String nomeBusca = request.getParameter("nomeBusca");
		if (nomeBusca != null & nomeBusca != "") {
			convidados = convidadoService.buscarConvidadoIniciandoPorNome(nomeBusca);
			model.addAttribute("nomeBusca", nomeBusca);
		}else {
			convidados = convidadoService.buscarTodosConvidados();
		}
		
		model.addAttribute("convidados", convidados);		
		return listaConvidadosAction;
	}
	
	@RequestMapping(value = salvarAction, method = RequestMethod.POST)
	public ModelAndView salvar(@RequestParam(name="nome") String nome, @RequestParam(name="email") String email, @RequestParam(name="telefone") String telefone, 
			Model model) {		
		convidadoService.salvar(new Convidado(nome, email, telefone));		
		(new EmailService()).enviar(nome, email);
		
		return new ModelAndView("redirect:/" + listaConvidadosAction);
	}
	
	@RequestMapping(value = excluirConvidadoAction, method = RequestMethod.POST)
	public ModelAndView excluirConvidado(@RequestParam(name="id") long id) {		
		convidadoService.excluir(id);
		
		return new ModelAndView("redirect:/" + listaConvidadosAction);
	}

}
