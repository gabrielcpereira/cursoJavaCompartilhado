package br.com.alura.listavip.config.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class ListaVipController {

	@RequestMapping("/")
	public String index() {
		return "index";
	}
}
