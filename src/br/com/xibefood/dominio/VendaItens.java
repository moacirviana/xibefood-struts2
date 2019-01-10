package br.com.xibefood.dominio;

import java.io.Serializable;
import java.text.NumberFormat;
import java.util.Locale;

import javax.persistence.Column;
import javax.persistence.EmbeddedId;
import javax.persistence.Entity;
import javax.persistence.Table;


@Entity
@Table(name="venda_itens")
public class VendaItens implements Serializable{
	private static final long serialVersionUID = -2532832645100036153L;

	@EmbeddedId
	private VendaItemPK id = new VendaItemPK(); 
	
	/*
	@ManyToOne(cascade = CascadeType.PERSIST, optional = true, fetch = FetchType.EAGER)
	@JoinColumn(name = "id_venda")
	private Venda venda;
	
	@OneToOne(optional = true, fetch = FetchType.EAGER)
	@JoinColumn(name = "id_produto", referencedColumnName = "id", nullable = true)
	private Produto produto;
	*/
	
	@Column(nullable=false)
    private int quantidade;
	
	@Column(name="desconto", columnDefinition="Decimal(10,2) default '0.00'")
	private Double desconto;
	
	@Column(name="valor")
	private Double valor;
	
	@Column(name="valorunt")
	private Double valorunt;
	
	@Column(name="obs")
	private String obs; 
		
	public VendaItens() {
	}
	
	public VendaItens(Venda venda, Produto produto, int quantidade, Double desconto, Double valor, Double valorunt, String obs) {
		super();
		this.id.setVenda(venda);
		this.id.setProduto(produto);
		this.quantidade = quantidade;
		this.desconto = desconto;
		this.valorunt = valorunt;
		//this.valor = valor;
		this.valor = (this.quantidade * this.valorunt);
		//this.valorunt = valorunt;
		this.obs = obs;
	}

	public Double getSubTotal() {
		//return ( (this.valorunt - this.desconto) * this.quantidade);
		return ( (this.valorunt) * this.quantidade);
     }

	public Venda getVenda() {
		return this.id.getVenda();
	}
	 
	public void setVenda(Venda venda) {
	  this.id.setVenda(venda);	
	}
	
	public void setProduto(Produto produto) {
		  this.id.setProduto(produto);	
	}
	
	public Produto getProduto() {
		return this.id.getProduto();
    }

	public VendaItemPK getId() {
		return id;
	}

	public void setId(VendaItemPK id) {
		this.id = id;
	}

	public int getQuantidade() {
		return quantidade;
	}

	public void setQuantidade(int quantidade) {
		this.quantidade = quantidade;
	}

	public Double getDesconto() {
		return desconto;
	}

	public void setDesconto(Double desconto) {
		this.desconto = desconto;
	}

	public Double getValor() {
		return valor;
	}

	public void setValor(Double valor) {
		this.valor = valor;
	}

	public Double getValorunt() {
		return valorunt;
	}

	public void setValorunt(Double valorunt) {
		this.valorunt = valorunt;
	}

	public String getObs() {
		return obs;
	}

	public void setObs(String obs) {
		this.obs = obs;
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
		VendaItens other = (VendaItens) obj;
		if (id == null) {
			if (other.id != null)
				return false;
		} else if (!id.equals(other.id))
			return false;
		return true;
	}
	
	@Override
	public String toString() {
		NumberFormat nf = NumberFormat.getCurrencyInstance(new Locale("pt", "BR"));
		StringBuilder builder = new StringBuilder();
		builder.append(getProduto().getDescricao());
		builder.append(", Qte: ");
		builder.append(getQuantidade());
		builder.append(", Preço unitário: ");
		builder.append(nf.format(getValorunt()));
		builder.append(", Subtotal: ");
		builder.append(nf.format(getSubTotal()));
		builder.append("\n");
		return builder.toString();
    }
	
}
