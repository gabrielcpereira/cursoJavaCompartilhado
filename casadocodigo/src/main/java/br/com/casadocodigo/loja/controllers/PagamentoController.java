package br.com.casadocodigo.loja.controllers;

import java.util.concurrent.Callable;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.mail.MailSender;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.security.web.bind.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.context.WebApplicationContext;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import br.com.casadocodigo.loja.models.CarrinhoCompras;
import br.com.casadocodigo.loja.models.DadosPagamento;
import br.com.casadocodigo.loja.models.Usuario;

@Controller
@RequestMapping(value="/pagamento")
@Scope(value=WebApplicationContext.SCOPE_REQUEST)
public class PagamentoController {

	@Autowired
	private CarrinhoCompras carrinhoCompras;
	@Autowired
	RestTemplate restTemplate;
	@Autowired
	private MailSender sender;
	  
	@RequestMapping(value="finalizar", method=RequestMethod.POST)
	public Callable<ModelAndView> finalizar(@AuthenticationPrincipal Usuario usuario, RedirectAttributes redirectAttributes) {
		return () -> {

			ModelAndView mv = null;
			
			try {
				String url = "http://book-payment.herokuapp.com/payment";
				restTemplate.postForObject(url, new DadosPagamento(carrinhoCompras.getTotal()), String.class);				
				redirectAttributes.addFlashAttribute("mensagem", "Pagamento realizado com sucesso");
				carrinhoCompras.finalizarPagamento();
				
				mv = new ModelAndView("redirect:/carrinho");
				
				//envia email para o usuário
//				enviaEmailCompraProduto(usuario);
				
			} catch (Exception e) {
			    e.printStackTrace();		    
			    redirectAttributes.addFlashAttribute("mensagem", "Valor maior que o permitido!");
			    mv = new ModelAndView("redirect:/carrinho");
			}

			return mv;
		};
	}

	private void enviaEmailCompraProduto(Usuario usuario) {
	    SimpleMailMessage email = new SimpleMailMessage();
	    email.setSubject("Compra finalizada com sucesso");
	    email.setTo(usuario.getUsername());
	    email.setText("Compra aprovada com sucesso no valor de " + carrinhoCompras.getTotal());
	    email.setFrom("gab_rcpereira@yahoo.com.br");
	    
	    sender.send(email);
	}
}
