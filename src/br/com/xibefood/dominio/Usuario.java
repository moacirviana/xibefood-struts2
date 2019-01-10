package br.com.xibefood.dominio;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

import org.hibernate.annotations.GenericGenerator;

@Entity
@Table(name="usuario")
public class Usuario implements Serializable {
	private static final long serialVersionUID = 2950413527005250050L;

	@Id
	@GeneratedValue(strategy=GenerationType.AUTO, generator="native")
	@GenericGenerator(name = "native", strategy = "native")
	private Integer id;
	
	
	@Column(nullable=false)
	private String nome;
	
	@Column(nullable=false)
	private String email;	
	
	@Column(nullable=false)
	private String senha;
	
	@Column(nullable=false)
	private Integer admin;
	
	public Usuario() {
	}
	
	public Usuario(Integer codigo, String name){
		this.id = codigo;
		this.nome = name;
	}
	
	public Usuario(Integer codigo, String name, String senha, String email){
		this.id = codigo;
		this.nome = name;
		this.senha = senha;
		this.email = email;
	}
	
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getNome() {
		return nome;
	}
	public void setNome(String name) {
		this.nome = name;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getSenha() {
		return senha;
	}
	public void setSenha(String senha) {
		this.senha = senha;
	}

	public Integer getAdmin() {
		return admin;
	}

	public void setAdmin(Integer admin) {
		this.admin = admin;
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		Integer result = 1;
		result = prime * result + id;
		return result;
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		Usuario other = (Usuario) obj;
		if (id != other.id)
			return false;
		return true;
	}
	
	
	
	
	
}  
