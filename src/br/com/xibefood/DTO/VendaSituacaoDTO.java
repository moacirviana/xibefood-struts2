package br.com.xibefood.DTO;

import java.io.Serializable;
import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

@Entity
public class VendaSituacaoDTO implements Serializable {
	private static final long serialVersionUID = 3866298170684177118L;

	@Id
	private int id;

	@Temporal(TemporalType.TIMESTAMP)
	private Date datacad;

	private String cliente;

	private String usuario;

	private Double total;

	private Integer status;

	public VendaSituacaoDTO() {
	}

	public VendaSituacaoDTO(int id, Date datacad, String cliente, String usuario, Double total, Integer status) {
		super();
		this.id = id;
		this.datacad = datacad;
		this.cliente = cliente;
		this.usuario = usuario;
		this.total = total;
		this.status = status;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public Date getDatacad() {
		return datacad;
	}

	public void setDatacad(Date datacad) {
		this.datacad = datacad;
	}

	public String getCliente() {
		return cliente;
	}

	public void setCliente(String cliente) {
		this.cliente = cliente;
	}

	public String getUsuario() {
		return usuario;
	}

	public void setUsuario(String usuario) {
		this.usuario = usuario;
	}

	public Double getTotal() {
		return total;
	}

	public void setTotal(Double total) {
		this.total = total;
	}

	public Integer getStatus() {
		return status;
	}

	public void setStatus(Integer status) {
		this.status = status;
	}

		
	

}
