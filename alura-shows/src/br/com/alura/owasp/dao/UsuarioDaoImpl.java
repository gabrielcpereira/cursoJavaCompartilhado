package br.com.alura.owasp.dao;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.TypedQuery;

import org.mindrot.jbcrypt.BCrypt;
import org.springframework.stereotype.Repository;

import br.com.alura.owasp.model.Usuario;

@Repository
public class UsuarioDaoImpl implements UsuarioDao {

	@PersistenceContext
	private EntityManager manager;
		
	public void salva(Usuario usuario) {
	    this.transformaASenhaDoUsuarioEmHash(usuario);
	    manager.persist(usuario);
	}

	public Usuario procuraUsuario(Usuario usuario) {
		TypedQuery<Usuario> query = this.manager.createQuery("select u from Usuario u where u.email=:email", Usuario.class);
		query.setParameter("email", usuario.getEmail());
		Usuario usuarioRetornado = query.getResultList().stream().findFirst().orElse(null);	
						
		return 	(this.validarSenhaUsuario(usuario, usuarioRetornado) ? usuarioRetornado : null);
	}

	private Boolean validarSenhaUsuario(Usuario usuario, Usuario usuarioRetornado) {
		if (usuarioRetornado == null | !BCrypt.checkpw(usuario.getSenha(), usuarioRetornado.getSenha())) {
			return false;		
		}
		
		return true;
	}
	
	private void transformaASenhaDoUsuarioEmHash(Usuario usuario) {
		String salto = BCrypt.gensalt();
		String senhaHashed = BCrypt.hashpw(usuario.getSenha(), salto);
		usuario.setSenha(senhaHashed);
	}
}
