package br.com.xibefood.DTO;

import java.io.Serializable;

import javax.persistence.Entity;
import javax.persistence.Id;

@Entity
public class ProdutosMaisVendidos implements Serializable {
	private static final long serialVersionUID = 3866298170684177118L;

	@Id
	private int id;
	
	private String descricao;

	private long totalVendidos;

	public ProdutosMaisVendidos(int id, String descricao, long totalVendidos) {
		super();
		this.id = id;
		this.descricao = descricao;
		this.totalVendidos = totalVendidos;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getDescricao() {
		return descricao;
	}

	public void setDescricao(String descricao) {
		this.descricao = descricao;
	}

	public long getTotalVendidos() {
		return totalVendidos;
	}

	public void setTotalVendidos(long totalVendidos) {
		this.totalVendidos = totalVendidos;
	}

	

}
