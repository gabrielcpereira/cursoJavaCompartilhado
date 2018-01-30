package br.com.alura.listavip.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import br.com.alura.listavip.model.Convidado;
import br.com.alura.listavip.repository.ConvidadoRepository;

@Service
public class ConvidadoService {

	@Autowired
	private ConvidadoRepository repository;
	
	public List<Convidado> buscarConvidadoIniciandoPorNome(String nomeBusca) {
		return repository.findByNomeStartingWith(nomeBusca);
	}
	
	public List<Convidado> buscarTodosConvidados() {
		return repository.findAll();
	}
	
	public void salvar(Convidado novoConvidado) {
		repository.save(novoConvidado);
	}
	
	public void excluir(Long id) {
		repository.delete(id);
	}
}
