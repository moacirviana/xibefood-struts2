package br.com.xibefood.dominio;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

import org.hibernate.annotations.GenericGenerator;

import com.sun.istack.internal.NotNull;


@Entity
@Table(name="cliente")
public class Cliente implements Serializable{
	private static final long serialVersionUID = 6896926711370612575L;

	@Id
	@GeneratedValue(strategy=GenerationType.AUTO, generator="native")
	@GenericGenerator(name = "native", strategy = "native")
	private Integer id;
	
	@NotNull
	@Column(length=100)
    private String email;
	
	@Column(length=100)
    private String nome;
	
    private String cpf;
    
    @Column(name="ativo", columnDefinition="Int default '0'")
    private Integer ativo;
	
	public Cliente() {
		
	}
	
	public Cliente(Integer id, String email, String nome, String cpf, Integer ativo) {
		this.id = id;
		this.email = email;
		this.nome = nome;
		this.cpf = cpf;
		this.ativo = ativo;
	}

	public Cliente(Integer id, String nome) {
		this.id = id;
		this.nome = nome;
	}	

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getNome() {
		return nome;
	}

	public void setNome(String nome) {
		this.nome = nome;
	}

	public String getCpf() {
		return cpf;
	}

	public void setCpf(String cpf) {
		this.cpf = cpf;
	}
	
	public Integer getAtivo() {
		return ativo;
	}

	public void setAtivo(Integer status) {
		this.ativo = status;
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((id == null) ? 0 : id.hashCode());
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
		Cliente other = (Cliente) obj;
		if (id == null) {
			if (other.id != null)
				return false;
		} else if (!id.equals(other.id))
			return false;
		return true;
	}


}
