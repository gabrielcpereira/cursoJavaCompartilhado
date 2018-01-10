package br.com.casadocodigo.loja.models;

import java.util.List;

import javax.persistence.Column;
import javax.persistence.ElementCollection;
import javax.persistence.Embeddable;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

import org.hibernate.annotations.Columns;
import org.springframework.transaction.annotation.Transactional;

@Entity
@Transactional
public class Produto {
    
	@Id 
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(name="ID_PRODUTO")
	private int id;
	
	@Column(name="DC_TITULO")
	private String titulo;
	@Column(name="DC_DESCRICAO")
    private String descricao;
	@Column(name="NM_DESCRICAO")
    private int paginas;
    
    @ElementCollection
    @Column(name="ID_PRECO")
    private List<Preco> precos;
    
    public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getTitulo() {
		return titulo;
	}	
	public void setTitulo(String titulo) {
		this.titulo = titulo;
	}
	public String getDescricao() {
		return descricao;
	}
	public void setDescricao(String descricao) {
		this.descricao = descricao;
	}
	public int getPaginas() {
		return paginas;
	}
	public void setPaginas(int paginas) {
		this.paginas = paginas;
	}
	public List<Preco> getPrecos() {
		return precos;
	}
	public void setPrecos(List<Preco> precos) {
		this.precos = precos;
	}
	
	@Override
	public String toString() {
	    return "Produto [titulo=" + titulo + ", descricao=" + descricao + ", paginas=" + paginas + "]";
	}
	

}
